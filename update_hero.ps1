$files = @{
    "about.html" = @("Our Story", "Discover the heritage and values that make Aetheria Haven a unique sanctuary.")
    "stays.html" = @("Accommodations", "Experience the perfect blend of luxurious comfort and untamed wilderness.")
    "experiences.html" = @("Activities", "Embark on unforgettable adventures and reconnect with nature.")
    "gallery.html" = @("Visual Journey", "Explore the breathtaking beauty of our pristine natural landscape.")
    "contact.html" = @("Get in Touch", "We are here to help you plan your perfect escape into the wild.")
}

foreach ($f in $files.Keys) {
    $content = Get-Content $f -Raw
    $location = $files[$f][0]
    $subtitle = $files[$f][1]
    
    # Replace the h1 with the span, h1, and p
    $content = [regex]::Replace($content, '(?s)<h1 class="hero-title">(.*?)</h1>', "<span class=`"hero-location`">$location</span>`n            <h1 class=`"hero-title`">`$1</h1>`n            <p class=`"hero-subtitle`">$subtitle</p>")
    
    Set-Content -Path $f -Value $content -NoNewline
}
