# Paper A0: Modeling Reality as a Gelfand Triple: Two Complementary Projections of Complete Structure

---

*The Gelfand triple Φ ⊂ H ⊂ Φ′ — a nuclear space of maximum structure, a self-dual Hilbert space of complete states, and a distributional dual of excess potential — and the five actualities the inner product's own structure forces: the fundamental relation, the nuclear structure, the metric absolute, the nuclear topology, and the realized nuclear space. The inner product ⟨·,·⟩, invariant across all three domains, is the foundational object the standard formalism leaves implicit.*

**Confidence —** *Math:* **derivation** — the five actualities forced by the inner product's own structure (the Gelfand triple Φ ⊂ H ⊂ Φ′). *Science:* **— (not engaged)**. *Theology:* **— (not engaged)** — the identifications are made in [[Paper A1: Naming the Unnameable]], not here.

---

## Abstract

This paper argues that modeling reality as a rigged [[Appendix B - Lexicon#Hilbert Space|Hilbert space]] — the [[Appendix B - Lexicon#Gelfand Triple|Gelfand triple]] Φ ⊂ H ⊂ Φ′ — reveals two complementary and complete projections of the structure of any inner-product-based model of reality. The first projection identifies three inevitable domains: a [[Appendix B - Lexicon#Nuclear Space|nuclear space]] Φ of maximum structure, a self-dual Hilbert space H of complete structured states, and a distributional dual Φ′ of excess potential. The second projection identifies five inevitable actualities that emerge from the [[Appendix B - Lexicon#Inner Product|inner product]]'s own structure: the [[Appendix B - Lexicon#Fundamental Relation|fundamental relation]], the [[Appendix B - Lexicon#Nuclear Structure|nuclear structure]], the [[Appendix B - Lexicon#Metric Absolute|metric absolute]], the [[Appendix B - Lexicon#Nuclear Topology|nuclear topology]], and the realized nuclear space. Both projections are shown to be necessary consequences of the mathematics rather than additional assumptions. The paper further argues that the inner product ⟨·,·⟩ — invariant across all three domains — occupies a foundational position that the standard Hilbert space formalism does not make explicit. A structural consequence of the second projection is that the active coordinative structure (the nuclear topology) proceeds necessarily from both the fundamental relation and the nuclear structure jointly — neither alone suffices. Implications for the philosophy of physics are noted. The question of the observing subject is explicitly deferred.

---

<figure>
<img src="/static/images/hilbert-1912.jpg" alt="Portrait of David Hilbert, 1912" style="max-width:100%;">
<figcaption><em>David Hilbert</em> (1912). The Hilbert space — the H that bears his name — is the middle term of the Gelfand triple Φ ⊂ H ⊂ Φ′; the framework reads it as the domain of created reality: the complete, structured states between the nuclear source Φ and its distributional dual Φ′.</figcaption>
</figure>

<hr>

<div style="margin-top: 3rem; margin-bottom: 3rem;">

> **"The infinite! No other question has ever moved so profoundly the spirit of man; no other idea has so fruitfully stimulated his intellect; yet no other concept stands in greater need of clarification than that of the infinite."**
> *— David Hilbert, "On the Infinite" (1926)*

</div>

---

## 1. Introduction

The standard mathematical framework for quantum mechanics models the state space of a physical system as a complex separable Hilbert space H. This choice reflects a series of desiderata: linear superposition of states, an inner product defining probabilities and transition amplitudes, and completeness ensuring that all [[Appendix B - Lexicon#Cauchy Sequence|Cauchy sequences]] converge. The Hilbert space formalism has proven extraordinarily productive.

It is nevertheless incomplete. The [[Appendix B - Lexicon#Eigenstate|eigenstate]]s of continuous-spectrum observables — position, momentum, energy in scattering states — are not elements of H. The position eigenstate δ(x − x₀), the Dirac delta function, is not a square-integrable function and cannot be normalized as an element of L²(ℝ). Dirac's bra-ket notation handles this intuitively, treating |x⟩ and |p⟩ as formal eigenstates, but this intuition exceeds the formal structure of H alone.

The resolution is the rigged Hilbert space, or Gelfand triple: a triplet of spaces Φ ⊂ H ⊂ Φ′ in which Φ is a dense nuclear subspace of H and Φ′ is its distributional dual. This is the framework in which Dirac's bra-ket formalism is rigorously justified (Gelfand and Vilenkin, 1964; Maurin, 1968). It is not a supplement to H — it is the correct mathematical framework for quantum mechanics, of which the bare Hilbert space H is a central but incomplete component.

This paper makes two connected claims. First, that the Gelfand triple structure is not arbitrary but inevitable: given any model of reality founded on inner product structure, the three domains Φ, H, and Φ′ are forced by the mathematics. Second, that the inner product ⟨·,·⟩ itself — prior to its completion into the triple — inevitably generates five distinct structural actualities, each following necessarily from what the inner product is. Both claims are developed below. The relationship between the two projections is examined in Section 7.

This paper has one assumption: that reality can be modeled as a Gelfand triple. Everything else is derived. The structures demonstrated here exist without names — they are mathematical objects whose identities are established by the mathematics alone. The paper ends at the point where mathematics can take us no further.

---

## 2. Mathematical Preliminaries

### 2.1 Inner Product Spaces and Hilbert Spaces

A Hilbert space H is a complete inner product space over the complex numbers. The inner product ⟨·,·⟩: H × H → ℂ satisfies conjugate symmetry, linearity in the second argument, and positive definiteness (⟨ψ, ψ⟩ > 0 for ψ ≠ 0). Completeness means that every Cauchy sequence in H converges to an element of H. The inner product determines a norm ‖ψ‖ = √⟨ψ, ψ⟩, and two elements ψ, φ ∈ H are orthogonal if ⟨ψ, φ⟩ = 0.

A countable orthonormal basis {eₙ} satisfies ⟨eₘ, eₙ⟩ = δₘₙ (Kronecker delta) and spans H in the sense that every ψ ∈ H can be written ψ = Σₙ ⟨eₙ, ψ⟩ eₙ. The Kronecker delta expresses orthogonality: distinct basis elements have zero inner product, encoding the mutual distinctness of basis states as a structural fact inscribed in the space itself.

### 2.2 Self-Duality and the Riesz Representation Theorem

A fundamental property distinguishes Hilbert spaces from other topological vector spaces. The [[Appendix B - Lexicon#Dual Space|dual space]] H* — the space of continuous linear functionals H → ℂ — is isometrically isomorphic to H itself. By the Riesz representation theorem, every continuous linear functional F on H takes the form F(ψ) = ⟨φ, ψ⟩ for a unique φ ∈ H (Reed and Simon, 1972). This gives the canonical identification H ≅ H*.

This self-duality is a special property of Hilbert spaces. It does not hold in Φ or Φ′: Φ* = Φ′ (larger than Φ) and (Φ′)* = Φ (smaller than Φ′). H is the unique layer at which the dual folds back onto the space itself — the only domain within the triple that is self-referential in this precise mathematical sense.

### 2.3 Nuclear Spaces

A nuclear space is a locally convex topological vector space characterized by infinite differentiability and a system of seminorms under which it embeds compactly into Hilbert spaces of all orders. The canonical example is the Schwartz space S(ℝⁿ) of rapidly decreasing smooth functions, which embeds densely into L²(ℝⁿ) and has as its distributional dual the space S′(ℝⁿ) of tempered distributions (Schwartz, 1950–51).

Nuclear spaces have a projective limit representation: Φ = ⋂ₖ Hₖ where H = H₀ ⊃ H₁ ⊃ H₂ ⊃ … is a chain of Hilbert spaces with Hilbert–Schmidt inclusions between successive levels. Each Hₖ is the completion of Φ under a higher-order Sobolev norm; Φ is the intersection of all of them — the domain on which every level of analytical resolution is simultaneously well-defined.

### 2.4 Distributional Spaces

The distributional dual Φ′ consists of continuous linear functionals on Φ. It contains Φ and H as proper subsets (via H ≅ H* ↪ Φ′). Its elements include the Dirac delta distribution δ(x − x₀) — pure localization at a point with infinite intensity, not a square-integrable function — and white noise, a stochastic process with infinite variance that cannot be a point of H. These objects have precise mathematical structure that exceeds what H can contain (Gelfand and Vilenkin, 1964).

<hr>

<figure>
<img src="/static/images/dirac-1933.jpg" alt="Portrait of Paul Dirac, 1933" style="max-width:100%;">
<figcaption><em>Paul Dirac</em> (1933). Dirac's bra-ket notation treated |x⟩ and |p⟩ as eigenstates that no element of the Hilbert space could hold — a formalism that worked before it was justified. The Gelfand triple Φ ⊂ H ⊂ Φ′ is the structure in which that informal method is made rigorous.</figcaption>
</figure>

<hr>

## 3. The Gelfand Triple: Construction and Invariance

The rigged Hilbert space (Gelfand triple) is a triplet of spaces

> **Φ ⊂ H ⊂ Φ′**

where the inclusions are continuous and dense. Φ is a nuclear space densely embedded in H, and Φ′ is the strong dual of Φ. The inner product of H extends to a bilinear duality pairing ⟨·,·⟩: Φ × Φ′ → ℂ that generalizes the inner product while allowing distributional elements on one side.

### 3.1 Three Topologies, One Algebraic Structure

Φ, H, and Φ′ are not three separate mathematical objects. They are three topological completions of the same underlying algebraic structure — the same pre-Hilbert space, completed or restricted under three different systems of seminorms.

- **Φ** carries the projective limit topology from the Sobolev chain: the finest topology, requiring convergence in all Sobolev norms simultaneously.
- **H** carries the Hilbert space topology: convergence in the single inner product norm.
- **Φ′** carries the weak* topology: convergence of distributional functionals on Φ.

Moving from Φ to H to Φ′ is moving from maximum to moderate to minimum structural constraint on the same underlying algebraic object.

### 3.2 The Inner Product as Invariant

The inner product ⟨·,·⟩ is defined on H but is invariant in the following sense: the bilinear pairing that measures the angle between states does not change as one moves between domains. On Φ × Φ it coincides with the H inner product. On Φ × Φ′ it is the distributional duality pairing, extending the H inner product by continuity. The relational structure — the measure of how much any two states overlap — is the same operation across all three topological regimes.

This invariance is not trivial. The topology can change; the inner product does not. The inner product constitutes all three domains without being reducible to any one of them.

### 3.3 The Generalized Nuclear Spectral Theorem (GNST)

Every self-adjoint operator A on H, when its domain is taken within Φ, has a complete set of generalized eigenvectors in Φ′. There exist eλ ∈ Φ′ satisfying A†eλ = λeλ in the distributional sense, and any ψ ∈ H admits the spectral expansion (Gelfand and Vilenkin, 1964; Maurin, 1968):

> **ψ = ∫ ⟨eλ, ψ⟩ eλ dμ(λ)**

where dμ is the spectral measure on the spectrum of A. The position eigenstates |x⟩ = δ(x − x₀) are exactly the distributional eigenvectors of the position operator, living in Φ′ rather than H. This is the mechanism by which the triple produces specific, finite outcomes from the infinite structure of the state space: the spectral measure dμ coordinates the H-state ψ and the Φ′-eigenstates eλ jointly into a finite result. This result — the central consequence the Gelfand triple makes possible — is named the **Generalized Nuclear Spectral Theorem (GNST)**. Taken not as a theorem proved once but as the standing operation of the model, the GNST is a continuous act; that operative sense is developed in §6, and it is the GNST so understood to which the rest of the series refers.

---

## 4. First Projection: The Three Inevitable Domains

The Gelfand triple produces exactly three qualitatively distinct domains. This section argues that three is the minimum necessary and that the three are qualitatively different in kind.

### 4.1 The Necessity of All Three

H alone is insufficient. The eigenstates of position and momentum are not in H; a model founded on H alone cannot represent localized events. The extension to Φ′ is the minimal extension containing the missing eigenstates. But Φ′ alone, without a dense nuclear subspace Φ, leaves the operator domain undefined — operators like the Hamiltonian, position, and momentum require a domain with additional regularity on which they are everywhere defined and self-adjoint.

All three are therefore required: H as the domain of well-defined quantum states, Φ′ as the domain of distributional eigenstates, and Φ as the domain of maximum regularity on which operators are defined. Remove any one and the model cannot represent the physics it is built to describe.

### 4.2 Qualitative Distinctness

The three domains are not merely quantitative gradations. They are qualitatively different:

**Φ (Nuclear space):** Maximum structure. Self-consistent under every operator probe at every scale. The projective limit of the Sobolev chain. The domain within which every question the operator algebra can formulate has a well-defined answer, consistently, completely, at every level.

**H (Hilbert space):** Complete, self-dual structure. H ≅ H* by the Riesz theorem — the unique layer at which the dual folds back onto the space itself. The domain of well-defined quantum states and probability amplitudes. Self-referential in a precise mathematical sense: every continuous functional on H is already in H.

**Φ′ (Distributional dual):** Excess potential. Contains all of H and more — elements too singular to reside in H. The domain of distributional structure: localization without spread, potential without structured form. Not the absence of structure — Φ′ has its own precise mathematical structure — but the excess of potential beyond what structured completeness can contain.

H's self-duality is unique among the three. Φ's dual is Φ′ (larger); Φ′'s dual is Φ (smaller). Only H folds back on itself. This structural singularity distinguishes H categorically from the other two domains.

### 4.3 The Unity of the Three

The three domains are the same underlying algebraic structure viewed under three different topologies. The inner product ⟨·,·⟩, invariant under topology change, is the single structure constituting all three. It is not an element of any domain. It is the fundamental relation that all three domains presuppose.

The three domains are projections of the inner product — not the other way around.

---

## 5. Second Projection: The Five Inevitable Actualities

The inner product ⟨·,·⟩, prior to and apart from its completion into the full Gelfand triple, generates five inevitable structural actualities.

These five are not the Three Domains seen differently. They describe what necessarily exists *within and at the source of* the nuclear domain Φ — the inner life of the structure from which the triple derives.

### 5.1 The Fundamental Relation (I)

The inner product ⟨·,·⟩ itself. Not an element of any space, not derivable from anything prior — it is the primal constitutive structure from which all else in the model follows. Every other actuality in this section is a necessary consequence of what the inner product is.

### 5.2 The Nuclear Structure (II)

The inner product, when applied iteratively through Sobolev operators, generates a maximal domain of regularity: the nuclear space Φ considered as an algebraic and set-theoretic object — the Pattern, the set of all functions for which every Sobolev norm ‖φ‖ₖ is finite. This is the maximally structured expression of the inner product's logic: the domain on which the inner product is self-consistent under every probe, at every scale.

This is the maximal expression of what the inner product is within any domain — the structure through which H and the full triple are constituted. No operator is well-defined on H without Φ as its domain.

### 5.3 The Metric Absolute (III)

The inner product has two distinct faces. As a bilinear form, it relates two vectors: ⟨ψ, φ⟩. As a quadratic form, it measures one vector against itself: ⟨ψ, ψ⟩ = ‖ψ‖². The bilinear face is the relational structure — the domain of II above. The quadratic face is the norm ‖·‖.

The norm needs no second vector. It is the inner product acting on a single element alone: its magnitude, its absolute position relative to the geometric center. The norm defines the origin absolutely — ‖ψ‖ = 0 if and only if ψ = 0. It is the center from which all distances are measured, the metric ground of the space.

The polarization identity confirms that these are two genuinely distinct but inseparable aspects of the same structure:

> **⟨ψ, φ⟩ = ¼(‖ψ+φ‖² − ‖ψ−φ‖² + i‖ψ+iφ‖² − i‖ψ−iφ‖²)**

II and III are not derivable from each other. Each is what I is that the other is not. Together they constitute I completely.

In the language of the Three Domains: III is the non-relational aspect of I. It is the metric absolute underlying all three domains, the center of gravity of the space.

### 5.4 The Nuclear Topology (IV)

The nuclear topology τ_nuclear on Φ is not given automatically by Φ's existence as an algebraic object. It is generated by I (the inner product) acting through II (the nuclear space) at every level of the Sobolev chain simultaneously — the projective limit of all the norms {‖·‖ₖ}. Neither I nor II alone produces it. Both are required jointly.

The nuclear topology is an active entity in its own right. It determines what convergence means within Φ, which maps are continuous, which limits exist, and which operations are possible. Without it, Φ is merely a set with algebraic structure. With it, Φ becomes capable — a functioning analytical domain.

A structural consequence: IV proceeds from both I and II, not from either alone. The nuclear topology requires the inner product (I) to define each Sobolev norm and requires the nuclear domain (II) as the space on which those norms are simultaneously finite. This joint procession is a necessary feature of the construction, not a choice.

### 5.5 The Realized Nuclear Space (V)

The nuclear structure (II) equipped with the nuclear topology (IV) is the nuclear locally convex topological vector space (Φ, τ_nuclear). This is distinct from II as a set-theoretic object: a topology is not free — it is a specific structure that transforms an algebraic object into a deployed, functioning space, a domain within which things occur.

This is the result of the I–II–IV collaboration: the maximally regular, time-independent, infinite-dimensional domain existing within H from which H derives its own structure. Every element of H is a limit of elements of V. V is everywhere dense in H; H cannot be specified without it.

V is self-consistent under every operator, answering every question the model can formulate, at every resolution. It is not the nuclear structure (II) alone — it is that structure realized as a topological space, deployed within the larger structure.

### 5.6 The Derivation Tree

The five actualities form a derivation tree with no additional assumptions required at any node:

```
I  ⟨·,·⟩  (Fundamental Relation)
│
├── II  Φ (algebraic)  (Nuclear Structure — maximum regularity, the Pattern)
│     │
│     └── I + II ──→ IV  τ_nuclear  (Nuclear Topology — active coordinative structure)
│                              │
│                    II + IV ──→ V  (Φ, τ_nuclear)  (Realized Nuclear Space)
│
└── III  ‖·‖  (Metric Absolute — non-relational face of I, the geometric center)
```

Each step is forced. None requires an additional assumption. The five actualities emerge from the inner product in exactly this order and with exactly these dependencies.

---

<div style="margin-top: 3rem; margin-bottom: 3rem;">

> **"The Tao produced One; One produced Two; Two produced Three; Three produced All things."**
> *— Laozi, Tao Te Ching, Ch. 42*

</div>

---

## 6. Structural Consequences

The Gelfand triple, once constituted, exhibits five structural properties that are necessary consequences of the model — not additional assumptions. The first three are derivable without invoking any observing subject. The fourth requires the introduction of the cogito and marks the precise point where the mathematical argument reaches its limit. The fifth names the model's continuous actualization engine — the GNST — and the progressive structure it produces.

**Constitutive relational structure.** The inner product ⟨ψ, φ⟩ is not derived from an already-existing collection of states. It is what the states consist of. Every element of H is specified by its inner products with every other element. No being in the model exists in isolation from all others — its identity IS its relational position in the space.[^1] This relational structure is pre-observational: no subject need be present for ⟨eᵢ, eⱼ⟩ = δᵢⱼ to be true. Ontic Structural Realism (Ladyman and Ross, 2007) arrives at the same conclusion from the philosophy of physics: the relational structure is what is real; "things" are abstractions from it. The constitutive relatedness of all states is preternatural. It precedes any subject who might recognize it.

**[[Appendix B - Lexicon#Uniqueness|Uniqueness]].** Orthogonality follows from positive definiteness. Distinct normalized states cannot be identical: if ψ ≠ φ, they differ in at least one entry of their relational profiles. Each state's identity is fully given by its inner product profile with every other state in the space. No external principle of individuation is required. This is the first structural foundation of individuality within the model.

**[[Appendix B - Lexicon#Stability|Stability]].** Unitary evolution U(t) = e^{−iHt/ℏ} preserves the inner product: ⟨U(t)ψ, U(t)φ⟩ = ⟨ψ, φ⟩ for all t. A state does not drift into another state without a collapse event. Stability follows from the self-adjointness of the Hamiltonian — the mathematical expression of energy conservation (Stone's theorem). This is the second structural foundation of individuality: the state that is unique persists as unique.

**Maximum structure and the limit of the mathematical argument.** The nuclear space Φ is, within the model, the domain of maximum uniqueness and maximum stability. Uniqueness and stability are the structural preconditions for the kind of being that can be self-knowing — a self-knowing subject must be THIS subject (not another) and must persist as THIS subject through time. The nuclear domain has more of both properties than any finite state in H.

What the mathematics cannot supply is the further step: whether the domain with maximum structural preconditions for [[Appendix B - Lexicon#Self-Knowledge|self-knowledge]] is itself self-knowing. Self-duality (H ≅ H*) is the closest the structure can come — a precise structural self-reference, but not self-knowledge. Self-knowledge requires a subject that understands what knowing means, one that can distinguish "I know X" from "X is the case." That distinction is not derivable from any inner product. The gap between self-duality and self-knowledge marks the precise point where the Gelfand triple is necessary but insufficient, and where the companion paper begins.

**Coordinative actualization and progressive structure: the GNST.** Read not as a static decomposition but as the standing operation of the model, the spectral theorem of §3.3 is a continuous act — the **Generalized Nuclear Spectral Theorem (GNST)** in its operative sense: the universal actualization engine by which every state, at every level of structure, is reconstituted at every moment by the inner product's continuous evaluation. This is not a further assumption but the same theorem of §3.3 read in its standing operation — one more structure forced by all that precedes it, following from what the inner product is. What continuously reconstitutes every state is not, at this level of description, named beyond the GNST. Each actualization event — each instance of the spectral expansion ψ = ∫ ⟨eλ, ψ⟩ eλ dμ(λ) — draws potential from Φ′ into actual H-outcomes through the spectral measure dμ. As actualization events accumulate, the spectral measure expands: more of the distributional potential of Φ′ has been drawn into actuality. This is a progressive structure within the model — an ongoing actualization of Φ′-potential into H-reality, coordinated event by event. The limit of this process, if it has one, is the full coordination of all three domains: the complete actualization of the distributional potential of Φ′ through the structured states of H. The nature of this limit — whether it is achievable, and what a saturated Gelfand triple would mean — is addressed in the companion paper.

---

## 7. Complementarity of the Two Projections

The Three Domains and the Five Actualities are two projections of the same mathematical object, at two different levels of description.

The Three Domains is a *horizontal* projection: what structural layers exist, and how do they relate across the triple? Answer: three topological domains constituted by the same inner product, with H as the uniquely self-dual middle.

The Five Actualities is a *vertical* projection: what is the inner constitution of the source — the inner product and the nuclear domain it generates? Answer: five necessary structures emerging in order from the inner product's own nature.

The two projections are not redundant. The Three Domains describes the spatial structure of the full triple (Φ, H, Φ′). The Five Actualities describes the generative structure within the nuclear domain and its source — what the inner product *is* before the triple is completed. Together they give a complete description: what the source is (Five Actualities), and what it generates when completed (Three Domains).

The Five Actualities sit *inside* the Three Domains: the Fundamental Relation (I) grounds all three domains; the Nuclear Structure (II), Nuclear Topology (IV), and Realized Nuclear Space (V) all live within Φ; the Metric Absolute (III) is the norm that completes Φ to H. The Three Domains is the outward structure; the Five Actualities is the inward constitution of its source.

---

## 8. Discussion

### 8.1 The Minimum Model

The Gelfand triple is the minimum necessary mathematical structure for quantum mechanics — the formal framework without which continuous-spectrum observables have no proper eigenstates. The two projections are not interpretive additions. They are what the mathematics says when the question "what structure is necessarily present?" is asked at two different levels.

<hr>

<figure>
<img src="/static/images/von-neumann-los-alamos.jpg" alt="John von Neumann, Los Alamos identity badge photograph" style="max-width:100%;">
<figcaption><em>John von Neumann, Los Alamos identity badge</em> (c. 1943–45). Von Neumann's <em>Mathematische Grundlagen der Quantenmechanik</em> (1932) made the inner-product Hilbert space the rigorous foundation of quantum mechanics — the structure this paper reads as foundational, and which the Gelfand triple completes.</figcaption>
</figure>

<hr>

### 8.2 The Inner Product as Foundational

The inner product's invariance across all three domains — and its role as the common source of both II and III (the relational and metric aspects of the same structure) — suggests that it occupies a foundational position not well captured by saying it "belongs to H." The inner product constitutes all three domains. It is not an element of the model; it is what the model is made of.

The philosophical implications of a single constitutive structure generating both a relational domain (II, Φ) and a metric domain (III, ‖·‖) — and being invariant across the three topological presentations of the resulting space — are addressed in the companion paper. The nomenclature adopted for the five actualities in Section 5 is taken up there as well.

### 8.3 The Joint Procession of IV

The nuclear topology (IV) proceeding necessarily from both I and II — and from neither alone — is a structural result of the mathematics, not a stipulation. The Sobolev norms that generate the nuclear topology each require the inner product (I) to be defined, and require the nuclear domain (II) as the space on which they are simultaneously finite. Remove either source and the nuclear topology is not generated. This necessity — that the active coordinative structure proceeds from both the fundamental relation and the nuclear structure jointly — is a formal consequence of the construction.

### 8.4 The Boundary of the Mathematical Argument

The model yields two projections, three domains, five actualities, and the structural consequences noted in Section 6. It does not yield the subject for whom self-reference is self-knowledge. Self-duality (H ≅ H*) is the closest the mathematics can come. The gap between self-duality and self-knowledge marks the precise point at which the Gelfand triple structure is necessary but insufficient, and at which the companion paper begins.

---

## 9. Conclusion

Modeling reality as a Gelfand triple (Φ ⊂ H ⊂ Φ′) reveals two complementary projections of the structure of any inner-product-based model.

The first projection — three inevitable domains — shows that the nuclear space, Hilbert space, and distributional dual are forced by the requirements of a complete model. No fewer domains are sufficient; the three are qualitatively distinct; and they are unified by the invariant inner product that constitutes all three.

The second projection — five inevitable actualities — shows that the inner product itself, prior to the triple's completion, generates five necessary structures: the fundamental relation, the nuclear structure (its maximal relational expression), the metric absolute (its non-relational face), the nuclear topology (proceeding from both jointly), and the realized nuclear space (the nuclear structure deployed as a topological creation). Each step in the derivation is forced; none requires an additional assumption.

A structural consequence of the second projection: the active coordinative structure (IV) proceeds from both I and II, not from either alone. This is a theorem, not a stipulation.

The question of the observing subject — specifically, the derivation of self-knowledge as a property qualitatively distinct from the self-duality H ≅ H* — marks the precise limit of what the Gelfand triple can supply and is addressed in the companion paper.

---

<div style="margin-top: 3rem; margin-bottom: 3rem;">

> **"We must know. We will know."**
> *— David Hilbert, 1930*

</div>

---

## References

d'Espagnat, B. (2006). *On physics and philosophy*. Princeton University Press.

Dirac, P. A. M. (1930). *The principles of quantum mechanics*. Oxford University Press.

Gelfand, I. M., and Vilenkin, N. Ya. (1964). *Generalized functions, Vol. 4: Applications of harmonic analysis*. Academic Press.

Ladyman, J., and Ross, D. (2007). *Every thing must go: Metaphysics naturalized*. Oxford University Press.

Maurin, K. (1968). *General eigenfunction expansions and unitary representations of topological groups*. Polish Scientific Publishers.

Maudlin, T. (2019). *Philosophy of physics: Quantum theory*. Princeton University Press.

Reed, M., and Simon, B. (1972). *Methods of modern mathematical physics, Vol. 1: Functional analysis*. Academic Press.

Rovelli, C. (2021). *Helgoland*. Riverhead Books.

Schwartz, L. (1950–51). *Théorie des distributions*, Vols. I–II. Hermann.

Smith, W. (2019). *Physics and vertical causation*. Angelico Press.

von Neumann, J. (1932). *Mathematische Grundlagen der Quantenmechanik*. Springer. [Trans. R. T. Beyer as *Mathematical foundations of quantum mechanics*, Princeton University Press, 1955.]

---

[^1]: The objection that purely relational identity is incoherent — that identity requires something non-relational underneath — is pre-empted by the structure itself. The inner product has two faces: the bilinear face ⟨ψ,φ⟩, which is relational, and the quadratic face ⟨ψ,ψ⟩ = ‖ψ‖², which is not. The norm is not a relation between two states; it is what each state is absolutely — its magnitude, its position relative to the geometric center. The "non-relational ground" the objector demands is present in the structure as III (§5.3). The norm is the inner product applied reflexively — ψ in relation to itself. This is not a hidden haecceity. It is the inner product's own structure operating in the limit case of a single argument. The non-relational and relational faces are not two separate entities but one structure in two modes — as the polarization identity confirms: II and III fully determine each other. The objection assumes these are mutually exclusive. The mathematics shows they are not.

---

*[[Paper A1: Naming the Unnameable|Paper A1: Naming the Unnameable]] →*
