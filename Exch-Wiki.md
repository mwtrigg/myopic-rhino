# Email
## Mail Flow
### Inbound
The following MX records are configured for the domains listed below:

    <domain name>	IN	MX	10	mx1.hc199417.iphmx.com  
    <domain name>	IN	MX	10  mx2.hc199417.iphmx.com

- areifitness.com
- clearfunds.com
- dartexecutions.com
- dreghedallc.com
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

TMG Servers  
CAS Servers  

### Outbound
Exchange  
Ironport  
LiveOffice  

## Security


## Authentication
In an effort to be good netizens, the Firm will be   
### SPF
    v=spf1 mx ip4:192.5.68.36/32 ip4:192.5.69.36/32 -all

The SPF record is configured (on all domains) to indicate that outbound mail should only originate from our Mail Exchangers (the Cisco Cloud Email Security servers)

### DKIM


### DMARC



# Topology
## Exchange 
Server Hardware  
MBX -  DAGs & Databases  
CAS Servers
TMG Servers

## Name Records 
The following DNS records are configured for the Exchange and Email environment

## URLs

# Compliance
Live Office
Journaling

# Administration
EMS  
PowerShell  
RoninCapital Module   

# Maintenance