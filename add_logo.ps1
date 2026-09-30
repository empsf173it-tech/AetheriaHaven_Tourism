$files = Get-ChildItem -Filter *.html
foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    
    # Update navbar-brand
    $content = $content -replace '(?s)<a class="navbar-brand" href="index\.html">\s*AETHERIA HAVEN\s*</a>', '<a class="navbar-brand" href="index.html">
                <img src="assets/icons/favicon.svg" alt="Logo" width="32" height="32">
                AETHERIA HAVEN
            </a>'

    # Update footer-brand
    $content = $content -replace '<div class="footer-brand">AETHERIA HAVEN</div>', '<div class="footer-brand d-flex align-items-center gap-2"><img src="assets/icons/favicon.svg" alt="Logo" width="36" height="36"> AETHERIA HAVEN</div>'

    Set-Content -Path $f.FullName -Value $content -NoNewline
}
