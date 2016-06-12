# Work Plan for the Project

## Introduction

_Simply an introduction to the project. The headers below might be redudant..._



### Background

_pasted from proposal_

The presence of connected devices in our environment is increasing. These devices form a network often called Internet of Things (or IoT for short), where everything from lightbulbs to thermostats can be controlled by an app or by another device. These services make a lot of that data available to the end user but also to malicious parties due to the devices leaking more data than intended or by bad design. This puts the end user at risk, violating its privacy and leaking sensitive data. One simple and obvious way to prevent leakages and misuses of personal data is to collect less of this data, a principle known as data minimisation. However, this solution is rarely used in practice because of business models relying on personal data harvest on one hand and because of the difficulty to enforce it once it is defined what is actually needed to provide a service.

### Purpose

The goal will be to present a working WSN example using decisions, meaning if a program reaches a state where it's considered over-collecting, a decision will be communicated and acknowledged by the network so the proceedure leaves the unwanted state.  

### Limitations

_What stuff do I disregard?_

In wireless networks there are several issues that could occur, such as packet-losses or malfunctioning nodes. I will analyse different issues and discuss their repercussions but the model will not be built to withstand them. Also, performance will not be an area of focus.

## Problem Definition
_Here the problems/questions that should be answered or dealt with throughout the project be formulated._

The focus of the master thesis is to attempt to increase privacy by making Wireless Sensor Networks collect less data (prevent over-collection). The way I expect to do so is by using 'Decisions'. The idea is to make a node stop collecting data for periods of time, to minimize the communication needed in the network. With decisions being vaguely defined, some effort will be required to define them and how they should be handled to properly be able to analyze the results in the network. 

The master thesis will aim to answer the following questions throughout the project:

* Will better privacy be achieved?
* What is a 'Decision'?
* Does the changes demand new mechanisms to sustain the same level of security? 
  * What new attacks does the new implementations make possible?
  * What other demands does this place on the network?

#### Privacy
_What is privacy? How will it be handled in the project?_

Privacy in the sense of communication means that sensitive information between to two parties shouldn't be accessible by a third party. In the sense of this project we will regard all communication as sensitive and seek to achieve better privacy by reducing the amount of communication in the network. 

_discuss what privacy gives/its importance_

#### Over-collection
_Explain what it means in this setting._

When an application collects more data than would be required for it to function as intended, it's considered to over-collect. For instance, when an application collects data outside it's original scope to use for other purposes or when it collects data that doesn't yield the process more information of the observed state. 

#### Decisions

A decision is one of the core elements of the project. The idea of a decision is to let the processing unit analyze a stream of data and realize that currently enough data is collected and it can let the collection pause for a while. In a small example with only one processing unit this is would be communication from the central unit (the server) to the collection units (the nodes). For instance, if the server sees that the incoming data is not yielding more information of the observed state, could be that the data is following a linear pattern, an outgoing message could be that the nodes should stop sending more data until they observe data outside a certain threshold.

## Approach

_Will be similar to the previous approach section except it will be rewritten to match the problem definition._

The first step will be to conduct some theoretical studies to help properly define the WSNs I will be working with. This is to make sure nothing crucial will be missed when the implementation begins. With this in mind, I will define the features of the algorithms I will be developing. Some features will then be regarded as core features and some features will be put on hold for later. This is due to me using a agile workflow, to help me quickly achieve a working example. Hence the additional features will be added when I have an working alpha version. 

## Timetable

The Gant Schedule can be viewed in an attachment to this document. Below the individual topics are described.

### Administration

The work is first planned out and described in this planning report and the mandatory lectures are estimated. Also some lectures will be attended after the span of the gant schedule. 

### Theoretical Study

This section covers the formalizing and planning on how the theoretical networks will look. Also the decisions will be intially formalized here to have a starting point to work with when implementing them. This definition will likely be revised later on in the project. 

Also when the core features are implemented, I will look at adding possible extensions which are also covered in this section. 

### Implementation

This is the core of the project, where the workflow will first be to construct a code skeleton to work from. The skeleton will define the procedures required for handling the decisions and also contain the other features of the WSN. When this is done, the development will begin. Finally I will validate the work so it works as intended. 

### Documentation

Writing of the final report is interleaved with the other work throughout the entire project. Therefore it's shown in the gant schedule as item for basically every week. 

### Presentation

When half the project is completed - hopefully when a working example is completed - a mid presentation is planned for presenting the work. 

At the end of the work, a final presentation is also planned for presenting the master thesis.
