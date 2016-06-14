# Work Plan

## Introduction

This is the planning report for the master thesis "Data Minimization in distributed applications for more privacy" conducted at the department of Computer Science and Engineering at the Chalmers University of Technology. This report will explain the difficulties at hand and how they will be solved. 

### Background

The presence of connected devices in our environment is increasing. These devices form a network often called Internet of Things (or IoT for short), where everything from lightbulbs to thermostats can be controlled by an app or by another device. These services make a lot of that data available to the end user but also to malicious parties due to the devices leaking more data than intended or by bad design. This puts the end user at risk, violating its privacy and leaking sensitive data. One simple and obvious way to prevent leakages and misuses of personal data is to collect less of this data, a principle known as data minimisation. However, this solution is rarely used in practice because of business models relying on personal data harvest on one hand and because of the difficulty to enforce it once it is defined what is actually needed to provide a service.

### Purpose

The aim of the master thesis is to investigate ways to improve privacy of a specific kind of IoT devices known as Wireless Sensor Networks (WSN). WSN are networks of autonomous sensors and actuators. The goal to enhance privacy for this kind of devices will be addressed by relying on data minimisation. This means the project will seek to improve privacy in distributed networks by limiting the amount of personal data processed.

The main goal for the project will be to define how a decision about data collection should be made, meaning to have an application (potentially distributed) analyzing the collected data and reaching a conclusion which has to be enforced by the devices. 

### Limitations

In wireless networks there are several issues that could occur, such as packet-losses or malfunctioning nodes. I will analyse different issues and discuss their repercussions but the model will not be built to withstand them. Also, performance or battery-preservation will not be an area of focus.

## Problem Definitions

Below are some definitions that are relevant for formulating the problem.

### Privacy

Privacy in the sense of communication means that sensitive information between to two parties shouldn't be accessible by a third party. As a starting point of this project, we will regard all communication as sensitive and seek to achieve better privacy by reducing the amount of communication in the network. This will intuitively make less communication a more privacy-oriented approach. 

### Over-collection

When an application collects more data than would be required for it to function as intended, it's considered to over-collect. For instance, when an application collects data outside it's original scope to use for other purposes or when it collects data that doesn't yield the process more information of the observed state. 

### Decisions

A decision is one of the core elements of the project. The idea of a decision is to let the processing unit analyze a stream of data and realize that currently enough data is collected and it can let the collection pause for a while. In a small example with only one processing unit this is would be communication from the central unit (the server) to the collection units (the nodes). For instance, if the server sees that the incoming data is not yielding more information of the observed state, could be that the data is following a linear pattern, an outgoing message could be that the nodes should stop sending more data until they observe data outside a certain threshold.

### Problem Statement

The focus of the master thesis is to attempt to increase privacy by making Wireless Sensor Networks collect less data (prevent over-collection). The way I expect to do so is by using 'Decisions'. The idea is to make a node stop collecting data for periods of time, to minimize the communication needed in the network. With decisions being vaguely defined, some effort will be required to define them and how they should be handled to properly be able to analyze the results in the network. 

At the end of the project there are several questions that I will seek to have answered. Firstly, how can a decision be formulated and what uses can it have? This will be a wide and very important question for the project, since this will yield the impact of the project. Secondly, what impacts will the changes have on the existing system? I will consider an already stable network and when introducing new functionality one can always expect that new security risks can occur. So basically what new security measures that needs to be introduced. Lastly, will better privacy be achieved? This is the core idea of the project and will be the climax of thesis.

## Approach

The first step will be to conduct some theoretical studies to help properly define the WSNs I will be working with. This is to make sure nothing crucial will be missed when the implementation begins. Secondly, I will start sketching on how decisions should be formulated. As a starting point I will look at research regarding energy management in WSNs, where similar decisions are used. _insert ref?_

With this in mind, I will define the features of the algorithms I will be developing. Some features will then be regarded as core features and some features will be put on hold for later. This is due to the use of an agile workflow, to help me quickly achieve a working example. Furthermore, additional features will be added when I have an working alpha version. With each features added, validation will be performed to make sure they are working as intended. 
