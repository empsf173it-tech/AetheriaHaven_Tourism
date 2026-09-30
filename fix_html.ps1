$files = Get-ChildItem -Filter *.html
foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    $content = $content -replace 'class="btn btn-outline-aetheria d-none d-lg-inline-block"', 'class="btn btn-accent-aetheria d-none d-lg-inline-block"'
    $content = $content -replace 'class="btn btn-outline-aetheria w-100"', 'class="btn btn-accent-aetheria w-100"'
    Set-Content -Path $f.FullName -Value $content -NoNewline
}
