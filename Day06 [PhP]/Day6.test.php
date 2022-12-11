<?php
namespace App\Tests\Entity;
use PHPUnit\Framework\TestCase;
class ProductTesT extends TestCase 
{
    public function testCutter()
    {
        $text = "abacadef";
        for ($i = 0; $i < strlen($input); $i++) {
        $nextFourChar = substr($input, $i, 4);
        // Check if all the characters are unique, returns the index
        $currentChars = str_split($nextFourChar);
        $uniqueChars = array_unique($currentChars);
        if (count($uniqueChars) == 4) {
            echo $i + 4;
            break;
        }

        $this->assertEquals(8, $i + 4);
    }
}