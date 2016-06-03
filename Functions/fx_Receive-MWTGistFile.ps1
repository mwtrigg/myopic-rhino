<#	
 .Synopsis

 .DESCRIPTION

 .EXAMPLE

 .EXAMPLE

 .NOTES
    Created on:  06/03/2016
    Created by:  Semicolon (Michael Trigg)
    Script:      fx_Receive-MWTGistFile.ps1


    LinkedIn:    https://www.linkedin.com/in/mtrigg
    GitHub:      https://github.com/mwtrigg
    Spiceworks:  https://community.spiceworks.com/people/michaeltrigg
    Twitter:     https://twitter.com/mwtrigg

 .NOTES
    This script will require the PSGist and PSGitHub powershell modules available from the Powershell Gallery

 .NOTES
   Revisions of Note:
   v1.0  06/02/2015 - Initial GitHub Version
    
 .LINK
		
#>
#Requires -Module PSGist
#Requires -Module PSGitHub

function Receive-MWTGistFile
{
    Param
    (
		[string]
        [Alias("GHPath")]
        $Path = 'GH:\Gist',

        $GistID
    )
    
    $Script:Which = switch ($GistID.Count)
                        {
                            0 {"Get-Gist"}
                            1 {"Get-Gist -Id $GistID"}
                        }

$Script:SaveGist = @"
$Script:Which | ForEach-Object {
    Save-Gist -Id `$_.Id -Path $Path
    Rename-Item -Path $Path\`$(`$_.Id) -NewName $Path\`$(`$_.Description)
    New-Item -Path $Path\`$(`$_.Description) -Name GistId -ItemType File -Value `$_.Id
    }
"@

Write-Verbose $Script:SaveGist
Invoke-Expression -Command $Script:SaveGist
}