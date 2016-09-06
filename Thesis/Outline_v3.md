# outline_v3

## Abstract

The presence of connected devices in our environment is increasing. These devices form a network often called Internet of Things (or IoT for short), where everything from lightbulbs to thermostats can be controlled by an app or by another device. These services make a lot of that data available to the end user but also to malicious parties due to the devices leaking more data than intended or by bad design. This puts the end user at risk, violating its privacy and leaking sensitive data. One simple and obvious way to prevent leakages and misuses of personal data is to collect less of this data, a principle known as data minimisation. However, this solution is rarely used in practice because of business models relying on personal data harvest on one hand and because of the difficulty to enforce it once it is defined what is actually needed to provide a service.

## Acknowledgements

*of course I will acknowledge everyone that helped me finish the MT.*

## Introduction

### Motivation

*motivation, might be obsolete*

### Aim

In this thesis I investigated ways to improve privacy in a special kind of IoT devices known as Wireless Sensor Networks (WSN). WSN are networks of autonomous sensors and actuators. The goal to enhance privacy for this kind of devices will be addressed by relying on data minimisation. This means the project sought to improve privacy in distributed networks by limiting the amount of personal data being processed.

### Scope and Limitations

*explain what I didnt consider*

### Thesis Structure

*explain the order that things are presented of the thesis*

## Background

### Wireless Sensor Network (WSN)

*explain WSNs and their usage* 

### Over-collection

Over-collection is the event when a process collects more data than it requires to function properly. The event is very example-specific and will depend heavily upon collection-process but some basic examples of over-collection can be: 

### Data Minimization

As defined by the EDPS (European Data Protection Supervisor); "The principle of “data minimization” means that a data controller should limit the collection of personal information to what is directly relevant and necessary to accomplish a specified purpose. They should also retain the data only for as long as is necessary to fulfil that purpose. In other words, data controllers should collect only the personal data they really need, and should keep it only for as long as they need it." 

### Promela

Promela stands for **PR**ocess **ME**ta **LA**nguage. It was used for the development of this project since it allows for formal verification and I had previous experience in it.

### SPIN

SPIN stands for **S**imple **P**romela **IN**terpreter. It's the verification program that was used for this course since it's explicitly built for verifying promela code. 

### Related Work
#### Smart City

## Specification
### Decisions

A decision is a control message sent through the network forcing an action to be taken, in this report that's mainly when over-collection is occuring. This can for example mean that the server is telling one (or several) collection nodes that they should shut down or wait until sending again. If the nodes are also computing data they can still be kept doing so but without sending communication throughout the network until notified again. The source of the decision depends on if the network has a centralized processing unit (f.e. a master-slave relation) or if computations are decentralized and each processing unit makes decision on their own and uses communication to forward processed data to a storage server. 

### Defining the models
#### Modeling in Promela
#### Code Generation
### LTL Properties
### Decisions

## Design
### Algorithm design
### Decisions

## Verification 
### LTL Properties

## Discussion 

## Conclusion

## Ethics

## Table of References
