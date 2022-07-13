# OSINT

**Índice** 
1. [Whois](#id1)
2. [Segundo apartado](#id2)


## Whois<a name="id1"></a>
Whois is a tool that uses the TCP protocol that allows queries to be made to a database that contains information about the domain of web pages. Probably, as you know, a web use a TCP/IP protocol and every web has an IP though you see a something like www.domain.com. Every web has at least DNS to convert the IP to a direction to be able to remember it easily. So that it is important to see if we can collect some data about it. Later we will see how you can collect specific information about it.

```
$ whois www.nike.es
```
The result you get when you run the last command is (the output is formatted for better readability):
```
Domain Name: NIKE.COM
   Registry Domain ID: 7258_DOMAIN_COM-VRSN
   Registrar WHOIS Server: whois.markmonitor.com
   Registrar URL: http://www.markmonitor.com
   Updated Date: 2022-02-01T09:11:14Z
   Creation Date: 1995-03-04T05:00:00Z
   Registry Expiry Date: 2024-03-05T05:00:00Z
   Registrar: MarkMonitor Inc.
   Registrar IANA ID: 292
   Registrar Abuse Contact Email: abusecomplaints@markmonitor.com
   Registrar Abuse Contact Phone: +1.2086851750
   Domain Status: clientDeleteProhibited https://icann.org/epp#clientDeleteProhibited
   Domain Status: clientTransferProhibited https://icann.org/epp#clientTransferProhibited
   Domain Status: clientUpdateProhibited https://icann.org/epp#clientUpdateProhibited
   Domain Status: serverDeleteProhibited https://icann.org/epp#serverDeleteProhibited
   Domain Status: serverTransferProhibited https://icann.org/epp#serverTransferProhibited
   Domain Status: serverUpdateProhibited https://icann.org/epp#serverUpdateProhibited
   Name Server: NS-N1.NIKE.COM
   Name Server: NS-N2.NIKE.COM
   Name Server: NS-N3.NIKE.COM
   Name Server: NS-N4.NIKE.COM
   DNSSEC: unsigned
   URL of the ICANN Whois Inaccuracy Complaint Form: https://www.icann.org/wicf/
>>> Last update of whois database: 2022-07-13T08:36:03Z <<<


The Registry database contains ONLY .COM, .NET, .EDU domains and
Registrars.
Domain Name: nike.com
Registry Domain ID: 7258_DOMAIN_COM-VRSN
Registrar WHOIS Server: whois.markmonitor.com
Registrar URL: http://www.markmonitor.com
Updated Date: 2022-02-01T09:11:14+0000
Creation Date: 1995-03-04T05:00:00+0000
Registrar Registration Expiration Date: 2024-03-05T00:00:00+0000
Registrar: MarkMonitor, Inc.
Registrar IANA ID: 292
Registrar Abuse Contact Email: abusecomplaints@markmonitor.com
Registrar Abuse Contact Phone: +1.2086851750
Domain Status: clientUpdateProhibited (https://www.icann.org/epp#clientUpdateProhibited)
Domain Status: clientTransferProhibited (https://www.icann.org/epp#clientTransferProhibited)
Domain Status: clientDeleteProhibited (https://www.icann.org/epp#clientDeleteProhibited)
Domain Status: serverUpdateProhibited (https://www.icann.org/epp#serverUpdateProhibited)
Domain Status: serverTransferProhibited (https://www.icann.org/epp#serverTransferProhibited)
Domain Status: serverDeleteProhibited (https://www.icann.org/epp#serverDeleteProhibited)
Registry Registrant ID: 
Registrant Name: Internet Domain Administrator
Registrant Organization: Nike, Inc.
Registrant Street: One Bowerman Drive, DF/4
Registrant City: Beaverton
Registrant State/Province: OR
Registrant Postal Code: 97005
Registrant Country: US
Registrant Phone: +1.5036716453
Registrant Phone Ext: 
Registrant Fax: 
Registrant Fax Ext: 
Registrant Email: internet.domain.administrator@nike.com
Registry Admin ID: 
Admin Name: Internet Domain Administrator
Admin Organization: Nike, Inc.
Admin Street: One Bowerman Drive, DF/4
Admin City: Beaverton
Admin State/Province: OR
Admin Postal Code: 97005
Admin Country: US
Admin Phone: +1.5036716453
Admin Phone Ext: 
Admin Fax: 
Admin Fax Ext: 
Admin Email: internet.domain.administrator@nike.com
Registry Tech ID: 
Tech Name: Internet Domain Administrator
Tech Organization: Nike, Inc.
Tech Street: One Bowerman Drive, DF/4
Tech City: Beaverton
Tech State/Province: OR
Tech Postal Code: 97005
Tech Country: US
Tech Phone: +1.5036716453
Tech Phone Ext: 
Tech Fax: 
Tech Fax Ext: 
Tech Email: internet.domain.administrator@nike.com
Name Server: ns-n3.nike.com
Name Server: ns-n1.nike.com
Name Server: ns-n2.nike.com
Name Server: ns-n4.nike.com
DNSSEC: unsigned
```
As you can see the output shows directions, emails, servers, etc. that it is very relevant for gathering information to exploit later. I encourage to you to think what you can do with this data and what parts of it are the most relevant for you.

## Segundo apartado<a name="id2"></a>

Will use this tools:
```

```

