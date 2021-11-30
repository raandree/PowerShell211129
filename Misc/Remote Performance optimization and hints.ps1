$computers = Get-ADComputer -Filter *

#serial
foreach ($computer in $computers) {
    Invoke-Command -ScriptBlock { Get-Date } -ComputerName $computer.DnsHostName
}

#serial
Invoke-Command -ScriptBlock { Get-Date } -ComputerName $computer.DnsHostName -ThrottleLimit 1

#parallel (default)
Invoke-Command -ScriptBlock { Get-Date } -ComputerName $computers.DnsHostName #defaults to ThrottleLimit == 32

#parallel with different workload controlled via a single argument
$computers = Get-ADComputer -Filter "Name -like 'DSCFile*'"
$workload = @{
    DSCFile01 = 'C:\Home\User1'
    DSCFile02 = 'C:\Home\User2'
    DSCFile03 = 'D:\User3'
}
Invoke-Command -ScriptBlock {
    
    '{0} - {1}' -f $env:COMPUTERNAME, $args[0]."$($env:COMPUTERNAME)"

} -ComputerName $computers.DnsHostName -ArgumentList $workload

#Argument list has a fundamental problem that was solved PowerShell by the cmdlet / parameter design
#if there is a argument on the lest side which is empty, then the order is broken and things go wrong
$computers = Get-ADComputer -Filter "Name -like 'DSCFile*'"
Invoke-Command -ComputerName $computers.DnsHostName -ScriptBlock {
    
    $path = $args[0]
    $filter = $args[1]
    dir -Path $path -Filter $filter

} -ArgumentList *.ps1

#The using scope makes local variables available in the remote session
#The only issue is, that the code using the using scope does not work locally
$path = 'c:\'
$filter = '*.txt'
$computers = Get-ADComputer -Filter "Name -like 'DSCFile*'"
Invoke-Command -ComputerName $computers.DnsHostName -ScriptBlock {
    
    dir -Path $using:path -Filter $using:filter

}


#The using scope makes local variables available in the remote session
#The only issue is, that the code using the using scope does not work locally
function myDate {
    Get-Date
}


#AutomatedLab.Common offers 3 cmdlets to push variables, functions and modules to
#a remote machine. This can simplify the workflow as everything is pushed by the
#remote host and prevents double hop issues
$path = 'c:\'
$filter = '*.txt'
$computers = Get-ADComputer -Filter "Name -like 'DSCFile*'"
$sessions = New-PSSession -ComputerName $computers.DnsHostName
Add-VariableToPSSession -Session $sessions -PSVariable (Get-Variable -Name path)
Add-VariableToPSSession -Session $sessions -PSVariable (Get-Variable -Name filter)
Add-FunctionToPSSession -Session $sessions -FunctionInfo (Get-Command -Name myDate)
Send-ModuleToPSSession -Module (Get-Module -ListAvailable -Name NTFSSecurity) -Session $sessions -Scope AllUsers
Invoke-Command -ComputerName $computers.DnsHostName -ScriptBlock {
    
    dir -Path $path -Filter $filter
    myDate

}
$sessions | Remove-PSSession


#you can build you own functions and tools around this to make this process more easy
#Invoke-LABCommand handles the credentials internally as well as the function and variable
#forwaring.
function myDate {
    Get-Date
}

$computers = Get-LabVM -Role FileServer
Invoke-LabCommand -ActivityName 'Get Date' -ComputerName $computers -ScriptBlock {
    myDate
} -Function (Get-Command -Name myDate) -PassThru
