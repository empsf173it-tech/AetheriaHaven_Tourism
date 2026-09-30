$contactHtml = Get-Content 'contact.html' -Raw

$locationSvg = '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>'
$phoneSvg = '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>'
$emailSvg = '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>'

# Replace the specific block for Location
$contactHtml = $contactHtml -replace '(?s)(<div class="bg-primary text-accent rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 45px; height: 45px; flex-shrink: 0;">\s*<!-- SVG Icon Placeholder -->\s*)\?\?(.*?)<h5 class="heading-font text-primary mb-1">Location</h5>', "`$1$locationSvg`$2<h5 class=`"heading-font text-primary mb-1`">Location</h5>"

# Replace the specific block for Phone
$contactHtml = $contactHtml -replace '(?s)(<div class="bg-primary text-accent rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 45px; height: 45px; flex-shrink: 0;">\s*<!-- SVG Icon Placeholder -->\s*)\?\?(.*?)<h5 class="heading-font text-primary mb-1">Phone</h5>', "`$1$phoneSvg`$2<h5 class=`"heading-font text-primary mb-1`">Phone</h5>"

# Replace the specific block for Email
$contactHtml = $contactHtml -replace '(?s)(<div class="bg-primary text-accent rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 45px; height: 45px; flex-shrink: 0;">\s*<!-- SVG Icon Placeholder -->\s*)\?\?(.*?)<h5 class="heading-font text-primary mb-1">Email</h5>', "`$1$emailSvg`$2<h5 class=`"heading-font text-primary mb-1`">Email</h5>"

# Fix the Follow Us social icons (change text-primary to text-accent)
$contactHtml = $contactHtml -replace 'class="social-icon text-primary bg-primary text-white', 'class="social-icon text-accent bg-primary'

Set-Content -Path 'contact.html' -Value $contactHtml -NoNewline
