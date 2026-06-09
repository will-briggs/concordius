*← [[Volume A - The Foundation/index|Volume A ← The Foundation]]*

# Paper B0: The Proof (Draft)

---

*The inherited line of mathematics — from the earliest record of counting through the Gelfand triple — and the one object built within it: the truth measure τ, the fraction of a state's spectral energy lying in the nuclear region, with 0 ≤ τ ≤ 1 and the value 1 a limit no proper element of H attains. A proof in the strict sense — granted premises, then a chain of inferences each forced by a defect in the last — closing on an exact account of what is borrowed, what is added, and what is assumed.*

**Confidence —** *Math:* **derivation** — within the inherited, granted rigged-triple apparatus (no new primitive), τ is defined and its two properties (0 ≤ τ ≤ 1; τ = 1 ⟺ ψ ∈ Φ) are exact; the operationalization of the nuclear region N is an open problem, marked as such. *Science:* **— (not engaged)** — no empirical claim; the §2 lineage is historical documentation, reconstructed as far as the record allows (the Lebombo arithmetic reading interpretive, not settled). *Theology:* **— (not engaged)** — no reading is offered; whether τ signifies anything, and the identifications that name these objects, are deferred to Volume A and to the theologian's paper that follows.

---

<figure>
<img src="/static/images/byrne-euclid.jpg" alt="Oliver Byrne's coloured edition of Euclid's Elements (1847)" style="max-width:100%;display:block;margin:0 auto;">
<figcaption><em>Oliver Byrne, The First Six Books of the Elements of Euclid</em> (1847). The emblem of demonstrative method: derive from a granted ground, and declare what is granted.</figcaption>
</figure>

<hr>

<div style="margin-top: 3rem; margin-bottom: 3rem;">

> **"Numbers are the free creations of the human mind."**
> *— Richard Dedekind, "Was sind und was sollen die Zahlen?" (1888)*

</div>

---

## 1. The problem of the ground

Every proof begins with what it does not prove. A system of demonstration takes some terms as primitive and some statements as granted, and derives the rest; the granted statements are its ground. They are not themselves demonstrated — and not for want of care: by a result the Framework takes up in full later, a system rich enough to be interesting cannot certify its own ground from within. The ground of any structure is received and stood upon, never earned.

---

## 2. The lineage, and the structure it forces

By §1, every demonstration starts from granted premises. The premises here are the inherited mathematics, whose line runs unbroken — as far as the record allows — from the earliest record of counting to the nineteenth-century continuum. The oldest such record is the **Lebombo bone**: a baboon fibula of some forty-three thousand years, cut with twenty-nine notches. That the notches tally anything is an inference from their regularity, and the earliest the material will bear; counting is older than the bone, but the record is not, and the line is begun where the evidence is and not before. Taken forward from it as given: written number and the worked arithmetic of the **Babylonian** and **Egyptian** scribes (Plimpton 322, c. 1800 BC); demonstrative *proof from axioms* with **Euclid** (c. 300 BC), the form every step below obeys; algebra (**Diophantus**; **al-Khwārizmī**, whose *al-jabr* names it; **Viète**); analytic geometry (**Descartes**, **Fermat**, c. 1637); the calculus (**Newton**, **Leibniz**) and the analysis built on it, including the study of the vibrating string (**d'Alembert**, **Euler**, **Daniel Bernoulli**, **Lagrange**) out of which Fourier's expansion grew; and the rigorous real continuum (**Dedekind**, **Cantor**) with the **Lebesgue** integral (1902). These are granted. From them the structure the Framework uses is forced, and the forcing is the argument.

**Step 1 — the expansion, and the defect that drives the rest.** A sufficiently regular function can be written as a superposition of the eigenfunctions of a differential operator (**Fourier**, 1822); for −i d/dx these eigenfunctions are the plane waves e^{iξx}. *Defect:* on a continuous spectrum the plane waves are not square-integrable. The eigenfunctions that perform the expansion are not members of the space of the functions they expand. Expansion and basis do not share a home.

**Step 2 — the space, and the defect it leaves.** The square-integrable functions form a complete inner-product space H = L² under ⟨f, g⟩ = ∫ f̄g (**Riesz**, **Fischer**, 1907; abstracted by **Hilbert**), self-dual by the Riesz representation theorem, and carrying the spectral resolution A = ∫ λ dE(λ) for self-adjoint A (**von Neumann**, 1932). This makes the discrete-spectrum case rigorous. *Residual defect:* H still does not contain the continuous-spectrum eigenvectors. **Dirac**'s |x⟩, with ⟨x | x′⟩ = δ(x − x′) (1930), behave exactly as the expansion requires and are not elements of H. The formalism that works is not rigorous in the space that is.

**Step 3 — the standing of the missing eigenvectors.** A non–square-integrable object such as δ is given exact standing as a continuous linear functional on a space of smooth test functions, ⟨δ, φ⟩ = φ(0) (**Schwartz**, 1950). *Inference:* the missing eigenvectors are not flaws in H to be patched but elements of the **dual** of a smaller, more regular space — to be paired against it, not found inside H.

**Step 4 — the regular space.** The space on which that pairing and the required completeness hold is the **nuclear space** (**Grothendieck**, 1955): Φ = ⋂ₖ Hₖ, the maximally regular core of a chain H = H₀ ⊃ H₁ ⊃ ⋯ with Hilbert–Schmidt inclusions.

**Step 5 — the structure, and the removal of every defect.** Steps 2–4 assemble into the **rigged Hilbert space** Φ ⊂ H ⊂ Φ′ (**Gelfand** and **Vilenkin**, 1964; **Maurin**, 1968), on which the **nuclear spectral theorem** holds: a self-adjoint operator rigged by a nuclear Φ has a complete system of generalized eigenvectors e_λ ∈ Φ′, and every ψ ∈ H expands as ψ = ∫ ⟨e_λ, ψ⟩ e_λ dμ(λ). Dirac's |x⟩ are exactly these e_λ; the δ is exactly a distribution. The expansion of Step 1 is now at once rigorous and complete, and the defects of Steps 1 and 2 are gone. The realization in quantum mechanics is **Böhm** and **Gadella** (1989). This is the structure, and every line of it is inherited.

Two facts about the endpoint govern everything after. It was **complete before this Framework existed**: the Framework needs nothing later than 1989, and the contemporary treatment (de la Madrid, 2005) is consistent with it but adds nothing it requires. And it carries one invariant through all three terms of the triple — the **inner product** ⟨·,·⟩, structurally prior to Φ, H, and Φ′ alike. That invariant is the ground the construction stands on, and it is not a ground the Framework cut. The single step in the chain that is the Framework's own is the construction of **§3**.

---

## 3. The one construction

Within this apparatus, and using nothing outside it, the Framework constructs exactly one object, stated here in full in the terms of the rigged Hilbert space alone.

Let Φ ⊂ H ⊂ Φ′ be the triple, ⟨·,·⟩ the inner product, and A a self-adjoint operator with domain in Φ. By the nuclear spectral theorem, every ψ ∈ H admits the expansion

> ψ = ∫ ⟨e_λ, ψ⟩ e_λ dμ(λ),     ‖ψ‖² = ∫ |⟨e_λ, ψ⟩|² dμ(λ),

with {e_λ} ⊂ Φ′ the generalized eigenvectors, dμ the spectral measure (the Parseval identity on the right). The coefficients c(λ) = ⟨e_λ, ψ⟩ carry the state's spectral content and |c(λ)|² its spectral energy at λ. The nuclear space Φ = ⋂ₖ Hₖ stratifies the spectrum into a **nuclear region** N — where the generalized eigenvectors carry content surviving into the deeper Hₖ — and its complement.

**Definition.** For ψ ∈ H,

> τ(ψ) = [ ∫_N |⟨e_λ, ψ⟩|² dμ(λ) ] / ‖ψ‖².

τ(ψ) is the fraction of the state's spectral energy lying in the nuclear region; by construction **0 ≤ τ(ψ) ≤ 1.**

**Two exact properties follow, and only these are claimed as mathematics.**

1. *The upper value is a limit.* τ(ψ) = 1 requires the whole of ψ's spectral energy to lie in the nuclear region — equivalently, that ψ survive into every Hₖ, which is the condition ψ ∈ Φ. Hence **every ψ ∈ H ∖ Φ has τ(ψ) < 1.** The value 1 is the nuclear-space limit: approached by states of increasing regularity, attained by no proper element of the substrate H.

2. *τ is a functional of the inner product alone.* The expansion, the measure, the chain {Hₖ}, and the region N are fixed once ⟨·,·⟩ and A are given. τ introduces no new space, no new axiom, no new theorem; it is a quantity definable inside the apparatus §2 credits to others.

What is **not** settled here, and is marked plainly: the exact specification of the nuclear region N for a given application — the cut that makes τ computable on a particular object rather than well defined only in form — is an open problem. The form of the measure is exact; its operationalization is not, and the paper that puts the measure to use carries that open question, not this one.

This functional is the single mathematical contribution of the Framework. Everything else in the mathematics is borrowed.

---

## 4. Borrowed, added, assumed

The line can now be drawn exactly, in three terms rather than two.

**Borrowed:** the whole apparatus of §2 — the triple, the inner product, the Riesz and spectral theorems, the nuclear-space construction. Classical, complete, not in dispute. To contest it is to contest Gelfand, not this Framework.

**Added:** the functional τ of §3, and it alone. It is *derivable within the borrowed apparatus* — a definition, not a discovery; it proves no theorem the named figures did not, and could have been written down by any of them. It adds no mathematics in that it introduces no primitive; it adds exactly one object in that the object had not been written before. Both are true and are held together.

**Assumed:** everything past the form of τ. Whether this functional signifies anything — whether it answers to some feature of what is real, and what that feature would be — is not a mathematical question and is not touched here. That is the *reading*, and it is no part of this paper. The reading is not new in any case: it is the single assumption laid down at the foundation — that reality may be modeled by this structure at all ([[Paper A0: Modeling Reality as a Gelfand Triple]]) — named again where the Framework confesses the one thing it cannot establish from within. The identifications that interpret the apparatus — that name what these objects are — are made where they belong: in Volume A, and, for the terms by which this measure will be read, in the theologian's paper that follows ([[Paper B1: The Sacred Trust]]). No reading is introduced here: the mathematics is fixed, and there it rests.

---

## 5. The baseline

Hence the name. A baseline, in the work of measurement, is the one precisely fixed line from which every other distance is taken; no ruler runs until the baseline is laid. The Framework is about to measure objects it did not make — texts, lives, the record of the past, claims of every provenance — and τ is the instrument it will use. The integrity of that measuring requires the instrument and its reference to be fixed and declared before a single object is read. They are fixed here: the inner product as the invariant the whole structure rests on; the nuclear region as the distinguished region the measure reads against; and, as a property of the inner product itself, a floor that is not zero — positive-definiteness assigns every nonzero state of H strictly positive value, so no state the measure weighs sits at zero. Above that floor runs the axis along which τ reads, to the nuclear limit it cannot reach.

This Framework' distinction at the foundational level is small and exact: the mathematics it uses is borrowed and finished, the one thing it builds is a definition within that mathematics, and the only thing it asks a reader to grant is the assumption it has already named. It has added no stone to the wall but one cut to true, and it has said, precisely, which stone is theirs, which is its own, and which is granted.

---

## References

Böhm, A., and Gadella, M. (1989). *Dirac Kets, Gamow Vectors and Gel'fand Triplets.* Springer.

Dirac, P. A. M. (1930). *The Principles of Quantum Mechanics.* Oxford University Press.

Fourier, J. (1822). *Théorie analytique de la chaleur.* Firmin Didot.

Gelfand, I. M., and Vilenkin, N. Ya. (1964). *Generalized Functions, Vol. 4: Applications of Harmonic Analysis.* Academic Press.

Grothendieck, A. (1955). *Produits tensoriels topologiques et espaces nucléaires.* Memoirs of the American Mathematical Society 16.

Hilbert, D. (1912). *Grundzüge einer allgemeinen Theorie der linearen Integralgleichungen.* Teubner.

Lebesgue, H. (1902). Intégrale, longueur, aire. *Annali di Matematica Pura ed Applicata* 7, 231–359.

Maurin, K. (1968). *General Eigenfunction Expansions and Unitary Representations of Topological Groups.* Polish Scientific Publishers.

Reed, M., and Simon, B. (1972). *Methods of Modern Mathematical Physics, Vol. 1: Functional Analysis.* Academic Press.

Riesz, F. (1907–09). On the representation of continuous linear functionals; the completeness of L² (Riesz–Fischer).

Schwartz, L. (1950–51). *Théorie des distributions.* Hermann.

von Neumann, J. (1932). *Mathematische Grundlagen der Quantenmechanik.* Springer.

*The lineage is reconstructed as far as the record allows; the intellectual debts among these works are layered and not always cleanly documented, and the line above names the principal contributors, not every tributary. The Lebombo dating is archaeological, and the arithmetic reading of its markings is interpretive, not settled; it is cited as the oldest surviving record of counting, no more. The real continuum the analysis presupposes is the work of Dedekind and Cantor. The contemporary standard treatment of the rigged Hilbert space in quantum mechanics (de la Madrid, 2005) is consistent with the structure used here but is not required by it.*

---

*[[Paper B1: The Sacred Trust|Paper B1: The Sacred Trust]] →*
