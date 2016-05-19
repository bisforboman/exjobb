# Data Minimization in distributed applications for more privacy 

## Introduction

-- this is non-revised

With the increasing trend of connected devices, the network of these devices are often called Internet of Things or IoT for short, where everything from lightbulbs to thermostats can be controlled by an app.  The exposure of these devices to the internet makes a lot of that data available to the end user but also to malicious users due to the devices leaking more data than intended or by bad design. This puts the end user at risk, violating its privacy and leaking sensitive data the malicious users who can siphon the data. One simple and obvious way to prevent leakages and misuses of personal data is to collect less of this data. However, this solution is rarely used in practice because of business models relying on personal data harvest on one hand and because of the difficulty to enforce once it is defined what is actually needed to provide a service. 

## Context 

Privacy is utterly important for the development of IoT applications, Miorandi et al. gives several reasons [1], “The main reasons that makes privacy a fundamental IoT requirement lies in the envisioned IoT application domains and in the technologies used. Healthcare applications represent the most outstanding application field, whereby the lack of appropriate mechanisms for ensuring privacy of personal and/or sensitive information has harnessed the adoption of IoT technologies.“ Where if these problems would be solved the area could expand even further. 

In a report from Medaglia et al., they list some examples on solutions for IoT development [2], “For example, mobile devices could adopt silent mode when entering a meeting room if this is the request of the meeting moderator, alert the user and turn off the radio before entering sensitive medical areas or detect when the user enters the car and connect to its sound system.”. But also raises interesting questions regarding privacy; who decides when a device should be turned on/off, how will the decider know that a device should be turned on/off and how will this decision be communicated?

Also in a paper from Weber [3], he examplified situations concerning privacy, "The attribution of tags to objects may not be known to users, and there may not be an acoustic or visual signal to draw the attention of the object’s user. Thereby, individuals can be followed without them even knowing about it and would leave their data or at least traces thereof in cyberspace. Thereby, individuals can be followed without them even knowing about it and would leave their data or at least traces thereof in cyberspace. Further aggravating the problem, it is not anymore only the state that is interested in collecting the respective data, but also private actors such as marketing enterprises." Which clearly explains the problems with weak privacy. 

The lack of privacy in these devices makes this subject an important one especially with the increasing number of IoT devices. Miorandi et al. [1] thinks it is one of the key issues, along with security, with IoT devices makes the subject of this thesis a relevant one.  

## Goals & Challenges

The main goal of the master thesis is to investigate ways to improve privacy of IoT applications, more specifically Wireless Sensor Network (WSN) applications, using data minimization. Meaning the project will seek to improve privacy in distributed networks by limiting the amount of personal data being processed. 

The project will seek to create smart algorithms for privacy with WSN applications, meaning it will seek to create automitized algorithms that improves privacy for users in WSNs. TA: I don't really understand this sentence, or rather, I am not sure of what it means.

With the broad usage of different IoT devices, each having different levels of sensitive data, finding a good limit for each application that ensures sufficient privacy for it's users will be the greatest challenge.

## Approach

Implementation and testing will be done using Arduino hardware with modules allowing wi-fi communication. Open Source applications (_some examples of applications will be referenced here_) will be used as prototypes to simulate applications collecting data and development will focus on finding algorithms to limit the amount of data collected to improve privacy for the users. TA: Implementation and testing come in second part of the project and should be seen as a validation of what you did first, which should be the core of the work (except if the impplementation in itself is extremely complicated). What are the kinds of test you plan to do? Side question: do you have access to Arduino hardware?

In a paper from Li et al. [4], they discuss an active approach to avoid overcollection of data. Where the focus resides in not allowing applications to gain access to more data then they require for it's purpose. Which proposes a permission-based solution, whereas this project instead will seek to limit the application itself from wanting to collect more than it would require. TA: The last sentence (Which ... require.) does not seem to ba a proper sentence.

As a starting point, I will consider a WSN where data is collected by sensors and then centrally processed by a server. Here the decision would be processed by the central unit and then propagated back to the sensors. When the features of the decisions is characterized, I would then look at introducing distributed computation capabilities in the network - e.g. by adding aggregators to manage a set of sensors or equipping all sensors with a computation unit to allow each of them to make decisions. TA: Maybe you should develop what the decision is about.

As a basis for decisions, I will look at related work in energy management for WSNs, where such decisions are used to improve energy savings. (_reference to a paper on energy savings can be added here._) TA: Here is a paper on the topic: http://nslab.kaist.ac.kr/courses/2006/cs710/paperlist/network/sensor/23.pdf

A preliminary plan for the project is as follows:

1. Installing and set-up of the Arduino components and development environments. Then familiarise myself with it. (3 weeks)
2. Plan a specification of the algorithms. (5 weeks)
3. Development of the algorithms according to the specification. (5 weeks)
4. Testing of algorithms. (5 weeks)
5. Polishing the implementation and finalising the report. (2 weeks)

TA: 3 weeks for point 1 seems very long to me. What exactly do you think would take so much time? For point 4, would it be possible to proove some properties instead of testing them? I am not sure about the output of your project though. I remember you spoke about a tool to help developer previously, is it still present or has it changed? All in all, it improved and I think we are close to a complete proposal now. Tell me if you have other questions.

Writing of the final report is interleaved with the other work throughout the entire project.

--- previous comments you made are kept below for now

**Limiting the processing on personal data is a complex issue that can be tackled from many different perspectives. Many techniques exist to weaken data quality (k-anonymisation REF, l-diverity REF, t-closeness REF, epsilon-differential privacy REF) used to reduce the utility and improve the privacy of data subjects. However, we will take a simplified approach: either the data is processed, either it is not. To this aim, we plan to adopt an incremental approach by considering different steps of the personal data lifecyle. First we will consider data collection by sensors which are centrally managed. In this case, the decision to collect or not is taken by the central server and the decision has to be propagated in the WSN until reaching the sensor. We will then consider data storage and, finally data disclosure.**

**Once the problem is characterized and addressed in the centralized architecture, we are going to distribute the decision in the WSNs by adding distributed computation capabilities in the network. This may be by adding aggregators which may be considered as partially centralized architectures or even by equipping all sensors with computation units to allow maximally decentralised decisions.**

**To be able to decide whether or not the data needs to be processed, the decision point needs to have a knowledge of what has to be computed, what is needed to compute it, and the current state of what has been processed to decide whether or not further processing is needed. The decision itself may be distributed among several components in the network to reduce its impact in terms of privacy.**

**At first, we will consider related works in the energy management in WSNs litterature as data minimisation is also used towards achieving better energy savings. This kindof work often targets lower levels (cf. http://ieeexplore.ieee.org.proxy.lib.chalmers.se/stamp/stamp.jsp?tp=&arnumber=1632657) than the application level we target here.**


## Ethics

-- this is non-revised

We are aware that our thesis will include some ethical questions since we investigate the possibility to implement better privacy for the end user. We believe that making IoT devices collect less data makes the end user more inclined to use it. Thereby helping both the customers and the manufacturers. We also understand that this would make sensitive data more difficult to be leaked which should be the interest for all parties involved. 

Finally we understand that it also disrupts current business models, that uses data mining to better refine their products, but we are confident that helping to increase the privacy of IoT devices is for the benefit of everyone. 


## References

[1] Miorandi, Daniele, et al. "Internet of things: Vision, applications and research challenges." Ad Hoc Networks 10.7 (2012): 1497-1516.

[2] Medaglia, Carlo Maria, and Alexandru Serbanati. "An overview of privacy and security issues in the internet of things." The Internet of Things. Springer New York, 2010. 389-395.

[3] Weber, Rolf H. "Internet of Things–New security and privacy challenges." Computer Law & Security Review 26.1 (2010): 23-30. 

[4] Li, Yibin, et al. "Privacy protection for preventing data over-collection in smart city." (2015).
