import { loadQuartzConfig, loadQuartzLayout } from "./quartz/plugins/loader/config-loader"
import * as ExternalPlugin from "./.quartz/plugins"

// Explicit nav ordering for folders that have no index.md (node.data is null),
// so they cannot carry frontmatter tags. Keyed by the folder's displayName.
// These are the Structural Readings philosophy/wisdom/literature/esoteric folders.
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
  // Check tags array for nav-order::N
  const tags: string[] = node.data?.tags ?? []
  for (const tag of tags) {
    const m = tag.match(/^nav-order::(\d+)$/)
    if (m) return parseInt(m[1], 10)
  }
  // Fall back to hardcoded name map (for folders without index.md)
  const byName = NAV_ORDER_BY_NAME[node.displayName]
  if (byName != null) return byName
  return null
}

ExternalPlugin.Explorer({
  sortFn: (a, b) => {
    const aOrder = getNavOrder(a)
    const bOrder = getNavOrder(b)

    // If either node has an explicit nav-order, use that.
    // This overrides the folders-before-files default so that e.g.
    // "The Framework and Method" (a file, nav-order::1) sorts before
    // "A Structural Reading of the Bible" (a folder, nav-order::2).
    if (aOrder != null || bOrder != null) {
      if (aOrder != null && bOrder != null) return aOrder - bOrder
      // One has order, the other doesn't — the ordered item comes first.
      if (aOrder != null) return -1
      return 1
    }

    // Default: folders before files, then numeric-aware alphabetical sort.
    if (a.isFolder !== b.isFolder) return a.isFolder ? -1 : 1
    return a.displayName.localeCompare(b.displayName, undefined, {
      numeric: true,
      sensitivity: "base",
    })
  },
})

const config = await loadQuartzConfig()
export default config
export const layout = await loadQuartzLayout()
