$files = Get-ChildItem -Filter *.html

$newHeader = @"
    <header class="header">
        <nav class="navbar navbar-expand-lg navbar-light container">
            <a class="navbar-brand" href="index.html">
                WILDORA
            </a>
            
            <button class="navbar-toggler border-0 shadow-none text-primary" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="mainNav">
                <div class="navbar-nav ms-auto align-items-lg-center">
                    <a href="index.html" class="nav-link">Home</a>
                    <a href="stays.html" class="nav-link">Stays</a>
                    <a href="experiences.html" class="nav-link">Experiences</a>
                    <a href="gallery.html" class="nav-link">Gallery</a>
                    <a href="contact.html" class="nav-link">Contact</a>
                    <a href="booking.html" class="btn btn-outline-wildora mt-3 mt-lg-0 ms-lg-3">Check Availability</a>
                </div>
            </div>
        </nav>
    </header>
"@

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw

    # 1. Update footer legal (remove it)
    $content = $content -replace '(?s)<div class="footer-legal">.*?</div>', ''

    # 2. Update footer brand (remove Camp)
    $content = $content -replace '<div class="footer-brand">WILDORA <span>Camp</span></div>', '<div class="footer-brand">WILDORA</div>'

    # 3. Update Favicon Link
    $content = $content -replace '<link rel="icon" href="assets/icons/favicon.ico" type="image/x-icon">', '<link rel="icon" href="assets/icons/favicon.svg" type="image/svg+xml">'

    # 4. Replace entire header with new responsive header
    $content = $content -replace '(?s)<header class="header">.*?</header>', $newHeader

    Set-Content -Path $file.FullName -Value $content -NoNewline
}
