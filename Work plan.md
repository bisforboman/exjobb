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


The gant scheduled is a separate attachment to this work plan, below is the elements described.
_describe the schedule_

### Administration

The work is first planned out and described in this planning report and the mandatory lectures are estimated. Also some lectures will be attended after the span of the gant schedule. 

### Theoretical Study

This section covers the formalizing and planning on how the theoretical networks will look. Also the decisions will be intially formalized here to have a starting point to work with when implementing them. This definition will likely be revised later on in the project. 

Also when the core features are implemented, I will look at adding possible extensions which are also covered here. 

### Implementation

This is the core of the project, where the workflow will first be to construct a code skeleton to work from. The skeleton will define the procedures required for handling the decisions and also contain the other features of the WSN. When this is done, the development will begin. Finally I will validate the work so it works as intended. 

### Documentation

Writing of the final report is interleaved with the other work throughout the entire project. Therefore it's shown in the gant schedule as item for basically every week. 

### Presentation

When half the project is completed - hopefully when a working example is completed - a mid presentation is planned for presenting the work. 

At the end of the work, a final presentation is also planned for presenting the master thesis.
