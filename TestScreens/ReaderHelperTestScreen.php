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
    else if(array_key_exists('checkoutDocs', $_POST)) {
        checkoutDocs();
    }
    else if(array_key_exists('reserveDocs', $_POST)) {
        reserveDocs();
    }
    else if(array_key_exists('returnDocs', $_POST)) {
        returnDocs();
    }
    
    function computeFine() {
        $res = ReaderHelper::computeFine(1);
        echo "Total Fine ".$res;
    }
    
    function checkoutDocs() {
        $RID = 1;
        
        $docCopies = array();

        //for loop
        $data1 = [
            'DOCID' => 8,
            'COPYNO' => 1,
            'BID' => 1,
        ];
        $docCopy1 = new DocumentCopyData($data1);
        array_push($docCopies, $docCopy1);
        
        $data2 = [
            'DOCID' => 9,
            'COPYNO' => 2,
            'BID' => 1,
        ];
        $docCopy2 = new DocumentCopyData($data2);
        
        array_push($docCopies, $docCopy2);
        
        ReaderHelper::checkoutDocs($docCopies, $RID);
    }
    
    function reserveDocs() {
        $RID = 1;
        
        $docCopies = array();

        //for loop
        $data1 = [
            'DOCID' => 8,
            'COPYNO' => 1,
            'BID' => 1,
        ];
        $docCopy1 = new DocumentCopyData($data1);
        array_push($docCopies, $docCopy1);
        
        $data2 = [
            'DOCID' => 9,
            'COPYNO' => 2,
            'BID' => 1,
        ];
        $docCopy2 = new DocumentCopyData($data2);
        
        array_push($docCopies, $docCopy2);
        
        ReaderHelper::reserveDocs($docCopies, $RID);
    }
    
    function returnDocs($BOR_NO) {
        ReaderHelper::returnDocs($BOR_NO);
    }
?>

<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <form method="post">
                    <input type="submit" name="computeFine" class="button" value="Compute Fine" />
                    <input type="submit" name="checkoutDocs" class="button" value="Checkout Docs" />
                    <input type="submit" name="reserveDocs" class="button" value="Reserve Docs" />
                    <input type="submit" name="returnDocs" class="button" value="Return Docs" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>
