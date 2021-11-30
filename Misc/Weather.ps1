$lat = 48.357564
$lon = 11.380814
$city = 'Munich'
$api = '0f6e0a68aa642cbf0e3d616630d62b55'
$url = "https://api.openweathermap.org/data/2.5/weather?q={0}&appid={1}" -f $city, $api
$url = "https://api.openweathermap.org/data/2.5/onecall?lat={0}&lon={1}&appid={2}" -f $lat, $lon, $api

Invoke-RestMethod -Uri $url -Method Get