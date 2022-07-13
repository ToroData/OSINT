# OSINT

**Index** 
1. [Whois](#id1)
2. [DNS Enum](#id2)
3. [theHarvester](#id3)
4. [whatWeb](#id4)

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
theHarvester it is so useful to find public emails. It is very important for a social engineering in the exploitation phase.

To install this tool, you can run the following code:
```
root@kali:~# sudo apt install theHarvester
```
To find resources to make more accuarate research, you can run:
```
root@kali:~# theHarvester -h
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

You can run a simple query using the following command. As you can imagine, you have to consult the help resource of the tool as I show you to learn the option you can include. But, basically -d is for the domain, -l it is equivalent to say the limit of the research and -b is to specify the source, for instance, to specify the search engine. What makes -g? What is Google Dorks?
```
root@kali:~# theHarvester -d nike.com -l 500 -b google

```
```
[*] Target: nike.com 
 
        Searching 0 results.
        Searching 100 results.
        Searching 200 results.
        Searching 300 results.
        Searching 400 results.
        Searching 500 results.
[*] Searching Google. 

[*] No IPs found.

[*] Emails found: 1
----------------------
nike.googleplaysupport@nike.com

[*] Hosts found: 9
---------------------
go.nike.com:95.100.52.159
jobs.nike.com:2.20.214.187
m.nike.com:2.20.214.187
static.nike.com:23.54.112.222
www.nike.com:2.20.214.187
x22m.nike.com
x22static.nike.com
x22www.nike.com
x3ego.nike.com

```




## whatWeb<a name="id4"></a>
To install this tool, you can run the following code:
```
root@kali:~# sudo apt install whatweb
```
To find resources to make more accuarate research, you can run:
```
root@kali:~# whatweb -h
```
```
WhatWeb - Next generation web scanner version 0.5.5.
Developed by Andrew Horton (urbanadventurer) and Brendan Coles (bcoles).
Homepage: https://www.morningstarsecurity.com/research/whatweb

Usage: whatweb [options] <URLs>

TARGET SELECTION:
  <TARGETs>			Enter URLs, hostnames, IP addresses, filenames or
  				IP ranges in CIDR, x.x.x-x, or x.x.x.x-x.x.x.x
  				format.
  --input-file=FILE, -i		Read targets from a file. You can pipe
				hostnames or URLs directly with -i /dev/stdin.

TARGET MODIFICATION:
  --url-prefix			Add a prefix to target URLs.
  --url-suffix			Add a suffix to target URLs.
  --url-pattern			Insert the targets into a URL.
				e.g. example.com/%insert%/robots.txt

AGGRESSION:
The aggression level controls the trade-off between speed/stealth and
reliability.
  --aggression, -a=LEVEL	Set the aggression level. Default: 1.
  1. Stealthy			Makes one HTTP request per target and also
  				follows redirects.
  3. Aggressive			If a level 1 plugin is matched, additional
  				requests will be made.
  4. Heavy			Makes a lot of HTTP requests per target. URLs
  				from all plugins are attempted.

HTTP OPTIONS:
  --user-agent, -U=AGENT	Identify as AGENT instead of WhatWeb/0.5.5.
  --header, -H			Add an HTTP header. eg "Foo:Bar". Specifying a
				default header will replace it. Specifying an
				empty value, e.g. "User-Agent:" will remove it.
  --follow-redirect=WHEN	Control when to follow redirects. WHEN may be
				`never', `http-only', `meta-only', `same-site',
				or `always'. Default: always.
  --max-redirects=NUM		Maximum number of redirects. Default: 10.

AUTHENTICATION:
  --user, -u=<user:password>	HTTP basic authentication.
  --cookie, -c=COOKIES		Use cookies, e.g. 'name=value; name2=value2'.
  --cookie-jar=FILE		Read cookies from a file.

PROXY:
  --proxy			<hostname[:port]> Set proxy hostname and port.
				Default: 8080.
  --proxy-user			<username:password> Set proxy user and password.

PLUGINS:
  --list-plugins, -l		List all plugins.
  --info-plugins, -I=[SEARCH]	List all plugins with detailed information.
				Optionally search with keywords in a comma
				delimited list.
  --search-plugins=STRING	Search plugins for a keyword.
  --plugins, -p=LIST		Select plugins. LIST is a comma delimited set
				of selected plugins. Default is all.
				Each element can be a directory, file or plugin
				name and can optionally have a modifier, +/-.
				Examples: +/tmp/moo.rb,+/tmp/foo.rb
				title,md5,+./plugins-disabled/
				./plugins-disabled,-md5
				-p + is a shortcut for -p +plugins-disabled.
  --grep, -g=STRING|REGEXP	Search for STRING or a Regular Expression. Shows
				only the results that match.
				Examples: --grep "hello"
				--grep "/he[l]*o/"
  --custom-plugin=DEFINITION	Define a custom plugin named Custom-Plugin,
				Examples: ":text=>'powered by abc'"
				":version=>/powered[ ]?by ab[0-9]/"
				":ghdb=>'intitle:abc \"powered by abc\"'"
				":md5=>'8666257030b94d3bdb46e05945f60b42'"
				"{:text=>'powered by abc'}"
  --dorks=PLUGIN		List Google dorks for the selected plugin.

OUTPUT:
  --verbose, -v			Verbose output includes plugin descriptions.
				Use twice for debugging.
  --colour,--color=WHEN		control whether colour is used. WHEN may be
				`never', `always', or `auto'.
  --quiet, -q			Do not display brief logging to STDOUT.
  --no-errors			Suppress error messages.

LOGGING:
  --log-brief=FILE		Log brief, one-line output.
  --log-verbose=FILE		Log verbose output.
  --log-errors=FILE		Log errors.
  --log-xml=FILE		Log XML format.
  --log-json=FILE		Log JSON format.
  --log-sql=FILE		Log SQL INSERT statements.
  --log-sql-create=FILE		Create SQL database tables.
  --log-json-verbose=FILE	Log JSON Verbose format.
  --log-magictree=FILE		Log MagicTree XML format.
  --log-object=FILE		Log Ruby object inspection format.
  --log-mongo-database		Name of the MongoDB database.
  --log-mongo-collection	Name of the MongoDB collection.
				Default: whatweb.
  --log-mongo-host		MongoDB hostname or IP address.
				Default: 0.0.0.0.
  --log-mongo-username		MongoDB username. Default: nil.
  --log-mongo-password		MongoDB password. Default: nil.
  --log-elastic-index		Name of the index to store results. Default: whatweb
  --log-elastic-host		Host:port of the elastic http interface. Default: 127.0.0.1:9200

PERFORMANCE & STABILITY:
  --max-threads, -t		Number of simultaneous threads. Default: 25.
  --open-timeout		Time in seconds. Default: 15.
  --read-timeout		Time in seconds. Default: 30.
  --wait=SECONDS		Wait SECONDS between connections.
				This is useful when using a single thread.

HELP & MISCELLANEOUS:
  --short-help			Short usage help.
  --help, -h			Complete usage help.
  --debug			Raise errors in plugins.
  --version			Display version information.
```

You can run a simple query using the following code, and you will see that you obtain too much information as IP, servers, cookies, headers, etc. I recommend you to use the verbose mode just including -v. That way, you will obtain a nicer output. 
It is your goal to understand the majority of the data but remember that the most important phase of ethical hacking is gathering information. Do not underestimate all the effort that you will have to dedicate to it, and try not to advance without having clear knowledge. Remember that so far all the tools used are legal, at least in Spain.

```
root@kali:~# whatweb -v nike.com  

```
```       
WhatWeb report for http://nike.com
Status    : 301 Moved Permanently
Title     : <None>
IP        : 18.66.248.99
Country   : UNITED STATES, US

Summary   : CloudFront, HTTPServer[CloudFront], RedirectLocation[https://www.nike.com/], Strict-Transport-Security[max-age=63072000], UncommonHeaders[x-amz-cf-pop,x-amz-cf-id], Via-Proxy[1.1 6fadd80db8a3a154b0b68f055a91920c.cloudfront.net (CloudFront)]

Detected Plugins:
[ CloudFront ]
        CloudFront Server 


[ HTTPServer ]
        HTTP server header string. This plugin also attempts to 
        identify the operating system from the server header. 

        String       : CloudFront (from server string)

[ RedirectLocation ]
        HTTP Server string location. used with http-status 301 and 
        302 

        String       : https://www.nike.com/ (from location)

[ Strict-Transport-Security ]
        Strict-Transport-Security is an HTTP header that restricts 
        a web browser from accessing a website without the security 
        of the HTTPS protocol. 

        String       : max-age=63072000

[ UncommonHeaders ]
        Uncommon HTTP server headers. The blacklist includes all 
        the standard headers and many non standard but common ones. 
        Interesting but fairly common headers should have their own 
        plugins, eg. x-powered-by, server and x-aspnet-version. 
        Info about headers can be found at www.http-stats.com 

        String       : x-amz-cf-pop,x-amz-cf-id (from headers)

[ Via-Proxy ]
        This plugin extracts the proxy server details from the Via 
        param of the HTTP header. 

        String       : 1.1 6fadd80db8a3a154b0b68f055a91920c.cloudfront.net (CloudFront)

HTTP Headers:
        HTTP/1.1 301 Moved Permanently
        Content-Length: 0
        Connection: close
        Server: CloudFront
        Date: Fri, 08 Jul 2022 14:35:28 GMT
        Strict-Transport-Security: max-age=63072000
        Cache-Control: max-age=300, s-maxage=604800
        Location: https://www.nike.com/
        X-Cache: Hit from cloudfront
        Via: 1.1 6fadd80db8a3a154b0b68f055a91920c.cloudfront.net (CloudFront)
        X-Amz-Cf-Pop: DUS51-P1
        X-Amz-Cf-Id: pE33aYHU7ShAw9ZB7WLsFAB8rZLDMlVSun2omXdr1bbPZuyrQqriBQ==
        Age: 452060

WhatWeb report for https://www.nike.com/
Status    : 302 Found
Title     : <None>
IP        : 2.20.214.187
Country   : EUROPEAN UNION, EU

Summary   : Akamai-Global-Host, Cookies[AnalysisUserId,anonymousId,geoloc], HTTPServer[AkamaiGHost], RedirectLocation[https://www.nike.com/ch/], UncommonHeaders[server-timing]

Detected Plugins:
[ Akamai-Global-Host ]
        Akamai-Global-Host HTTPd 

        Website     : https://www.akamai.com

[ Cookies ]
        Display the names of cookies in the HTTP headers. The 
        values are not returned to save on space. 

        String       : AnalysisUserId
        String       : geoloc
        String       : anonymousId

[ HTTPServer ]
        HTTP server header string. This plugin also attempts to 
        identify the operating system from the server header. 

        String       : AkamaiGHost (from server string)

[ RedirectLocation ]
        HTTP Server string location. used with http-status 301 and 
        302 

        String       : https://www.nike.com/ch/ (from location)

[ UncommonHeaders ]
        Uncommon HTTP server headers. The blacklist includes all 
        the standard headers and many non standard but common ones. 
        Interesting but fairly common headers should have their own 
        plugins, eg. x-powered-by, server and x-aspnet-version. 
        Info about headers can be found at www.http-stats.com 

        String       : server-timing (from headers)

HTTP Headers:
        HTTP/1.1 302 Moved Temporarily
        Server: AkamaiGHost
        Content-Length: 0
        Location: https://www.nike.com/ch/
        Date: Wed, 13 Jul 2022 20:09:50 GMT
        Connection: close
        Set-Cookie: AnalysisUserId=23.10.249.94.282021657742990983; expires=Mon, 31-Dec-2038 23:59:59 GMT; path=/; domain=.nike.com
        Set-Cookie: geoloc=cc=CH,rc=ZH,tp=vhigh,tz=GMT+1,la=47.37,lo=8.55; path=/; domain=.nike.com
        Set-Cookie: anonymousId=3F2BEAF68456905F6161C1D5A2CD57F1; expires=Wed, 27-Jul-2022 20:09:50 GMT; domain=.nike.com
        Server-Timing: cdn-cache; desc=HIT
        Server-Timing: edge; dur=1

WhatWeb report for https://www.nike.com/ch/
Status    : 200 OK
Title     : Nike Official Site. Nike CH
IP        : 2.20.214.187
Country   : EUROPEAN UNION, EU

Summary   : Cookies[AnalysisUserId,anonymousId,audience_segmentation_performed,feature_enabled__as_nav_rollout,geoloc], HTML5, HTTPServer[unified-edge-router], Open-Graph-Protocol[website], Script[application/javascript,application/json,application/ld+json,text/javascript], UncommonHeaders[x-unifiededgerouter-gitsha1,server-timing,x-akamai-transformed,content-security-policy,x-commit-sha,x-build-number,x-branch-name,x-b3-traceid], X-Frame-Options[sameorigin], X-Powered-By[Next.js]

Detected Plugins:
[ Cookies ]
        Display the names of cookies in the HTTP headers. The 
        values are not returned to save on space. 

        String       : AnalysisUserId
        String       : feature_enabled__as_nav_rollout
        String       : audience_segmentation_performed
        String       : anonymousId
        String       : geoloc
        String       : geoloc
        String       : geoloc
        String       : geoloc
        String       : geoloc

[ HTML5 ]
        HTML version 5, detected by the doctype declaration 


[ HTTPServer ]
        HTTP server header string. This plugin also attempts to 
        identify the operating system from the server header. 

        String       : unified-edge-router (from server string)

[ Open-Graph-Protocol ]
        The Open Graph protocol enables you to integrate your Web 
        pages into the social graph. It is currently designed for 
        Web pages representing profiles of real-world things . 
        things like movies, sports teams, celebrities, and 
        restaurants. Including Open Graph tags on your Web page, 
        makes your page equivalent to a Facebook Page. 

        Version      : website

[ Script ]
        This plugin detects instances of script HTML elements and 
        returns the script language/type. 

        String       : application/javascript,application/json,application/ld+json,text/javascript

[ UncommonHeaders ]
        Uncommon HTTP server headers. The blacklist includes all 
        the standard headers and many non standard but common ones. 
        Interesting but fairly common headers should have their own 
        plugins, eg. x-powered-by, server and x-aspnet-version. 
        Info about headers can be found at www.http-stats.com 

        String       : x-unifiededgerouter-gitsha1,server-timing,x-akamai-transformed,content-security-policy,x-commit-sha,x-build-number,x-branch-name,x-b3-traceid (from headers)                                                                                                                                         

[ X-Frame-Options ]
        This plugin retrieves the X-Frame-Options value from the 
        HTTP header. - More Info: 
        http://msdn.microsoft.com/en-us/library/cc288472%28VS.85%29.
        aspx

        String       : sameorigin

[ X-Powered-By ]
        X-Powered-By HTTP header 

        String       : Next.js (from x-powered-by string)

HTTP Headers:
        HTTP/1.1 200 OK
        Server: unified-edge-router
        Content-Length: 768856
        Content-Type: text/html; charset=UTF-8
        Set-Cookie: AnalysisUserId=23.10.249.55.78421657742992559; expires=Mon, 31-Dec-2038 23:59:59 GMT; path=/; domain=.nike.com
        Set-Cookie: feature_enabled__as_nav_rollout=true; Domain=.nike.com; Secure; Max-Age=3600; Path=/
        Set-Cookie: audience_segmentation_performed=true; Domain=.nike.com; Secure; Max-Age=3600; Path=/
        Set-Cookie: anonymousId=4EE04C61F8BE8340C766985B3777CB4E; expires=Wed, 27-Jul-2022 20:09:52 GMT; domain=.nike.com
        Set-Cookie: geoloc=cc=CH,rc=ZH,tp=vhigh,tz=GMT+1,la=47.37,lo=8.55; path=/; domain=.nike.com
        Set-Cookie: geoloc=cc=CH,rc=ZH,tp=vhigh,tz=GMT+1,la=47.43,lo=8.56; path=/; domain=.nike.com
        Set-Cookie: geoloc=cc=CH,rc=ZH,tp=vhigh,tz=GMT+1,la=47.43,lo=8.56; path=/; domain=.nike.com
        Set-Cookie: geoloc=cc=CH,rc=ZH,tp=vhigh,tz=GMT+1,la=47.43,lo=8.56; path=/; domain=.nike.com
        Set-Cookie: geoloc=cc=CH,rc=ZH,tp=vhigh,tz=GMT+1,la=47.43,lo=8.56; path=/; domain=.nike.com
        X-UnifiedEdgeRouter-GitSha1: 79cdc8db
        Server-Timing: edge; dur=22
        Server-Timing: cdn-cache; desc=HIT
        Vary: Accept-Encoding
        X-Akamai-Transformed: 9 96603 0 pmb=mNONE,1mRUM,3
        ETag: "7164b-yVjNi/UUNB89UV2dMdfyQrJ09D0"
        X-Frame-Options: sameorigin
        Content-Security-Policy: frame-ancestors 'self' *.nike.com *.nikecloud.com *.nikedev.com
        x-commit-sha: 70e2e0e41
        x-build-number: 281
        x-branch-name: main
        X-B3-TraceId: 21d1bfffbf6c092b, 21d1bfffbf6c092b
        X-Powered-By: Next.js
        Cache-Control: max-age=473
        Expires: Wed, 13 Jul 2022 20:17:45 GMT
        Date: Wed, 13 Jul 2022 20:09:52 GMT
        Connection: close
```
