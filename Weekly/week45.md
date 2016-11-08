# Week 43

## What has been done

### Tasks

* Resolving issues with the liveness-verification

### Thesis

* Aim & Limitations

* Wrote on specification-chapter.

~~* Design-chapter~~

~~* Definitions - Decisions~~

### Successes & Setbacks

(Both) Liveness' accept labels - I've found the source to the problem with the accept-labels and I'm not sure how to resolve them. I don't think Environment/Node can have accepting states according to how SPIN verifies them. *more on this below*

(Both) Liveness formulation - From what I could come up with by myself, I formulated the liveness as follows: `<> dC || [] always !sC` but this feels like trivial, since I know `sC -> dC` but I can't find a better formulation for it.

## Specific questions

According to the SPIN-book (p. 84): "The implicit correctness claim that is expressed by the presence of an accept-state label is that there should not exist any executions that can pass through an accept-state label infinetely often." - So I guess the only accept-label I can have is for the server-state where it begins to shutdown the nodes? (the overcollection state)

Is the liveness-formulation I'm using even useable? It feels like a `dC || !dC`-formulation. 

## Work plan for the following week

### Tasks

* Either construct a proof for the liveness or rework it(?)

### Thesis

* Design-chapter

