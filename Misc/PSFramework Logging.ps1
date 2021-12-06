Get-PSFLoggingProvider
Set-PSFLoggingProvider -Name eventlog -Enabled $true
Get-PSFLoggingProvider

Set-PSFConfig -FullName PSFramework.Logging.FileSystem.LogPath -Value C:\

Set-PSFLoggingProvider -Name Sql -Enabled $true

$paramSetPSFLoggingProvider = @{
    Name         = 'sql'
    #InstanceName = 'MyTask'
    SqlServer    = 'dsccasql01'
    Database     = 'LoggingDB'
    Table        = 'Logs'
    Enabled      = $true
}
Set-PSFLoggingProvider @paramSetPSFLoggingProvider


Writing messages as configured to SQL, Eventlog and FileSystem

function f1 {
    Write-PSFMessage -Level Warning -Message 'Something is about to go wrong'
    f2 -Param1 '123'
}

function f2 {
    param(
        [string]$Param1
    )

    try {
        dir x:\ -ErrorAction Stop
    }
    catch {
        Write-PSFMessage -Level Error -Message 'Something went wrong' -ErrorRecord $_ -EnableException $true
    }
}

Write-PSFMessage -Level Host 'Starting test'

f1

Write-PSFMessage -Level Host 'Finished test' 

#get all PSFMessages written in the current session
Get-PSFMessage

#create a new support pack file (compressed)
New-PSFSupportPackage -Path c:\
#import the compressed file into a variable
$x = Import-PSFClixml C:\powershell_support_pack_2021_08_12-13_44_15.cliDat
