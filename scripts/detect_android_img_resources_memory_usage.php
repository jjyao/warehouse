<?php
$images = glob("*.{jpg,png}", GLOB_BRACE);
$memories = array();
foreach($images as $image) {
    $size = getimagesize($image);
    if($size) {
        $width = $size[0];
        $height = $size[1];
        // ARGB 4 bits
        $memory = $width * $height * 4;
        $memories[$image] = $memory;
    }
}
arsort($memories);
print_r($memories);
