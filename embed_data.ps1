# Read the dashboard HTML and the records JSON, embed data into HTML
$html = Get-Content 'C:\Users\janed\OneDrive\Desktop\ClaudeTest\licat_dashboard.html' -Raw -Encoding UTF8
$json = Get-Content 'C:\Users\janed\OneDrive\Desktop\ClaudeTest\licat_records.json' -Raw -Encoding UTF8

# Replace the async loadData function and init() with an embedded-data version
$oldLoad = @'
async function loadData() {
  const res  = await fetch(API_URL, { mode: 'cors' });
  if (!res.ok) throw new Error(`HTTP ${res.status}`);
  const json = await res.json();
  if (!json.success) throw new Error('CKAN API error');
  return json.result.records;
}
'@

$newLoad = "function loadData() {`n  return Promise.resolve(EMBEDDED_RECORDS);`n}"

$embeddedVar = "const EMBEDDED_RECORDS = $json;`n`n"

# Insert embedded data before the loadData function
$html = $html.Replace($oldLoad, $embeddedVar + $newLoad)

# Also update the loading message
$html = $html.Replace(
  '<p>Fetching data from OSFI Open Government Portal…</p>',
  '<p>Loading embedded dataset…</p>'
)
$html = $html.Replace(
  "<p style=`"font-size:0.75rem;margin-top:0.5rem`">`n        If this hangs, try serving this file from a local web server (e.g. VS Code Live Server)`n        or open via <code>python -m http.server</code>`n      </p>",
  ''
)

$html | Out-File 'C:\Users\janed\OneDrive\Desktop\ClaudeTest\licat_dashboard.html' -Encoding UTF8
Write-Host "Done. Dashboard now has embedded data - no internet needed."
