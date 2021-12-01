function Get-SomethingInternal {
    param(
        [Parameter(Mandatory, ParameterSetName = 'ByName')]
        [string]$ComputerName,
                
        [Parameter(Mandatory, ParameterSetName = 'ByIp')]
        [string]$IpAddress
    )
    
    Get-Random
}

function Get-Something {
    param(
        [Parameter(Mandatory, ParameterSetName = 'ByName')]
        [string]$ComputerName,
                
        [Parameter(Mandatory, ParameterSetName = 'ByIp')]
        [string]$IpAddress,
        
        [string]$Format
    )
    
    #The parameter value stays available after removing it from the hashtable inside $Format
    #$PSBoundParameters.Remove('Format')
    
    $param = Sync-Parameter -Parameters $PSBoundParameters -Command (Get-Command -Name Get-SomethingInternal)
    
    Get-SomethingInternal @param
}

Get-Something -ComputerName abc -Format f1
