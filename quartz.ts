import { loadQuartzConfig, loadQuartzLayout } from "./quartz/plugins/loader/config-loader"
import * as ExternalPlugin from "./.quartz/plugins"

// IMPORTANT: this sortFn is serialized to a string and eval'd in the browser via new Function().
// All logic MUST be self-contained inside the arrow function body — no external references.
ExternalPlugin.Explorer({
  sortFn: (a, b) => {
    // Explicit ordering for folders that have no index.md (node.data is null),
    // so they cannot carry nav-order tags. Keyed by displayName.
    // These are the Structural Readings folders for each text.
    const NAV_ORDER_BY_NAME: Record<string, number> = {
      "A Structural Reading of Spinoza's Ethics": 3,
      "A Structural Reading of the Enneads": 4,
      "A Structural Reading of Epictetus": 5,
      "A Structural Reading of the Meditations of Marcus Aurelius": 6,
      "A Structural Reading of the Tao Te Ching": 7,
      "A Structural Reading of the Bhagavad Gita": 8,
      "A Structural Reading of Shakespeare's Sonnets": 9,
      "A Structural Reading of the Alchemical Tradition": 10,
      "Appendix": 11,
    }

    function getNavOrder(node: any): number | null {
      // Check tags for nav-order::N
      const tags: string[] = (node.data?.tags as string[]) ?? []
      for (const tag of tags) {
        const m = tag.match(/^nav-order::(\d+)$/)
        if (m) return parseInt(m[1], 10)
      }
      // Fall back to hardcoded name map
      const byName = NAV_ORDER_BY_NAME[node.displayName ?? ""]
      if (byName != null) return byName
      return null
    }

    const aOrder = getNavOrder(a)
    const bOrder = getNavOrder(b)

    // If either node has an explicit order, use it (overrides folder/file distinction).
    if (aOrder != null || bOrder != null) {
      if (aOrder != null && bOrder != null) return aOrder - bOrder
      if (aOrder != null) return -1
      return 1
    }

    // Default: folders before files, then numeric-aware alphabetical sort.
    if (a.isFolder !== b.isFolder) return a.isFolder ? -1 : 1
    return (a.displayName ?? "").localeCompare(b.displayName ?? "", undefined, {
      numeric: true,
      sensitivity: "base",
    })
  },
})

const config = await loadQuartzConfig()
export default config
export const layout = await loadQuartzLayout()
