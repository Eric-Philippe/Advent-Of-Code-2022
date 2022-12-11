<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP - Hello, World!</title>
</head>
<body>
        <h1><?php echo 'Hello, World!'; ?></h1>
        <?php
            // Call the content of the PartOne.php file
            include 'PartOne.php';
            include 'PartTwo.php';
        ?>
</body>
</html>