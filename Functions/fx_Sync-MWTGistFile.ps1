<#	
 .Synopsis

 .DESCRIPTION

 .EXAMPLE

 .EXAMPLE

 .NOTES
    Created on:  06/03/2016
    Created by:  Semicolon (Michael Trigg)
    Script:      fx_Sync-MWTGistFile.ps1


    LinkedIn:    https://www.linkedin.com/in/mtrigg
    GitHub:      https://github.com/mwtrigg
    Spiceworks:  https://community.spiceworks.com/people/michaeltrigg
    Twitter:     https://twitter.com/mwtrigg

 .NOTES
    This script will require the PSGist and PSGitHub powershell modules available from the Powershell Gallery

 .NOTES
   Revisions of Note:
   v1.0  06/06/2016 - Initial GitHub Version
    
 .LINK
		
#>
#Requires -Module PSGist
#Requires -Module PSGitHub

function Sync-MWTGistFile
{
    [CmdletBinding()]
    Param
    (
		[string]
        [Alias("GHPath")]
        $Path = 'GH:\Gist',

        [switch]$All
    )

$Script:Parent = @{n="Parent";e={$(Split-Path -Leaf $_.Directory)}}
$Script:GistID = @{n="GistID";e={$(Get-Content -Path "$($_.Directory)`\GistID")}}
$Script:GistExist = @{n="GistExist";e={$_.Name -in (Get-Gist -Id $(Get-Content -Path "$($_.Directory)`\GistID").Files.FileName)}}
$Script:LocalLastWriteTime = @{n="LocalLastWriteTime";e={$_.LastWriteTime}}
$Script:GistLastWriteTime = @{n="GistLastWriteTime";e={(Get-Gist -Id $(Get-Content -Path "$($_.Directory)`\GistID") | Select UpdatedAt).UpdatedAt.AddHours(-1)}}



$Script:Cmd1 = "Get-ChildItem -Path `$Path -Recurse -File | Where-Object {`$_.Name -ne `"GistID`"} | Select-Object FullName,Name,`$Script:Parent,`$Script:GistID,`$Script:LocalLastWriteTime,`$Script:GistLastWriteTime | "
$Script:Cmd2 = "Where-Object {`$_.GistLastWriteTime -lt `$_.LocalLastWriteTime} | "
$Script:Cmd3 = "ForEach-Object {Update-GistFile -Id `$_.GistID -Path `$_.FullName}"



$Script:UpdateGist = switch ($All.IsPresent)
                     {
                        $True {$([string]$Script:Cmd1 + [string]$Script:Cmd3)}
                        $False {$([string]$Script:Cmd1 + [string]$Script:Cmd2 + [string]$Script:Cmd3)}
                     }

Write-Verbose $Script:UpdateGist
Invoke-Expression -Command $Script:UpdateGist
}