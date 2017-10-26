# Email
## Mail Flow
### Inbound
The following MX records are configured for the domains listed below:

    <domain name>	IN	MX	10	mx1.hc199417.iphmx.com  
    <domain name>	IN	MX	10  mx2.hc199417.iphmx.com

- areifitness.com
- clearfunds.com
- dartexecutions.com
- droghedallc.com
- ilumconstruction.com
- level1events.com
- mouse-motors.com
- mousemotorscarmel.com
- mousemotorschicago.com
- rise-and-drive.com
- roncap.com
- ronin-capital.com
- ronin-disabled.com
- ronin-trading.co.uk
- ronin-trading.eu
- ronin.roncap.com
- ronintradingllc.com
- tarisrealestate.com
- zenholdings.com
    
Per our domains's MX records, inbound email is first received by our Cisco Cloud Email Security (aka IronPort).  After passing through Cisco's message filter, CES is configured to route email to our On-premise (Orleans) Exchange Client Access servers (which are published / proxied through our Orleans TMG servers.


### Outbound
Exchange  
Ironport  
LiveOffice  

### Relay

## Security


## Authentication
In an effort to further aid the internet in 

Background information on Sender Policy Framework (SPF), DomainKeys Identified mail (DKIM) and Domain-based Message Authentication, Reporting and Conformance protocol (DMARC), collectively Email authentication mechanisms, can be found at the following website: [https://www.nist.gov/publications/email-authentication-mechanisms-dmarc-spf-and-dkim](https://www.nist.gov/publications/email-authentication-mechanisms-dmarc-spf-and-dkim)

### SPF
    v=spf1 mx ip4:192.5.68.36/32 ip4:192.5.69.36/32 -all

The SPF record is configured (on all domains) to indicate that outbound mail should only originate from our Mail Exchangers (the Cisco Cloud Email Security servers)

Our SPF record indicates that our MX servers and the IP addresses for our on premise Exchange servers are designated senders for each respective domain; all other email can be safely ignored/dropped.


### DKIM
Not yet implemented; planned for Q4 2017.  However, we are currently in a test phase (on single user only); the current test currently ongoing with the following record

	beta._domainkey.ronin-capital.com. IN TXT "v=DKIM1; t=y; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCOm8ZRZCERXDSfvKziivp1XwFLD5UnMbZ3cEpg9CtatSFNoXAgY6QodfL7u5MQ9DfbzN5pejg/B3ytEeUJgQrrc/qHy7V0Qba9BLz85np+jNyFGdaXsZfPUrJP5KE18BxWVEshyTTni0tPuhYAeLI3J/os5gnO7HBzDEMtWH7gowIDAQAB;" 

Our environment is currently configured to provide signature hashes of the message body and several message headers to verify authenticity and integrity of the message and its contents (from a single test sender, currently)

### DMARC
Not yet implemented; planned for Q4 2017.


# Topology
 
### Mailbox Tier
There are four physical Exchange servers configured with the Mailbox role.  These four servers are split between two Database Availability Groups (DAGs), each DAG having one node in Chicago and one in Secaucus.

#### Mailbox Databases


#### Database Naming Scheme


### Client Access Tier
There are three virtual Exchange servers configured with the Client Access role.  Two of these are in Chicago and one in Secaucus.  The two Chicago servers are members of an Network Load Balancing (NLB) cluster; the Secaucus server is a standalone.

#### Client Access Endpoints
**Autodiscover**  
https://autodiscover.roncap.com/autodiscover  
**Active Sync**  
https://postoffice.roncap.com/Microsoft-Server-ActiveSync  
**Exchange Admin Center**  
https://postoffice.roncap.com/ecp  
**Mapi**  
https://<servername>.ronin.roncap.com/mapi  
**Offline Address Book**  
https://postoffice.roncap.com/oab  
**Web Access**  
https://postoffice.roncap.com/owa  
**Web Services**  
https://outlook.roncap.com/ews/exchange.asmx  


### Reverse Proxy Tier
There are three virtual Windows Servers running Microsoft Threat Management Gateway 2010, two of which are in Chicago and one in Secaucus.  The two in Chicago are configured as partners in a TMG array; the one in Secaucus is currently out of sync and is not in the mail or client access flow.

Both SMTP traffic and HTTPS traffic are proxied through this array


# Compliance
Live Office
Journaling

# Administration
EMS  
PowerShell  
RoninCapital Module   

# Maintenance