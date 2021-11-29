function Update-Gui {
    # Basically WinForms Application.DoEvents()
    $window.Dispatcher.Invoke([Windows.Threading.DispatcherPriority]::Background, [action]{})
}

$ui = Get-Content -Path $PSScriptRoot\WpfApp1\WpfApp1\MainWindow.xaml
$ui = $ui -replace 'x:Class=".+"', ''
$ui = $ui -replace 'mc:Ignorable="d"', ''
$ui = [xml]$ui

$reader = New-Object System.Xml.XmlNodeReader -ArgumentList $ui
$window = [System.Windows.Markup.XamlReader]::Load($reader)
$script:dir = @()

$btnGo = $window.FindName('btnGo')
$lstItems = $window.FindName('lstItems')
$btnClear = $window.FindName('btnClear')
$labCount = $window.FindName('labCount')
$btnGo.Add_Click({
        1..10 | ForEach-Object {
            $lstItems.Items.Add($_)
            Start-Sleep -Milliseconds 100
            Update-Gui
            $script:dir += dir c:\
        }
})

$btnClear.Add_Click({
        $lstItems.Items.Clear()
        $labCount.Content = $script:dir.Count
})

$window.ShowDialog()