# Master Thesis

## Abstract

The presence of connected devices in our environment is increasing. These devices form a network often called Internet of Things (or IoT for short), where everything from lightbulbs to thermostats can be controlled by an app or by another device. These services make a lot of that data available to the end user but also to malicious parties due to the devices leaking more data than intended or by bad design. This puts the end user at risk, violating its privacy and leaking sensitive data. One simple and obvious way to prevent leakages and misuses of personal data is to collect less of this data, a principle known as data minimisation. However, this solution is rarely used in practice because of business models relying on personal data harvest on one hand and because of the difficulty to enforce it once it is defined what is actually needed to provide a service.

## Introduction

In this thesis I investigated ways to improve privacy in a special kind of IoT devices known as Wireless Sensor Networks (WSN). WSN are networks of autonomous sensors and actuators. The goal to enhance privacy for this kind of devices will be addressed by relying on data minimisation. This means the project sought to improve privacy in distributed networks by limiting the amount of personal data being processed.  



## Background

### Problem Definition 

*What is the problem we're trying to solve?*



*state assumption that less communicated data gives less potential security breaches.*

#### Overcollection

*Examples and issues related to it.*

Over-collection is the event when a process collects more data than it requires to function properly. The event is very example-specific and will depend heavily upon collection-process but some basic examples of over-collection can be: 

*Maybe include an example of a process here?*

#### Decisions

*What is a decision? How are they communicated?*

A decision is the message sent through the network stating which action should be taken when over-collection is occuring. This can for example mean that the server is telling one (or several) collection nodes that they should shut down or wait until sending again. If the nodes are also computing data they can still be kept doing so but without sending communication throughout the network until notified again. The source of the decision depends on if the network has a centralized processing unit (f.e. a master-slave relation) or if computations are decentralized and each processing unit makes decision on their own and uses communication to forward processed data to a storage server. 

### Motivation

*Why is this work important?*

## Approach

*explain the agile process with a simple example first and then construct a larger.*

### Problem study

*What models did I look at?*

The starting point of the thesis was to formulate how a basic WSN could look and when it could reach a state of over-collection. So the most basic case for a network was:

*show simple illustration of a network with a centralized server and 1 or several nodes.*

The setting for the example was that if the server received a value that was considered too high, a decision (a message) was sent to all nodes in the network which made the nodes shut down. 

This example gave some context to some abstractions, as formulated in a functional setting could be defined as:

Service :: data\
State :: data\
Decision :: (data x data) -> data\
Collection :: IO data\

Where the Decision is the conjugation of the Service and the State and the Collection is the process of interpreting raw data. 

*was this relevant to mention?*

This gave the idea to characterize different networks, to generalize the decisions. The following binary properties were considered: 

**Centralized or Decentralized:** If the network had a centralized source of computations or if f.e. each collection node had their own computating unit.

**One or multiple nodes:** If the network had the trivial case of one collection node or if it had several.

**Conjuctive or Disjunctive decision:** If the decision was based on data from several different sources or if a decision could be taken on just a single data-set.

*could be more on this*

#### Centralized Models

#### Decentralized Models

#### Models in Promela

#### LTL Properties

### Algorithm design

How did I go about designing the algorithms?
#### Code Generation

#### Validation

### Verification

#### SPIN

## Ethics

The ethics of the work.

## References

References.

