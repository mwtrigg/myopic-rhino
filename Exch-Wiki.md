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
There are several well known technologies that can be used together to aid others identify and discard forged email.  These technologies may not be of direct benefit to the Firm, but their use is generally accepted 

Background information on Sender Policy Framework (SPF), DomainKeys Identified mail (DKIM) and Domain-based Message Authentication, Reporting and Conformance protocol (DMARC), collectively Email authentication mechanisms, can be found at the following website: [https://www.nist.gov/publications/email-authentication-mechanisms-dmarc-spf-and-dkim](https://www.nist.gov/publications/email-authentication-mechanisms-dmarc-spf-and-dkim)

### SPF
Sender Policy Framework (SPF) is one method of email authentication.  It allows a sender to declare (via a TXT record in the DNS zone) where email may originIt should be noted that while there technically is a DNS record type SPF, this record has been deprecated in favor of a string in a TXT record.

	v=spf1 mx ip4:192.5.68.36/32 ip4:192.5.69.36/32 -all

The SPF record is configured (on ronin-capital.com) to indicate that outbound mail should only originate from our Mail Exchangers (the Cisco Cloud Email Security servers)

Our SPF record indicates that our MX servers and the IP addresses for our on premise Exchange servers are designated senders for each respective domain; all other email can be safely ignored/dropped.

	v=spf1 include:ronin-capital.com -all

The SPF record for all other controlled domains refer back to ronin-capital.com's record.

#### Rollout
There are no special considerations required when rolling out changes, other that

#### Rollback
There are no special considerations required when rolling out changes

### DKIM
DomainKeys Identified Mail (DKIM) is another method of authenticating email.  Email leaving our organization (excepting compliance email) is reviewed by our outbound Mail Transfer Agent (MTA).  A handful of message headers and the message body are cryptographically hashed (using a secure private key); the resulting hashes are included as additional headers on the message.  Recipients can verify the message is authentic and unaltered by querying the sender's DNS zone for the `selector` that is provided in the message header. 

	postmark._domainkey.ronin-capital.com	IN	TXT	"v=DKIM1; t=s; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCJ4JmgZgyU4uUqy8216/jGjtMeQKEk96hEK6P6KbIcTN6WTn2Kkl8Vv/CUJ8m+YxHMBO1s52KpNFUQc0beYw3UgWxwN1+V7MkPI4eEzLmF/QCr+FB9OuZCOmlb8N0knLczIOLs1GXJnz0XCN96MOmYKvNuGEWBB40uh/C59NyzIQIDAQAB"

Each domain can and should have its own unique DKIM record.  An ideally, each domain should have its own unique selector and private key.  For the initial implementation, we elected to use just a single private key and selector; even in this event, a separate TXT record is required in each domain.

It should be noted that a different key can be used to sign email from different senders (configured in Cisco CES), and different keys can be used to sign email from different originating points (if we were to use a third party mail system for marketing, etc); each sender or MTA can use a unique key and selector.  In the event of compromise, this limits the scope of effect.

A sample record that could be used to authenticate all email sent by John Doe:
	whatever._domainkey.ronin-capital.com	IN	TXT	"v=DKIM1; g=john.doe t=s; k=rsa; p=<Insert Unique RSA Public Key>"

Best practice stipulates that the private keys should be rotated every few months. 


> N.B. It should be noted that DomainKeys Identitied Mail is different from its ancestor DomainKeys, which has since been deprecated.

#### Revoking
When the time comes rotate the private key, either to follow best practice or in the event of key compromise, the following DNS entry would need to be created for the selector which needs to be revoked.  (Below is the dns record that was published to revoke our DKIM record for the test phase, selector "beta").

	beta._domainkey.ronin-capital.com IN TXT "v=DKIM1; p=; t=s"

#### Rollout Changes
When rolling out changes, either periodically or after a compromise, the new DNS record for the new selector should be in place before mail is being signed by the new key on the MTA.  Once all email has been successfully delivered or the outbound queues are emptied, the old public key can be revoked (sample key above).  As long as there is no longer any email in flight signed with the old key, it should be safe to revoke it.

#### Rollback Changes
There should almost never be a reason to rollback changes of this kind, as receiving mail servers will add a message header with the results of the DKIM check on the message to timestamp the success/fail of the DKIM check at the time of receipt; so changing/revoking selectors or private keys will never have any effect on any emails already received.

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