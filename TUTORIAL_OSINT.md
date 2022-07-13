# OSINT

**Índice** 
1. [Whois](#id1)
2. [DNS Enum](#id2)
3. [theHarvester](#id3)


## Whois<a name="id1"></a>
Whois is a tool that uses the TCP protocol that allows queries to be made to a database that contains information about the domain of web pages. Probably, as you know, a web use a TCP/IP protocol and every web has an IP though you see a something like www.domain.com. Every web has at least DNS to convert the IP to a direction to be able to remember it easily. So that it is important to see if we can collect some data about it. Later we will see how you can collect specific information about it.

```
root@kali:~# whois www.nike.es
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

## DNS Enum<a name="id2"></a>
DNS Enum is a specific tool to find the DNS servers information and to discover non-contiguous IP blocks. To install this tool, you can run the following code:
```
root@kali:~# sudo apt install dnsenum
```
To find resources to make more accuarate research, you can run:
```
root@kali:~# dnsenum -h
```
```Usage: dnsenum [Options] <domain>
[Options]:
Note: If no -f tag supplied will default to /usr/share/dnsenum/dns.txt or
the dns.txt file in the same directory as dnsenum.pl
GENERAL OPTIONS:
  --dnsserver 	<server>
			Use this DNS server for A, NS and MX queries.
  --enum		Shortcut option equivalent to --threads 5 -s 15 -w.
  -h, --help		Print this help message.
  --noreverse		Skip the reverse lookup operations.
  --nocolor		Disable ANSIColor output.
  --private		Show and save private ips at the end of the file domain_ips.txt.
  --subfile <file>	Write all valid subdomains to this file.
  -t, --timeout <value>	The tcp and udp timeout values in seconds (default: 10s).
  --threads <value>	The number of threads that will perform different queries.
  -v, --verbose		Be verbose: show all the progress and all the error messages.
GOOGLE SCRAPING OPTIONS:
  -p, --pages <value>	The number of google search pages to process when scraping names,
			the default is 5 pages, the -s switch must be specified.
  -s, --scrap <value>	The maximum number of subdomains that will be scraped from Google (default 15).
BRUTE FORCE OPTIONS:
  -f, --file <file>	Read subdomains from this file to perform brute force. (Takes priority over default dns.txt)
  -u, --update	<a|g|r|z>
			Update the file specified with the -f switch with valid subdomains.
	a (all)		Update using all results.
	g		Update using only google scraping results.
	r		Update using only reverse lookup results.
	z		Update using only zonetransfer results.
  -r, --recursion	Recursion on subdomains, brute force all discovered subdomains that have an NS record.
WHOIS NETRANGE OPTIONS:
  -d, --delay <value>	The maximum value of seconds to wait between whois queries, the value is defined randomly, default: 3s.
  -w, --whois		Perform the whois queries on c class network ranges.
			 **Warning**: this can generate very large netranges and it will take lot of time to perform reverse lookups.
REVERSE LOOKUP OPTIONS:
  -e, --exclude	<regexp>
			Exclude PTR records that match the regexp expression from reverse lookup results, useful on invalid hostnames.
OUTPUT OPTIONS:
  -o --output <file>	Output in XML format. Can be imported in MagicTree (www.gremwell.com)
  ```

In this particualr example the output is:

```
root@kali:~# dnsenum www.nike.com
   
   e2785.x.akamaiedge.net.                  5        IN    A        23.15.132.184
```
23.15.132.184 is the IP of the DNS of www.nike.com

Also, you can consult the [network-tools](https://network-tools.com/dns-records/) to make the same consult. You will see something like this:
	![image](https://user-images.githubusercontent.com/109081430/178818383-ff72abda-3c3f-499c-8b08-713aa37e95c4.png)



## theHarvester<a name="id3"></a>
To install this tool, you can run the following code:
```
root@kali:~# sudo apt install theharvester
```
To find resources to make more accuarate research, you can run:
```
root@kali:~# theharvester -h
```
```
usage: restfulHarvest [-h] [-H HOST] [-p PORT] [-l LOG_LEVEL] [-r]

options:
  -h, --help            show this help message and exit
  -H HOST, --host HOST  IP address to listen on default is 127.0.0.1
  -p PORT, --port PORT  Port to bind the web server to, default is 5000
  -l LOG_LEVEL, --log-level LOG_LEVEL
                        Set logging level, default is info but
                        [critical|error|warning|info|debug|trace] can be set
  -r, --reload          Enable automatic reload used during development of the
                        api


usage: theHarvester [-h] -d DOMAIN [-l LIMIT] [-S START] [-g] [-p] [-s]
                    [--screenshot SCREENSHOT] [-v] [-e DNS_SERVER]
                    [-t DNS_TLD] [-r] [-n] [-c] [-f FILENAME] [-b SOURCE]

theHarvester is used to gather open source intelligence (OSINT) on a company
or domain.

options:
  -h, --help            show this help message and exit
  -d DOMAIN, --domain DOMAIN
                        Company name or domain to search.
  -l LIMIT, --limit LIMIT
                        Limit the number of search results, default=500.
  -S START, --start START
                        Start with result number X, default=0.
  -g, --google-dork     Use Google Dorks for Google search.
  -p, --proxies         Use proxies for requests, enter proxies in
                        proxies.yaml.
  -s, --shodan          Use Shodan to query discovered hosts.
  --screenshot SCREENSHOT
                        Take screenshots of resolved domains specify output
                        directory: --screenshot output_directory
  -v, --virtual-host    Verify host name via DNS resolution and search for
                        virtual hosts.
  -e DNS_SERVER, --dns-server DNS_SERVER
                        DNS server to use for lookup.
  -t DNS_TLD, --dns-tld DNS_TLD
                        Perform a DNS TLD expansion discovery, default False.
  -r, --take-over       Check for takeovers.
  -n, --dns-lookup      Enable DNS server lookup, default False.
  -c, --dns-brute       Perform a DNS brute force on the domain.
  -f FILENAME, --filename FILENAME
                        Save the results to an XML and JSON file.
  -b SOURCE, --source SOURCE
                        anubis, baidu, bing, binaryedge, bingapi,
                        bufferoverun, censys, certspotter, crtsh, dnsdumpster,
                        duckduckgo, fullhunt, github-code, google,
                        hackertarget, hunter, intelx, linkedin,
                        linkedin_links, n45ht, omnisint, otx, pentesttools,
                        projectdiscovery, qwant, rapiddns, rocketreach,
                        securityTrails, spyse, sublist3r, threatcrowd,
                        threatminer, trello, twitter, urlscan, virustotal,
                        yahoo, zoomeye
```

