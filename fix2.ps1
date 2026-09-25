$files = Get-ChildItem -Filter *.html

$newHeader = @"
    <header class="header">
        <div class="container d-flex flex-wrap justify-content-between align-items-center">
            <a class="navbar-brand" href="index.html">
                WILDORA
            </a>
            
            <button class="navbar-toggler border-0 shadow-none d-lg-none p-0" type="button" data-bs-toggle="collapse" data-bs-target="#mobileNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <nav class="d-none d-lg-flex">
                <a href="index.html" class="nav-link">Home</a>
                <a href="about.html" class="nav-link">About</a>
                <a href="stays.html" class="nav-link">Stays</a>
                <a href="experiences.html" class="nav-link">Experiences</a>
                <a href="gallery.html" class="nav-link">Gallery</a>
                <a href="contact.html" class="nav-link">Contact</a>
            </nav>
            
            <a href="booking.html" class="btn btn-outline-wildora d-none d-lg-inline-block">Check Availability</a>
            
            <div class="collapse w-100 d-lg-none mt-3" id="mobileNav">
                <nav class="d-flex flex-column bg-primary p-3 rounded shadow">
                    <a href="index.html" class="nav-link py-2 border-bottom border-light border-opacity-10">Home</a>
                    <a href="about.html" class="nav-link py-2 border-bottom border-light border-opacity-10">About</a>
                    <a href="stays.html" class="nav-link py-2 border-bottom border-light border-opacity-10">Stays</a>
                    <a href="experiences.html" class="nav-link py-2 border-bottom border-light border-opacity-10">Experiences</a>
                    <a href="gallery.html" class="nav-link py-2 border-bottom border-light border-opacity-10">Gallery</a>
                    <a href="contact.html" class="nav-link py-2 mb-3">Contact</a>
                    <a href="booking.html" class="btn btn-outline-wildora w-100">Check Availability</a>
                </nav>
            </div>
        </div>
    </header>
"@

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw

    # 1. Update Favicon Link globally in case some were missed (like index.html which was reverted)
    $content = $content -replace '<link rel="icon" href="assets/icons/favicon.ico" type="image/x-icon">', '<link rel="icon" href="assets/icons/favicon.svg" type="image/svg+xml">'

    # 2. Update footer legal (remove it) globally
    $content = $content -replace '(?s)<div class="footer-legal">.*?</div>', ''

    # 3. Update footer brand (remove Camp) globally
    $content = $content -replace '<div class="footer-brand">WILDORA <span>Camp</span></div>', '<div class="footer-brand">WILDORA</div>'
    
    # 4. Replace entire header with new layout-preserving responsive header
    $content = $content -replace '(?s)<header class="header">.*?</header>', $newHeader

    Set-Content -Path $file.FullName -Value $content -NoNewline
}
