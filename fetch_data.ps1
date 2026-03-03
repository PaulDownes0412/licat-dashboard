$r = Invoke-RestMethod -Uri 'https://open.canada.ca/data/en/api/3/action/datastore_search?resource_id=69b6fcd5-50c9-43bd-bd18-3f4e031854d0&limit=500'
Write-Host ("Records: " + $r.result.records.Count)
$r.result.records | ConvertTo-Json -Depth 5 -Compress | Out-File 'C:\Users\janed\OneDrive\Desktop\ClaudeTest\licat_records.json' -Encoding UTF8
Write-Host "Saved to licat_records.json"
