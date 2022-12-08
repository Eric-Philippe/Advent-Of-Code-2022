<?php
    // Read the input.txt file
    $input = file_get_contents('input.txt');
    
    for ($i = 0; $i < strlen($input); $i++) {
        $nextFourChar = substr($input, $i, 4);
        // Check if all the characters are unique, returns the index
        $currentChars = str_split($nextFourChar);
        $uniqueChars = array_unique($currentChars);
        if (count($uniqueChars) == 4) {
            echo $i + 4;
            break;
        }
    }

?>