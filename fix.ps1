$files = Get-ChildItem -Filter *.html

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw

    # Fix footer columns
    # 1. col-lg-4 -> col-12 col-md-6 col-lg-4
    $content = $content -replace '<div class="col-lg-4">', '<div class="col-12 col-md-6 col-lg-4">'
    
    # 2. col-6 col-lg-2 offset-lg-1 -> col-12 col-md-6 col-lg-2 offset-lg-1
    $content = $content -replace '<div class="col-6 col-lg-2 offset-lg-1">', '<div class="col-12 col-md-6 col-lg-2 offset-lg-1">'
    
    # 3. col-6 col-lg-2 -> col-12 col-md-6 col-lg-2
    $content = $content -replace '<div class="col-6 col-lg-2">', '<div class="col-12 col-md-6 col-lg-2">'
    
    # 4. col-12 col-lg-3 -> col-12 col-md-6 col-lg-3
    $content = $content -replace '<div class="col-12 col-lg-3">', '<div class="col-12 col-md-6 col-lg-3">'

    # Fix hamburger color natively by changing navbar-light to navbar-dark
    $content = $content -replace 'navbar-light', 'navbar-dark'
    
    # Ensure button itself doesn't have text-primary if it overrides dark mode
    $content = $content -replace 'navbar-toggler border-0 shadow-none text-primary', 'navbar-toggler border-0 shadow-none'

    Set-Content -Path $file.FullName -Value $content -NoNewline
}

# Ensure hamburger is white regardless by adding custom CSS as a fallback
$cssPath = "assets/css/style.css"
$cssContent = Get-Content $cssPath -Raw
if ($cssContent -notmatch '.navbar-toggler-icon') {
    $cssContent += "`n/* Hamburger Icon Fix */`n.navbar-dark .navbar-toggler-icon, .navbar-toggler-icon { filter: invert(1) grayscale(100%) brightness(200%); }`n"
    Set-Content -Path $cssPath -Value $cssContent -NoNewline
}
