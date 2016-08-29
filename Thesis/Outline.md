# Master Thesis

## Abstract

The presence of connected devices in our environment is increasing. These devices form a network often called Internet of Things (or IoT for short), where everything from lightbulbs to thermostats can be controlled by an app or by another device. These services make a lot of that data available to the end user but also to malicious parties due to the devices leaking more data than intended or by bad design. This puts the end user at risk, violating its privacy and leaking sensitive data. One simple and obvious way to prevent leakages and misuses of personal data is to collect less of this data, a principle known as data minimisation. However, this solution is rarely used in practice because of business models relying on personal data harvest on one hand and because of the difficulty to enforce it once it is defined what is actually needed to provide a service.

## Introduction

In this thesis I investigated ways to improve privacy in a special kind of IoT devices known as Wireless Sensor Networks (WSN). WSN are networks of autonomous sensors and actuators. The goal to enhance privacy for this kind of devices will be addressed by relying on data minimisation. This means the project sought to improve privacy in distributed networks by limiting the amount of personal data being processed.  

*should perhaps contain some more text*

## Background

Privacy is utterly important for the development of IoT applications, Miorandi et al. gives several reasons [1]: “The main reasons that makes privacy a fundamental IoT requirement lies in the envisioned IoT application domains and in the technologies used. Healthcare applications represent the most outstanding application field, whereby the lack of appropriate mechanisms for ensuring privacy of personal and/or sensitive information has harnessed the adoption of IoT technologies.“ Adressing this issue is thus particularly important for this area to expand further.

In a report from Medaglia et al., they list some examples on solutions for IoT development [2]: “For example, mobile devices could adopt silent mode when entering a meeting room if this is the request of the meeting moderator, alert the user and turn off the radio before entering sensitive medical areas or detect when the user enters the car and connect to its sound system.” This also raises interesting questions regarding privacy: who decides when a device should be turned on or off? How will the decider know that a device should be turned on or off and how will this decision be communicated and enforced in the network?

Also in a paper from Weber [3], he examplified situations concerning privacy, "The attribution of tags to objects may not be known to users, and there may not be an acoustic or visual signal to draw the attention of the object’s user. Thereby, individuals can be followed without them even knowing about it and would leave their data or at least traces thereof in cyberspace. Thereby, individuals can be followed without them even knowing about it and would leave their data or at least traces thereof in cyberspace. Further aggravating the problem, it is not anymore only the state that is interested in collecting the respective data, but also private actors such as marketing enterprises." This clearly explains the problems occurring when privacy concerns are weakly taken into account.

The lack of privacy due to these devices makes this topic an important one especially with the increasing number of IoT devices. Miorandi et al. [1] think it is one of the key issues, along with security. As such, studying and improving privacy in IoT devices makes the subject of this thesis a current and relevant one.

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

* Service :: data
* State :: data
* Decision :: (data x data) -> data
* Collection :: IO data

Where the Decision is the conjugation of the Service and the State and the Collection is the process of interpreting raw data. 

*was this relevant to mention?*

This gave the idea to characterize different networks, to generalize the decisions. The following binary properties were considered: 

* Centralized or Decentralized: If the network had a centralized source of computations or if f.e. each collection node had their own computating unit.
* One or multiple nodes: If the network had the trivial case of one collection node or if it had several.
* Conjuctive or Disjunctive decision: If the decision was based on data from several different sources or if a decision could be taken on just a single data-set.

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

