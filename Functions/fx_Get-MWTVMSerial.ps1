<#	
 .Synopsis

 .DESCRIPTION
    Expanding upon a script I found online (noted below), the only thing I really hadn't 
    discovered was the method of parsing the UUID on the VM and converting it into the 
    normal VMware serial number.

    I have modified the original function; I have/will expand the original source function
    to act more dynamically, so that it can work directly and in-line with other PowerCLI
    cmdlets (like Get-VM) in the pipeline, instead of statically.
    `
 .EXAMPLE

 .EXAMPLE

 .NOTES
    Created on:  06/16/2016
    Created by:  Semicolon (Michael Trigg)
    Script:      fx_Get-MWTVMSerial.ps1

    Original Creator: Remko Weijnen
    Source: http://www.peppercrew.nl/index.php/2011/04/get-virtual-machine-bios-serial-number/


    LinkedIn:    https://www.linkedin.com/in/mtrigg
    GitHub:      https://github.com/mwtrigg
    Spiceworks:  https://community.spiceworks.com/people/michaeltrigg
    Twitter:     https://twitter.com/mwtrigg
    
 .LINK
		
#>
#Requires -Module VMware.VimAutomation.Core

function Get-MWTVMSerial
{
	param($VirtualMachine)

	$s = (Get-VM $VirtualMachine).ExtensionData.Config.Uuid.Replace("-", "")
	$Uuid = "VMware-"
	for ($i = 0; $i -lt $s.Length; $i += 2)
	{
		$Uuid += ("{0:x2}" -f [byte]("0x" + $s.Substring($i, 2)))
		if ($Uuid.Length -eq 30) { $Uuid += "-" } else { $Uuid += " " }
    }
    return $Uuid
}