<?php
    // Read the input.txt file
    $input = file_get_contents('input.txt');
    
    for ($i = 0; $i < strlen($input); $i++) {
        $nextFourChar = substr($input, $i, 14);
        // Check if all the characters are unique, returns the index
        $currentChars = str_split($nextFourChar);
        $uniqueChars = array_unique($currentChars);
        if (count($uniqueChars) == 14) {
            echo $i + 14;
            break;
        }
    }

?>