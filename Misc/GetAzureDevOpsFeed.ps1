function Get-Feed {
    param(
        [Parameter(Mandatory, ParameterSetName = 'cred')]
        [pscredential]$Credential,

        [Parameter(Mandatory, ParameterSetName = 'token')]
        [string]$AccessTokenString
    )

    $fqdn = 'DSCDO01.contoso.com'
    $port = 8080
    $collection = 'AutomatedLab'    

    $url = 'https://{0}:{1}/{2}/_apis/packaging/feeds?api-version=5.0-preview.1' -f $fqdn, $port, $organization

    $param = @{
        Method = 'Get'
        Uri = $url
    }

    if ($AccessTokenString) {
        $AccessTokenString = "{0}:{1}" -f '',$AccessTokenString
        $bytes = [Text.Encoding]::ASCII.GetBytes($AccessTokenString)
        $tokenString = [System.Convert]::ToBase64String($bytes)
        $tokenString = 'Basic {0}' -f $tokenString

        $param.Add('Headers', @{ Authorization = $tokenString })
    }
    else {
        $param.Add('Credential', $Credential)
    }

    Invoke-RestMethod @param
}

$cred = [pscredential]::new('contoso\install', ('Somepass1' | ConvertTo-SecureString -AsPlainText -Force))
$accessToken = '5ggh4s656e5plj7ckedp4g4gsw43hvdwif655bbdac6bd2bfkhla'

Get-Feed -Credential $cred
Get-Feed -AccessTokenString $accessToken    
