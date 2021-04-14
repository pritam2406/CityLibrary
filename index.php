<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .wrapper{
            width: 600px;
            margin: 0 auto;
        }
        table tr td:last-child{
            width: 120px;
        }
    </style>
    <script>
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();   
        });
    </script>
</head>
<body>
    <div class="wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="mt-5 mb-3 clearfix">
                        <h2 class="pull-left">Home</h2>
                        <a href="TestScreens/BranchTestScreen.php" class="btn btn-success pull-right"><i class="fa fa-plus"></i>Branch Test Screen</a>
                        <a href="TestScreens/ReaderTestScreen.php" class="btn btn-success pull-right"><i class="fa fa-plus"></i>Reader Test Screen</a>
                        <a href="TestScreens/PersonTestScreen.php" class="btn btn-success pull-right"><i class="fa fa-plus"></i>Person Test Screen</a>
                        <a href="TestScreens/PublisherTestScreen.php" class="btn btn-success pull-right"><i class="fa fa-plus"></i>Publisher Test Screen</a>
                        <a href="TestScreens/AdminHelperTestScreen.php" class="btn btn-success pull-right"><i class="fa fa-plus"></i>Admin Helper Test Screen</a>
                        <a href="TestScreens/ReaderHelperTestScreen.php" class="btn btn-success pull-right"><i class="fa fa-plus"></i>Reader Helper Test Screen</a>
                    </div>
                </div>
            </div>        
        </div>
    </div>
</body>
</html>
