<?php
include "includes/inc.php";
$q = ' ';
if (isset($_GET['q'])) {
    $q =  $_GET['q'];
}
$from = date("Y-m-d");
if (isset($_GET['from'])) {
    $from =  $_GET['from'];
}

$to = date("Y-m-d");
if (isset($_GET['to'])) {
    $to =  $_GET['to'];
}
    $sqlalast = "SELECT {$prefix}_sales.item as 'id' ,
    ( SELECT items.item FROM items WHERE items.id  = {$prefix}_sales.item) as 'name' ,
    ( SELECT colors.color FROM colors WHERE colors.id  = {$prefix}_sales.color) as 'color',
    ( SELECT sizes.size FROM sizes WHERE sizes.id  = {$prefix}_sales.size) as 'size' , 
    SUM({$prefix}_sales.Quantity)  as 'quantity'
    FROM cairo_sales 
    WHERE {$q} {$prefix}_sales.date BETWEEN '{$from}' and '{$to}' 
    GROUP BY {$prefix}_sales.item , {$prefix}_sales.color , {$prefix}_sales.size" ;

$result_new = mysqli_query($con, $sqlalast);

?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <style type="text/css">

            /* printer specific CSS */
            @media print
            {
                #contentnoprint { display:none;}
                #contentnoprint2 { display:none;}
                #contentnoprint3 { display:none;}
                #table_print{
                    border: none;
                }
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="menu_source/styles.css" rel="stylesheet" type="text/css">
        <script type='text/javascript' src='menu_source/menu_jquery.js'></script>
        <title><?php echo"" . $get_db_CompanyName . ""; ?></title>

        <?php include"includes/css.php"; ?>
        <?php include"includes/js.php"; ?>
    </head>
    <body  class="cmenu1 example-target" dir="rtl">

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="table_print">
                            <thead style="background-color:#CCC;">
                                <th  class="text-center">اسم المنتج</a></th>
                                <th  class="text-center">اللون </a></th>
                                <th  class="text-center">المقاس</a></th>
                                <th  class="text-center">الكميه</a></th>
                            </thead>
                            <?php
                            while ($row_new = mysqli_fetch_array($result_new)) {

                                    echo '<tr class=".$class."">';
                                    echo "<td>" .$row_new['name']."</td>";
                                    echo "<td>" .$row_new['color']."</td>";
                                    echo "<td>" .$row_new['size']."</td>";
                                    echo "<td>" .$row_new['quantity']."</td>";
                                    echo '</tr>';

                                $xxx++;
                            }
                            ?>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </body>

    </html>
<?php include 'includes/footer.php'; ?>