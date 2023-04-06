# [Protocols]
[Geef een korte beschrijving van het onderwerp]

## Key-terms
[UDP:  
Het User Datagram Protocol (UDP) is een van de basisprotocollen van het internet. Het protocol opereert op hetzelfde niveau als TCP. UDP geldt als onbetrouwbaar: het protocol verifieert niet of de gegevens daadwerkelijk aankomen en garandeert niet dat de gegevens in dezelfde volgorde aankomen, wat bij TCP wel het geval is. Een aantal protocollen dat via UDP werkt, implementeert zelf een verificatiemethode. Hiermee zorgen ze effectief voor een vervanging van de functionaliteit die TCP heeft op dit gebied. UDP wordt veel gebruikt bij toepassingen waar het snel overdragen van de gegevens en een korte reactietijd zeer belangrijk is, en het minder erg is dat er gegevens verloren kunnen gaan, zoals bij telefonie, videoconferencing, DNS of het online spelen van actievolle spellen, zoals first-person shooters.  
Three-way handshake:  
1.  The client sends the SYN to the server: When the client wants to connect to the server. It sets the 'SYN' flag as 1 and sends the message to the server. The message has also some additional information like the sequence number(any random 32 bits number), the ACK is set here to 0, the window size, and the maximum segment size. For Example, if the window size is 2000 bits, and the maximum segment size is 200 bits then a maximum of 10 data segments (2000/200 = 10) can be transmitted in the connection.
2.  The server replies with the SYN and the ACK to the client: After receiving the client's synchronization request, the server sends an acknowledge to the client by setting the ACK flag to '1'. The acknowledgement number of the ACK is one more than the received sequence number. For Example, if the client has sent the SYN with sequence number = 1000, then the server will send the ACK with acknowledgement number = 10001. Also, the server sets the SYN flag to '1' and sends it to the client, if the server also wants to establish the connection. The sequence number used here for the SYN will be different from the client's SYN. The server also advertises its window size and maximum segment size to the client. After completion of this step, the connection is established from the client to the server-side.
3.  The client sends the ACK to the server: After receiving the SYN from the server, the client sets the ACK flag to '1' and sends it with an acknowledgement number 1 greater than the server's SYN sequence number to the client. Here, the SYN flag is kept '0'. After completion of this step, the connection is now established from the server to the client-side also. After the connection is being established, the minimum of the sender's and receiver's maximum segment size is taken under consideration for data transmission.
![3way](/00_includes/Week-2-img/TCPHandshake.jpg)]

## Opdracht
### Gebruikte bronnen
[Wikipedia](https://nl.wikipedia.org/wiki/User_Datagram_Protocol)  
[Wireshark 4 dummies](https://medium.com/@mackenziepech/wireshark-for-beginners-ba3c0771d01c)

### Ervaren uitdagingen
[De uitdaging lag vooral in het begrijpen van bepaalde protocols en hun doel in het proces. Verder was wireshark uitlezen ook een uitdaging.]

### Resultaat
1.  Application layer (Layer 7)

HTTP (Hypertext Transfer Protocol)
FTP (File Transfer Protocol)
DNS (Domain Name System)
SMTP (Simple Mail Transfer Protocol)

2.  Presentation layer (Layer 6)

SSL/TLS (Secure Sockets Layer/Transport Layer Security)

3.  Session layer (Layer 5)

NetBIOS (Network Basic Input/Output System)

4.  Transport layer (Layer 4)

TCP (Transmission Control Protocol)
UDP (User Datagram Protocol)

5.  Network layer (Layer 3)

IP (Internet Protocol)
ICMP (Internet Control Message Protocol)
OSPF (Open Shortest Path First)

6.  Data link layer (Layer 2)

Ethernet
Wi-Fi (IEEE 802.11)
PPP (Point-to-Point Protocol)

7.  Physical layer (Layer 1)

RS-232 (Recommended Standard 232)
DSL (Digital Subscriber Line)
Fiber Optic  

Some of the key organizations involved in the development and promotion of network protocols include the Internet Engineering Task Force (IETF), the International Organization for Standardization (ISO), and the Institute of Electrical and Electronics Engineers (IEEE).  
Once you have identified a need, you would need to develop a specification for your protocol, describing the various features and functions it would provide. This specification should be as detailed and complete as possible, and should be reviewed and tested by experts in the field to ensure that it is technically sound and effective.

Once you have a specification, you would need to promote your protocol and convince others in the industry to adopt it. This might involve participating in standards organizations and industry groups, publishing technical papers and articles, and demonstrating the benefits and advantages of your protocol in real-world applications.