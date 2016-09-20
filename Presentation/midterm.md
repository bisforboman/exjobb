# Midterm Presentation

This document is just some notes to help present the part of the work leading up to the midterm presentation in the master thesis. Wolfgang asked for:

* Current progress
* What's next in the scope
* Some relation to the work plan
 
So here's a document, structured for that purpose.

## Progress

I think the overall progress is fine, I fell behind the weeks around my re-exams but I have progressed good since then and I think I'm where I expected to be during the midterm. *Maybe just say I think I am where I expected to be?*

I have a set of models now that I form a good basis for simple examples and a decent understanding how my process should look moving forward. 

## Coming up

Next part will be the implementation, where I will use a code-generation tool to generate C-code from my promela code on the different models. When this is done I will continue with validating my code. Then I will reiterate the process with an extended model. I will have to read up some more on distributed algorithms, since I haven't taken a course in it, which I believe will be the first step in when the work on the extended model begins.

## Relate to the work plan

### Theoretical Study

#### Study the problem

Most this week was spent looking at related articles for the work to see if I could find any other approaches to this problem. The best one I found was on 'Smart City'. 

*Is there any point for me to dive further into this?*

#### Formulatation of the problem

This part was more time-consuming than expected, *is this useful to mention?*

To help formulating the problem I approached the problem from another angle, perhaps not the best one but it helped me atleast. I started by formulating a simple dummy example, to understand how a decision could be used in a context. This would help me come up with different usages for the decisions. So the variations of systems that I came up with were: 

* Single node / Multiple nodes
* Decentralized / Centralized 
* Conjunctive decision / Disjunctive decision

With this in mind, I choosed to focus on networks consisting of:

* A server (a central unit)
* An environment from where the data was collected
* One or multiple nodes

Where for the inital model I focused on systems with disjunctive and centralized / decentralized decisions. With this I mean systems where the decision could be taken by data from a single collection node and the system either took the decision on a central level (from the server) or a decentralized level (e.g. a node). 

#### Prove correctness

I had several attempts at the correctness proving, I believe my idea of the formula was correct but was poorly formulated the first times so the completion of it took longer than expected. Once I got the correct idea though it was applied to the model and it seems to work.

The correctness, as described in the report was formulated:

*When the decision is sent, the collection will eventually stop.*

Also liveness was added as a formula, this wasn't planned to be included in the first model but we decided it was a good idea to add it now. It was formulated as:

*The program shall collect until overcollection has occured.*

### Practical Study

#### Design

#### Analyse and rework