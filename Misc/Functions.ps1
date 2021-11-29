function f1 {
    1
    $a = 5
    f2
    2    
}

function f2 {
    3
    $a = 10
    Write-Warning 'Something is about to go wrong'
    4
}

f1