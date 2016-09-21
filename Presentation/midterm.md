# Midterm Presentation

This document is just some notes to help present the part of the work leading up to the midterm presentation in the master thesis. Wolfgang asked for:

* Current progress
* What's next in the scope
* Some relation to the work plan
 
So here's a document, structured for that purpose.

## Progress

Mainly I think my documentation (the report) has fallen behind more than I expected. It's been hard properly documenting what I've done and I've had to spend considerable time lately catching up on it. But I think my current model is at a good state and I think my properties are valid.

## Coming up

Next part will be the implementation, where I will use a code-generation tool to generate C-code from my promela code on the different models. When this is done I will continue with validating my code. 

Then I will reiterate the process with an extended model. 

I will have to read up some more on distributed algorithms, since I haven't taken a course in it, which I believe will be the first step in when the work on the extended model begins.

## Relate to the work plan

### Theoretical Study & Practical Study

#### Study the problem

Most this week was spent looking at related articles for the work to see if I could find any other approaches to this problem. The best one I found was on 'Smart City'. 

*Is there any point for me to dive further into this?*

#### Formulation of the problem

To help formulating the problem I approached the problem from another angle, perhaps not the best one but it helped me atleast. I started by formulating a simple dummy example, to understand how a decision could be used in a context. This would help me come up with different usages for the decisions. So the variations of systems that I came up with were: 

* Single node / Multiple nodes
* Decentralized / Centralized 
* Conjunctive decision / Disjunctive decision

With this in mind, I choosed to focus on networks consisting of:

* A server (a central unit)
* An environment from where the data was collected
* One or multiple nodes

Where for the inital model I focused on systems with disjunctive and centralized / decentralized decisions. With this I mean systems where the decision could be taken by data from a single collection node and the system either took the decision on a central level (from the server) or a decentralized level (e.g. a node). 

With this I created a promela model which was, as described above, a model with one node, one server and one environment. The promela syntaxing and limitations took a lot of time to get used to. With this code shell I created a total of 4 models, with the different variations: 

* One or multiple nodes
* Decentralized / centralized decision

Which I used to test my LTL properties on. Later on I also added a version where the program didn't terminate, to model a more realistic version of the system (since WSNs aren't expected to stop). 

Recently we realized that my model could evolve into a simpler version by removing a lot of non-relevant parts. So currently my model looks like: *image on paper*



#### Prove correctness

I had several attempts at the correctness proving, I believe my idea of the formula was correct but was poorly formulated the first times so the completion of it took longer than expected. Once I got the correct idea though it was applied to the model and it seems to work.

The correctness, as described in the report was formulated: 

> When the decision is sent, the collection will eventually stop.

Which was translated into: 

> always (M implies (eventually D))

Where **M** and **D** corresponds to the event that the message is sent and the collection is stopped respectively. 

Also liveness was added as a formula, this wasn't planned to be included in the first model but we decided it was a good idea to add it now. It was formulated as:

> The program shall collect until overcollection has occured.

Which became:

> always (not D until M)

Properties to be included in the extended model: Fairness.
