# Work Plan for the Project

## Introduction

_Simply an introduction to the project. The headers below might be redudant..._

### Background

### Purpose

### Limitations

_What stuff do I disregard?_

In wireless networks there are several issues that could occur, I analyse different issues and discuss their repercussions but the model will not be built to withstand them. Such issues could be:

_List some various troubles with WSNs here._

## Problem Definition
_Here the problems/questions that should be answered or dealt with throughout the project be formulated._

The focus of the master thesis is to attempt to increase privacy by making Wireless Sensor Networks collect less data (prevent over-collection). The way I expect to do so is by using 'Decisions'. The idea is to make a node stop collecting data for periods of time and the order to do so would be a 'Decision'. With this vague definition, I will also have to spend time to define the attributes of a decision and how they should be handled to properly be able to analyze the results in the network.

The master thesis will aim to answer the following questions throughout the project:

* Will better privacy be achieved?
* Does the changes demand new mechanisms to sustain the same level of security? 
  * What new attacks does the new implementations make possible?
  * What other demands does this place on the network?
* What is a 'Decision'?
* How should it be formalized? 

#### Privacy
_What is privacy? How will it be handled in the project?_

Privacy in the sense of communication means that sensitive information between to two parties shouldn't be accessible by a third party. In the sense of this project we will regard all communication as sensitive and seek to achieve better privacy by reducing the amount of communication in the network. 

#### Over-collection
_Explain what it means in this setting._

When an application collects more data than would be required for it to function as intended, it's considered to over-collect. For instance, when an application collects data outside it's original scope to use for other purposes or when it collects data that doesn't yield the process more information of the observed state. 

## Approach

_Will be similar to the previous approach section except it will be rewritten to match the problem definition._

## Timetable

_Will consist of a gant-schedule and explanation of the different sections in it._

1. Formalise the properties of the simulated WSNs, with constraints I make and guarantees I expect. (2 weeks)

2. Installing and setup of the development environment. (1 week) 

3. Begin development on the core features of the algorithm by the following steps. (8 weeks)
    1. Specification
    2. Development
    3. Validation

4. When the algorithm works for the core features, I'll add more features and follow the same workflow as in 3. (7 weeks)

5. Polishing the implementation and finalising the report. (2 weeks)

Writing of the final report is interleaved with the other work throughout the entire project.
