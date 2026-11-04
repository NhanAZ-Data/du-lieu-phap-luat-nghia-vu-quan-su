param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Url
)

$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = New-Object System.Text.UTF8Encoding($false)
$word = $null
$document = $null

try {
    $word = New-Object -ComObject Word.Application
    $word.Visible = $false
    $word.DisplayAlerts = 0
    $document = $word.Documents.Open($Url)
    [Console]::Write($document.Content.Text)
}
finally {
    if ($null -ne $document) {
        $document.Close($false)
    }
    if ($null -ne $word) {
        $word.Quit()
    }
}
