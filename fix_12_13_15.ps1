$experiencesHtml = Get-Content 'experiences.html' -Raw

# Point 12: Add images to experience cards
$experiencesHtml = $experiencesHtml -replace '(?s)<h4 class="heading-font mb-3">Spring</h4>', '<img src="assets/images/gallery1.jpg" alt="Spring" class="img-fluid rounded mb-3 w-100" style="height: 150px; object-fit: cover;">`n                          <h4 class="heading-font mb-3">Spring</h4>'
$experiencesHtml = $experiencesHtml -replace '(?s)<h4 class="heading-font mb-3">Summer</h4>', '<img src="assets/images/gallery2.jpg" alt="Summer" class="img-fluid rounded mb-3 w-100" style="height: 150px; object-fit: cover;">`n                          <h4 class="heading-font mb-3">Summer</h4>'
$experiencesHtml = $experiencesHtml -replace '(?s)<h4 class="heading-font mb-3">Autumn</h4>', '<img src="assets/images/gallery3.jpg" alt="Autumn" class="img-fluid rounded mb-3 w-100" style="height: 150px; object-fit: cover;">`n                          <h4 class="heading-font mb-3">Autumn</h4>'
$experiencesHtml = $experiencesHtml -replace '(?s)<h4 class="heading-font mb-3">Winter</h4>', '<img src="assets/images/gallery4.jpg" alt="Winter" class="img-fluid rounded mb-3 w-100" style="height: 150px; object-fit: cover;">`n                          <h4 class="heading-font mb-3">Winter</h4>'

Set-Content -Path 'experiences.html' -Value $experiencesHtml -NoNewline

# Point 13: Add social buttons in contact.html
$contactHtml = Get-Content 'contact.html' -Raw
$socialHtml = @"
                        <div class="mt-5">
                            <h5 class="heading-font text-primary mb-3">Follow Us</h5>
                            <div class="social-icons d-flex gap-3">
                                <a href="#" class="social-icon text-primary bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; text-decoration:none;">
                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.469h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.469h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg>
                                </a>
                                <a href="#" class="social-icon text-primary bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; text-decoration:none;">
                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>
                                </a>
                            </div>
                        </div>
"@

if ($contactHtml -notmatch "Follow Us") {
    $contactHtml = $contactHtml -replace '(?s)bookings@AETHERIA HAVENcamp\.com</p>\s*</div>\s*</div>', "bookings@AETHERIA HAVENcamp.com</p>`n                        </div>`n                    </div>`n$socialHtml"
    Set-Content -Path 'contact.html' -Value $contactHtml -NoNewline
}

# Point 15: Fix tablet grid arrangement in index.html (Featured Stays)
$indexHtml = Get-Content 'index.html' -Raw
$indexHtml = $indexHtml -replace '<div class="col-md-4">', '<div class="col-md-6 col-lg-4">'
Set-Content -Path 'index.html' -Value $indexHtml -NoNewline
