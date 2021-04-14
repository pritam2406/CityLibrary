<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Record</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .wrapper{
            width: 600px;
            margin: 0 auto;
        }
    </style>
</head>

<?php
include('../DataManager/ReaderHelper.php');
    if(array_key_exists('computeFine', $_POST)) {
        computeFine();
    }
    
    function computeFine() {
        $res = ReaderHelper::computeFine(1);
        echo "Total Fine ".$res;
    }
?>

<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <form method="post">
                    <input type="submit" name="computeFine" class="button" value="Compute Fine" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>
