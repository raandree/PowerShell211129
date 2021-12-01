#Convert data to Yaml
Get-Service | Select-Object -First 5 | ConvertTo-Json -Depth 3

#The powershell-yaml module does not provide a Depth paramter, hence it is easy to get into infinte loops
#The workaround is to use the JOSN for just limiting the depth.
Get-Service | Select-Object -First 5 | ConvertTo-Json -Depth 3 | ConvertFrom-Json | ConvertTo-Yaml
