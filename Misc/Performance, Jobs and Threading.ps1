function mysleep {
    param([int]$Seconds)
    Start-Sleep -Seconds $Seconds
    Get-Date
}

#runs one after one and takes a bit more than 10 seconds
1..10 | ForEach-Object {
    Start-Sleep -Seconds 1
    Write-Host '.'
}

#Split Pipleines allws the same job to be done in a bit more than 1 second
$a = 1
$data = 1..10 | Split-Pipeline {
    process {
        mysleep -Seconds $a
        Write-Host '.'
    }
} -Variable a -Function mysleep -Verbose

#Using background jobs. Keep in mind that each job is a new PowerShell process
#which takes some time to do the initialization. Can be even slower than using
#a ForEach loop.
$start = Get-Date
$jobs = 1..10 | ForEach-Object {

    Start-Job -Name "Job $_" -ScriptBlock {
        Get-Date
        dir -Recurse -Directory -Path d:\
    }
}
$data = $jobs | Receive-Job -AutoRemoveJob -Wait
$end = Get-Date
"$($end - $start)"

#Using thread jobs. Each job is a new runspace (thread) inside the current
#PowerShell process.
$start = Get-Date
$jobs = 1..10 | ForEach-Object {

    Start-ThreadJob -Name "Job $_" -ScriptBlock {
        Get-Date
        dir -Recurse -Directory -Path d:\
    }
}
$data = $jobs | Receive-Job -AutoRemoveJob -Wait
$end = Get-Date
"$($end - $start)"