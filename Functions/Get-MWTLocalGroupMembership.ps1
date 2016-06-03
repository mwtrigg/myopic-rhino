<#	
 .Synopsis
    List local group members on the local or a remote computer
 .DESCRIPTION

 .EXAMPLE

 .EXAMPLE

 .NOTES
    Created on:  06/02/2015
    Created by:  Semicolon (Michael Trigg)
    Script:      Get-MWTLocalGroupMembership.ps1


    LinkedIn:    https://www.linkedin.com/in/mtrigg
    GitHub:      https://github.com/mwtrigg
    Spiceworks:  https://community.spiceworks.com/people/michaeltrigg
    Twitter:     https://twitter.com/mwtrigg
 
 .NOTES
   Revisions of Note:
   v1.0  06/02/2015 - Initial GitHub Version
   v1.1  06/03/2016 - Change "IncludeEmpty" to variable/parameter type Switch
     
 .LINK
		
#>

Param
	(
		[string]
        [Alias("Computername")]
        $comp = $env:computername,
              
        [switch]
        [Alias("Emtpy","All")]
        $IncludeEmpty
	)

$pc = [ADSI]("WinNT://$comp")
$groups = $pc.psbase.children | Where-Object {$_.SchemaClassName -eq "Group"}
$members = @()

$groups | ForEach-Object {
    $grp = $_.Name
    $group = [ADSI]("WinNT://$comp/$grp,group") 
    if ($($Group.Members()) -eq $null)
      {
        $member = New-Object PSObject
        $member | Add-Member -MemberType NoteProperty -Name "LocalGroup" -Value "$comp\$grp"
        $member | Add-Member -MemberType NoteProperty -Name "Name" -Value "EMPTY"
        $member | Add-Member -MemberType NoteProperty -Name "Domain" -Value "EMPTY"
        $member | Add-Member -MemberType NoteProperty -Name "Class" -Value "EMPTY"
        $members += $member
      } 
    else
        {
        $Group.Members() | ForEach-Object { 
            $AdsPath = $_.GetType().InvokeMember("Adspath", 'GetProperty', $null, $_, $null) #borrowed
            # Domain members will have an ADSPath like WinNT://DomainName/UserName. 
            # Local accounts will have a value like WinNT://DomainName/ComputerName/UserName. 
            $a = $AdsPath.split('/',[StringSplitOptions]::RemoveEmptyEntries) #borrowed
            $name = $a[-1] #borrowed
            $domain = $a[-2] #borrowed
            $class = $_.GetType().InvokeMember("Class", 'GetProperty', $null, $_, $null) #borrowed
 
            $member = New-Object PSObject
            $member | Add-Member -MemberType NoteProperty -Name "LocalGroup" -Value "$comp\$grp" 
            $member | Add-Member -MemberType NoteProperty -Name "Name" -Value $name #borrowed
            $member | Add-Member -MemberType NoteProperty -Name "Domain" -Value $domain #borrowed
            $member | Add-Member -MemberType NoteProperty -Name "Class" -Value $class #borrowed
            $members += $member #borrowed
            }
        } 
}
switch ($IncludeEmpty.IsPresent)
{
    $true  {$members | Select-Object LocalGroup,@{n="Member";e={if($_.Name -eq "EMPTY"){"EMPTY"}else{$_.Domain + "\" + $_.Name}}},@{n="Class";e={if($_.Class -eq "EMPTY"){""}else{$_.Class}}}}
    $false {$members | Where-Object {$_.Name -ne "EMPTY"} | Select-Object LocalGroup,@{n="Member";e={$_.Domain + "\" + $_.Name}},Class}
}