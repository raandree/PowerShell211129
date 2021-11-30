function f1 {
    [string]$b = ''
    $private:a
    $a
    $private:a = 'abc'
    $b
}

$private:a = 123
$private:a = 456
$b = 'test1'

1,2 | ForEach-Object { 
    $private:a
    $private:a = 456
}

f1

1