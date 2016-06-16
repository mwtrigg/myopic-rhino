<#	
 .Synopsis

 .DESCRIPTION

 .EXAMPLE

 .EXAMPLE

 .NOTES
    Created on:  06/09/2016
    Created by:  Semicolon (Michael Trigg)
    Script:      fx_Get-MWTQueueStatus.ps1


    LinkedIn:    https://www.linkedin.com/in/mtrigg
    GitHub:      https://github.com/mwtrigg
    Spiceworks:  https://community.spiceworks.com/people/michaeltrigg
    Twitter:     https://twitter.com/mwtrigg
    
 .LINK
		
#>
function Get-MWTQueueStatus
{
    Begin
    {
        Connect-MWTExchange
    }
    Process
    {
        Get-TransportService | 
            ForEach-Object {Get-Queue -Server $_.Name -Filter {(MessageCount -gt 0) -and (DeliveryType -ne 'ShadowRedundancy') -and (DeliveryType -ne 'SmtpDeliveryToMailbox') -and (DeliveryType -ne 'SmtpRelayToDag')}} | 
            Sort-Object -Property MessageCount -Descending |
            Select-Object -Property Identity,Status,MessageCount,Velocity,IncomingRate,OutgoingRate,NextHopdomain
    }
    End
    {
    }
}