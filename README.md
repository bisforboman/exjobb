# Data Minimization in distributed applications for more privacy 

## Introduction

-- this is non-revised

With the increasing trend of connected devices, the network of these devices are often called Internet of Things or IoT for short, where everything from lightbulbs to thermostats can be controlled by an app.  The exposure of these devices to the internet makes a lot of that data available to the end user but also to malicious users due to the devices leaking more data than intended or by bad design. This puts the end user at risk, violating its privacy and leaking sensitive data the malicious users who can siphon the data. One simple and obvious way to prevent leakages and misuses of personal data is to collect less of this data. However, this solution is rarely used in practice because of business models relying on personal data harvest on one hand and because of the difficulty to enforce once it is defined what is actually needed to provide a service. 

## Context 

-- this is non-revised

This master thesis will include an extensive literature study. It will investigate current business models and IoT development to help determine some relevant key areas that utilizes data harvesting and to which extent. According to Miorandi et al. [1] “The main reasons that makes privacy a fundamental IoT requirement lies in the envisioned IoT application domains and in the technologies used. Healthcare applications represent the most outstanding application field, whereby the lack of appropriate mechanisms for ensuring privacy of personal and/or sensitive information has harnessed the adoption of IoT technologies.“ 

At the same time, there are areas that by simple usage of IoT can benefit greatly from the connectivity of these devices [2], “For example, mobile devices could adopt silent mode when entering a meeting room if this is the request of the meeting moderator, alert the user and turn off the radio before entering sensitive medical areas or detect when the user enters the car and connect to its sound system.”. The usage of IoT raises questions regarding privacy; who decides when a device should be turned on/off, how will the decider know that a device should be turned on/off and how will this decision be communicated?

The lack of privacy in these devices makes this subject an important one especially with the increasing number of IoT devices. Miorandi et al. [1] thinks it is one of the key issues, along with security, with IoT devices makes the subject of this thesis a relevant one.  


## Goals & Challenges

The main goal of the master thesis is to investigate ways to improve privacy of IoT applications, more specifically Wireless Sensor Network (WSN) applications, using data minimization. Meaning the project will seek to improve privacy in distributed networks by limiting the amount of data being communicated. 

The project will seek to create smart algorithms for privacy with WSN applications, meaning it will seek to create automitized algorithms that improves privacy for users with the help of WSNs. 

Should this prove to cumbersome, the project will instead seek to formalize communication protocols, varying for different privacy levels in different WSNs, to concretize a sufficient privacy level within WSN applications. With different applications the different requirements will vary and this will be reflected in the different protocols. 

With the broad usage of different IoT devices, each having different levels of sensitive data, finding a good limit for each application that ensures sufficient privacy for it's users will be the greatest challenge.

## Approach

As a first step the of the thesis will be to conduct literature studies on current IoT applications. This will include both literature studies and practical studies into modern development and current standards within WSNs. The practical studies will include testing security on existing applications for the sake of finding real world examples with weaknesses to reference due the course of the project. 

With enough information, the project will begin development on a simple network - without too many components - and create an improved "smart" version. Then the project will continue with real-world examples, doing the same thing in a larger example. Here the progress will be discussed with my supervisor and should too many difficulties occur, the project will here instead seek to structure protocols to show how to improve the privacy. 

Further development will be managed in agreement with the supervisor and if time allows and all goes well, the project would seek to develop an analyzing tool to help privacy concerns in WSN development even further. 

## Ethics

-- this is non-revised

We are aware that our thesis will include some ethical questions since we investigate the possibility to implement better privacy for the end user. We believe that making IoT devices collect less data makes the end user more inclined to use it. Thereby helping both the customers and the manufacturers. We also understand that this would make sensitive data more difficult to be leaked which should be the interest for all parties involved. 

Finally we understand that it also disrupts current business models, that uses data mining to better refine their products, but we are confident that helping to increase the privacy of IoT devices is for the benefit of everyone. 


## References

[1] Miorandi, Daniele, et al. "Internet of things: Vision, applications and research challenges." Ad Hoc Networks 10.7 (2012): 1497-1516.

[2] Medaglia, Carlo Maria, and Alexandru Serbanati. "An overview of privacy and security issues in the internet of things." The Internet of Things. Springer New York, 2010. 389-395.
