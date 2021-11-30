$a = @()

Measure-Command {
    1..100000 | ForEach-Object {
        $a += "Test $_"
    }

    $a.Count
}

Measure-Command {
    $al = [System.Collections.ArrayList]::new()
    1..100000 | ForEach-Object {
        [void]$al.Add("Test $_")
    }
}

$rnd = 1..10000 | ForEach-Object {
    Get-Random -Minimum 1 -Maximum 50000
}

($rnd2 = $rnd | Sort-Object -Unique).Count

$h = @{}
foreach ($item in $rnd) {
    try {
        $h.Add($item, $null)
    }
    catch {
        Write-Warning "Duplicate found: $item"
    }
}

$rnd | Group-Object | Where-Object Count -gt 1
