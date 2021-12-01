#Install-Module -Name dbatools -Force
Get-Command -Module dbatools

$instance = 'dsccasql01'
$database = 'Demo2'

$db = New-DbaDatabase -Name $database -SqlInstance $instance

$columns = @(
    @{
        Name = 'ID'
        Type = 'int'
        Nullable = $false
        Identity = $true
    }
    @{
        Name = 'Firstname'
        Type = 'NVarChar'
        Nullable = $false
    }
    @{
        Name = 'Lastname'
        Type = 'NVarChar'
        Nullable = $false
    }
)
New-DbaDbTable -SqlInstance $instance -Database $database -Name Persons -ColumnMap $columns

$persons = @(
    [pscustomobject]@{
        Firstname = 'Peter'
        Lastname = 'Smith'
    }
    [pscustomobject]@{
        Firstname = 'John'
        Lastname = 'Doe'
    }
)

$persons | Write-DbaDbTableData -Database $database -Table Persons -SqlInstance $instance

$data = Invoke-DbaQuery -SqlInstance $instance -Database $database -Query 'SELECT * FROM Persons'
$data = Invoke-DbaQuery -SqlInstance $instance -Query 'SELECT * FROM [Demo2].[dbo].[Persons]'
$data = Invoke-DbaQuery -SqlInstance $instance -Query @'
USE Demo2
SELECT * FROM Persons
'@
$data[1].Lastname
