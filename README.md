# Data Minimization in distributed applications for more privacy 

## Introduction

The presence of connected devices in our environment is increasing. These devices form a network often called Internet of Things (or IoT for short), where everything from lightbulbs to thermostats can be controlled by an app or by another device. These services make a lot of that data available to the end user but also to malicious parties due to the devices leaking more data than intended or by bad design. This puts the end user at risk, violating its privacy and leaking sensitive data. One simple and obvious way to prevent leakages and misuses of personal data is to collect less of this data, a principle known as data minimisation. However, this solution is rarely used in practice because of business models relying on personal data harvest on one hand and because of the difficulty to enforce it once it is defined what is actually needed to provide a service. 

## Context 

Privacy is utterly important for the development of IoT applications, Miorandi et al. gives several reasons [1]: “The main reasons that makes privacy a fundamental IoT requirement lies in the envisioned IoT application domains and in the technologies used. Healthcare applications represent the most outstanding application field, whereby the lack of appropriate mechanisms for ensuring privacy of personal and/or sensitive information has harnessed the adoption of IoT technologies.“ Adressing this issue is thus particularly important for this area to expand further. 

In a report from Medaglia et al., they list some examples on solutions for IoT development [2]: “For example, mobile devices could adopt silent mode when entering a meeting room if this is the request of the meeting moderator, alert the user and turn off the radio before entering sensitive medical areas or detect when the user enters the car and connect to its sound system.” This also raises interesting questions regarding privacy: who decides when a device should be turned on or off? How will the decider know that a device should be turned on or off and how will this decision be communicated and enforced in the network?

Also in a paper from Weber [3], he examplified situations concerning privacy, "The attribution of tags to objects may not be known to users, and there may not be an acoustic or visual signal to draw the attention of the object’s user. Thereby, individuals can be followed without them even knowing about it and would leave their data or at least traces thereof in cyberspace. Thereby, individuals can be followed without them even knowing about it and would leave their data or at least traces thereof in cyberspace. Further aggravating the problem, it is not anymore only the state that is interested in collecting the respective data, but also private actors such as marketing enterprises." This clearly explains the problems occurring when privacy concerns are weakly taken into account.

The lack of privacy due to these devices makes this topic an important one especially with the increasing number of IoT devices. Miorandi et al. [1] think it is one of the key issues, along with security. As such, studying and improving privacy in IoT devices makes the subject of this thesis a current and relevant one.  

## Goals & Challenges

The aim of the master thesis is to investigate ways to improve privacy of a specific kind of IoT devices known as Wireless Sensor Networks (WSN). WSN are networks of autonomous sensors and actuators. The goal to enhance privacy for this kind of devices will be addressed by relying on data minimisation. This means the project will seek to improve privacy in distributed networks by limiting the amount of personal data processed. 

The main goal for the project will be to define how a decision about data collection should be made, meaning to have an application (potentially distributed) analyzing the collected data and reaching a conclusion which has to be enforced by the devices. 

With the broad usage of different applications, each having different levels of sensitive data, finding a good limit that ensures sufficient privacy for its users while satisfying the expected functionality at the same time will be the greatest challenge.

## Approach

In a paper from Li et al. [4], they discuss an active approach to avoid overcollection of data. The focus resides in not allowing applications to gain access to more data then they require for its purpose. They propose a permission-based solution, whereas this project instead will seek to make the application limit itself the access to the data from the very first step of the data lifecycle which is the collection. The restriction is thus ensured depending on the service to deliver, and not based on an access rights model.

As a starting point, I will consider a WSN where data is collected by sensors and then centrally processed by a server. Here the decision would be processed by the central unit and then propagated back to the sensors. Once the features of the decision procedure is characterized in this simple setting, I will then look at introducing more distributed computation capabilities in the network - e.g. by adding aggregators to manage a set of sensors or equipping all sensors with a computation unit to allow each of them to make decisions. To this aim, a computation unit would need to know what should be computed, how it should be computed and what has already been computed. This will allow the unit to decide if further collection is needed. 

The properties of the decision procedure will be formally verified and examplified through an implementation. The validation may rely on different techniques such as proofs on the algorithms of model checking. The implementation will propose a prototype simulating a WSN at work. Validation will then seek to ensure that decisions are communicated and the sought outcome is achieved, meaning the decisions are enforced.

As a basis for decision procedures, a good starting point in terms of related work may be in energy management for WSNs, where similiar decisions are used to improve energy savings as is shown in Keshavarzian et al [5]. 

## Ethics

We are aware that our thesis will include some ethical questions since we investigate the possibility to implement better privacy for the end user. We believe that making IoT devices collect less data makes the end user more inclined to use it, thereby helping both the customers and the manufacturers. We also understand that this would make sensitive data more difficult to be leaked which should be of interest for all the parties involved. 

Finally we understand that it also disrupts current business models, that uses data mining to better refine their products, but we are confident that helping to increase the privacy of IoT devices is for the benefit of everyone. 


## References

[1] Miorandi, Daniele, et al. "Internet of things: Vision, applications and research challenges." Ad Hoc Networks 10.7 (2012): 1497-1516.

[2] Medaglia, Carlo Maria, and Alexandru Serbanati. "An overview of privacy and security issues in the internet of things." The Internet of Things. Springer New York, 2010. 389-395.

[3] Weber, Rolf H. "Internet of Things–New security and privacy challenges." Computer Law & Security Review 26.1 (2010): 23-30. 

[4] Li, Yibin, et al. "Privacy protection for preventing data over-collection in smart city." (2015).

[5] Keshavarzian, Abtin, Huang Lee, and Lakshmi Venkatraman. "Wakeup scheduling in wireless sensor networks." Proceedings of the 7th ACM international symposium on Mobile ad hoc networking and computing. ACM, 2006.
