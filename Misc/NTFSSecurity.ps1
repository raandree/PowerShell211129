Get-Item -Path 'D:\dbatools - Copy\1.1.39\functions' |
    Disable-NTFSAccessInheritance -RemoveInheritedAccessRules -PassThru |
    Set-NTFSOwner -Account 'NT Authority\SYSTEM' -PassThru | 
    Add-NTFSAccess -Account 'NT Authority\SYSTEM' -AccessRights FullControl
Get-Item -Path 'D:\dbatools - Copy\1.1.39\internal' | Add-NTFSAccess -Account Everyone -AccessRights FullControl
Get-Item -Path 'D:\dbatools - Copy\1.1.39\internal' | Add-NTFSAccess -Account S-1-5-32-890 -AccessRights FullControl


#dir -Path 'D:\dbatools - Copy' -Directory -Recurse | Get-NTFSOwner | Where-Object Owner -ne RAANDREE0\randr | Set-NTFSOwner -Account RAANDREE0\randr
#dir -Path 'D:\dbatools - Copy' -Directory -Recurse | Get-NTFSInheritance | Where-Object AccessInheritanceEnabled -eq $false | Enable-NTFSAccessInheritance
#
#dir -Path 'D:\dbatools - Copy' -Directory -Recurse | Get-NTFSAccess -Account Everyone -ExcludeInherited | Remove-NTFSAccess
#dir -Path 'D:\dbatools - Copy' -Directory -Recurse | Get-NTFSAccess -Account 'NT Authority\SYSTEM' -ExcludeInherited | Remove-NTFSAccess

dir -Path 'D:\dbatools - Copy' -Directory -Recurse | ForEach-Object {
    $sd = $_ | Get-NTFSSecurityDescriptor
    
    $sd | Enable-NTFSAccessInheritance
    $sd | Get-NTFSAccess -Account Everyone -ExcludeInherited | Remove-NTFSAccess
    $sd | Get-NTFSAccess -Account 'NT Authority\SYSTEM' -ExcludeInherited | Remove-NTFSAccess
    $sd | Set-NTFSOwner -Account RAANDREE0\randr
    $sd | Get-NTFSOrphanedAccess | Remove-NTFSAccess
    
    $sd | Set-NTFSSecurityDescriptor
}

1..3 | ForEach-Object {
    Get-Item D:\dbatools | Add-NTFSAccess -Account (Get-LocalUser | Get-Random).SID -AccessRights FullControl
}

Get-NTFSAccess -Path D:\dbatools | Add-NTFSAccess -Path 'D:\dbatools - Copy'

Clear-NTFSAccess -Path 'D:\dbatools - Copy'

$sd = Get-NTFSSecurityDescriptor -Path D:\dbatools
$sd.Item = Get-Item2 -Path 'D:\dbatools - Copy'
$sd | Set-NTFSSecurityDescriptor
