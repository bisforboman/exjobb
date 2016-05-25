# Data Minimization in distributed applications for more privacy 

## Introduction

With the increasing trend of connected devices, the network of these devices are often called Internet of Things or IoT for short, where everything from lightbulbs to thermostats can be controlled by an app.  The exposure of these devices to the internet makes a lot of that data available to the end user but also to malicious users due to the devices leaking more data than intended or by bad design. This puts the end user at risk, violating its privacy and leaking sensitive data the malicious users who can siphon the data. One simple and obvious way to prevent leakages and misuses of personal data is to collect less of this data. However, this solution is rarely used in practice because of business models relying on personal data harvest on one hand and because of the difficulty to enforce once it is defined what is actually needed to provide a service. 

## Context 

Privacy is utterly important for the development of IoT applications, Miorandi et al. gives several reasons [1], “The main reasons that makes privacy a fundamental IoT requirement lies in the envisioned IoT application domains and in the technologies used. Healthcare applications represent the most outstanding application field, whereby the lack of appropriate mechanisms for ensuring privacy of personal and/or sensitive information has harnessed the adoption of IoT technologies.“ Where if these problems would be solved the area could expand even further. 

In a report from Medaglia et al., they list some examples on solutions for IoT development [2], “For example, mobile devices could adopt silent mode when entering a meeting room if this is the request of the meeting moderator, alert the user and turn off the radio before entering sensitive medical areas or detect when the user enters the car and connect to its sound system.”. But also raises interesting questions regarding privacy; who decides when a device should be turned on/off, how will the decider know that a device should be turned on/off and how will this decision be communicated?

Also in a paper from Weber [3], he examplified situations concerning privacy, "The attribution of tags to objects may not be known to users, and there may not be an acoustic or visual signal to draw the attention of the object’s user. Thereby, individuals can be followed without them even knowing about it and would leave their data or at least traces thereof in cyberspace. Thereby, individuals can be followed without them even knowing about it and would leave their data or at least traces thereof in cyberspace. Further aggravating the problem, it is not anymore only the state that is interested in collecting the respective data, but also private actors such as marketing enterprises." Which clearly explains the problems with weak privacy. 

The lack of privacy in these devices makes this subject an important one especially with the increasing number of IoT devices. Miorandi et al. [1] thinks it is one of the key issues, along with security, with IoT devices makes the subject of this thesis a relevant one.  

## Goals & Challenges

The aim of the master thesis is to investigate ways to improve privacy of Wireless Sensor Network (WSN) applications using data minimization. Meaning the project will seek to improve privacy in distributed networks by limiting the amount of personal data being processed. 

The main goal for the project will be to define how a decision should be reached, meaning to have an application analyze its' collected data and reach a conclusion that a decision should be taken. 

With the broad usage of different applications, each having different levels of sensitive data, finding a good limit that ensures sufficient privacy for it's users will be the greatest challenge.

## Approach

Implementation and validation will be done on simulated Wireless Sensor Networks, using e.g. SPIN, prototypes will then be used to simulate applications collecting data and development will focused on finding algorithms to limit the amount of data processed. Validation will then seek to ensure that decisions are communicated and the sought outcome is achieved, meaning the decisions aren't ignored.

In a paper from Li et al. [4], they discuss an active approach to avoid overcollection of data. Where the focus resides in not allowing applications to gain access to more data then they require for it's purpose. This proposes a permission-based solution, whereas this project instead will seek to make the application limit itself from collecting more than it would require. 

As a starting point, I will consider a WSN where data is collected by sensors and then centrally processed by a server. Here the decision would be processed by the central unit and then propagated back to the sensors. When the features of the decisions is characterized, I would then look at introducing distributed computation capabilities in the network - e.g. by adding aggregators to manage a set of sensors or equipping all sensors with a computation unit to allow each of them to make decisions. To make a decision, a computation unit would need to know the following; what should be computed, how it should be computed and what has already been computed. This will allow the unit to decide if further processing is needed. 

As a basis for decisions, I will look at related work in energy management for WSNs, where similiar decisions are used to improve energy savings e.g. Keshavarzian et al [5]. 

A preliminary plan for the project is as follows:

1. Formalise the properties of the simulated WSNs, with constraints I make and guarantees I expect. (2 weeks)

2. Installing and setup of the development environment. (1 week) 

3. Begin development on the core features of the algorithm by the following steps. (8 weeks)
    1. Specification
    2. Development
    3. Validation

4. When the algorithm works for the core features, I'll add more features and follow the same workflow as in 3. (7 weeks)

5. Polishing the implementation and finalising the report. (2 weeks)

Writing of the final report is interleaved with the other work throughout the entire project.

## Ethics

We are aware that our thesis will include some ethical questions since we investigate the possibility to implement better privacy for the end user. We believe that making IoT devices collect less data makes the end user more inclined to use it. Thereby helping both the customers and the manufacturers. We also understand that this would make sensitive data more difficult to be leaked which should be the interest for all parties involved. 

Finally we understand that it also disrupts current business models, that uses data mining to better refine their products, but we are confident that helping to increase the privacy of IoT devices is for the benefit of everyone. 


## References

[1] Miorandi, Daniele, et al. "Internet of things: Vision, applications and research challenges." Ad Hoc Networks 10.7 (2012): 1497-1516.

[2] Medaglia, Carlo Maria, and Alexandru Serbanati. "An overview of privacy and security issues in the internet of things." The Internet of Things. Springer New York, 2010. 389-395.

[3] Weber, Rolf H. "Internet of Things–New security and privacy challenges." Computer Law & Security Review 26.1 (2010): 23-30. 

[4] Li, Yibin, et al. "Privacy protection for preventing data over-collection in smart city." (2015).
