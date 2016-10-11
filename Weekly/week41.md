# Week 41

## What has been done

### Tasks

* Work plan sent to Wolfgang and he approved it, he also thought an optimistic approach would be good. (Though unsure if he understood how optimistic it was, might need to step by his office and talk to him.)

* Working on the correctness-proof and think I've made some headway on a better version for the models. Will upload a model so you can preview it.

### Thesis

* Found several good surveys/articles for background and comparison, decided on comparing it with UPPAAL but unsure if I require another comparison. Feel that a comparison between two good tools would suffice? (Others were CADP and NuSvM)

* Begin writing 'Scope & Limitations'

### Successes

Found that the book by Ben-Ari is a good resource for the LTL-properties and Promela (and it's accessible online).

### Setbacks

* I'm uncertain how you meant the proof should look, can't find much help on defining one on paper using induction and the problem for me is abstracting which parts are relevant for a proof? How can a typical LTL-proof for induction on a system look? Current work has been on verifying it with SPIN but I'm reaching state-explosions on more than 3 nodes at the moment.

* Haven't written design-chapter yet since the research into another model checker was quite cumbersome and I felt it was necessary to properly write the sections (as I didn't have enough knowledge to write it yet).

* Scope and Limitations is quite cumbersome, have compared my own ideas to others' thesises and realized that it was more writing than I had anticipated. Will work partly on it for several weeks instead.

## Specific questions

Can I borrow the book from your office this week? Since they apparently want mine back a week early. 

Also some knowledge into what parts of the program are relevant(or some general pointers from an article/lecture or such) for an induction proof would be helpful. In a program-setting I'm feeling unsure how to write it. 

## Work plan for the following week

### Tasks

* Abstract(/reduce) the model so I can test it for larger sets of collection nodes. Currently only 3 is verifiable.

* Define 'Correctness' and 'Liveness'

### Thesis

* Write the known parts of the design-chapter (first two sections). Comparing SPIN to UPPAAL, if more are required they could be added later. 

* Write on 'Scope & Limitations'

