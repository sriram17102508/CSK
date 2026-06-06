$files = Get-ChildItem -Path "c:\Users\HP\Downloads\CSK\*.html"
foreach ($f in $files) {
    $content = Get-Content -Path $f.FullName -Raw
    $match = [regex]::Match($content, '(?s)<nav id="navbar">.*?</nav>')
    Write-Output "========================================"
    Write-Output "FILE: $($f.Name)"
    if ($match.Success) {
        # Limit print size
        $val = $match.Value
        Write-Output $val.Substring(0, [math]::Min(600, $val.Length))
    } else {
        Write-Output "No nav found"
    }
}
