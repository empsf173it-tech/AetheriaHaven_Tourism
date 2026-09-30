$indexHtml = Get-Content 'index.html' -Raw
if ($indexHtml -match '(?s)(<footer class="footer">.*?</footer>)') {
    $footerHtml = $matches[1]
    $files = Get-ChildItem -Filter *.html | Where-Object { $_.Name -ne 'index.html' }
    foreach ($file in $files) {
        $content = Get-Content $file.FullName -Raw
        $content = $content -replace '(?s)<footer class="footer">.*?</footer>', $footerHtml
        Set-Content -Path $file.FullName -Value $content -NoNewline
    }
}
