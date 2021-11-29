function Remove-Something {
    #https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-shouldprocess?view=powershell-7.2
    [CmdletBinding(, SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if ($PSCmdlet.ShouldProcess($Path, 'Remove the item')) {
        Write-Host Removing $Path -ForegroundColor Red
    }
    else {
        Write-Host Nothing happend to $Path -ForegroundColor Green
    }

}

Remove-Something -Path C:\ProgramData -Confirm:$false #-WhatIf
