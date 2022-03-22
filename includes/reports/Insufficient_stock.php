

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<?php $totalxpenses_invee=""; ?>

<?php
function alert($id){
    global $con;
    $result_getbalance = mysqli_query($con,"SELECT Quantity FROM items where id='".$id."'");
    if(@mysqli_num_rows($result_getbalance)>0){
        while($row_getbalance = mysqli_fetch_array($result_getbalance))
        {
            $totalgetbalance=$row_getbalance['Quantity'];
        }
    }

    //  echo $row_items['id'];
    $sqlalast = "SELECT item,id,Quantity,date,SupplierID FROM ".$prefix."_receivings where item='".$id."'  UNION ALL SELECT item,id,Quantity*-1,date,SupplierID FROM ".$prefix."_sales where item='".$id."'";
    //$sqla = "SELECT *
    //FROM sales t1
    //LEFT JOIN receivings t2 ON t1.inv_id=t2.inv_id AND t1.item=t2.item AND t1.Quantity=t2.Quantity AND t1.SupplierID=t2.SupplierID AND t1.date=t2.date";
    $resultalast = @mysqli_query($con,$sqlalast);
    while($rowalast = @mysqli_fetch_array($resultalast))
    {
        $Quantitytotallast+=$rowalast['Quantity'];
    }
####################
    return $Quantitytotala=$totalgetbalance+$Quantitytotallast;
}
$q = ' ';
if (isset($_GET['products'])) {
    $q =  " id in (".implode(",",$_GET['products']) . ") and ";
}

$result_new = mysqli_query($con, "SELECT * FROM items  where ".$q." alert_shortcomings!=0");
$alr_num=@mysqli_num_rows($result_new);

if ($alr_num>=1) {
    $xxx=1;
    ?>
<div>


    <form method="get" id="" >
        <input type="hidden" value="Insufficient_stock" name="reports">
        <a href="reports.php?reports=Insufficient_stock"><img src="images/c.png" style="width:30px; height:30px; float:left; border:0px;" title="الغاء"></a>
        <select class="js-example-basic-multiple" name="products[]" multiple="multiple" style="width: 80%;margin-bottom: 10px">
            <?php
            $result_new22 = mysqli_query($con, "SELECT * FROM items where alert_shortcomings!=0");
            while ($row_new22 = mysqli_fetch_array($result_new22)) {

                $alr=alert($row_new22['id']);
                if($row_new22['alert_shortcomings']>=$alr){
                    $ch = ' ';
                    if (isset($_GET['products'])) {
                        $ch = in_array($row_new22['id'] ,$_GET['products'] ) ? 'selected':' ';
                    }
                    echo '<option '. $ch .' value="'.$row_new22['id'].'">' .$row_new22['item'] .'</option>';
                }

            }
            ?>

        </select>
        <div style="padding-top:20px; text-align:center; margin: 0 auto;margin-bottom: 20px"><input type="submit" value="<?php echo"$View_report_lang"; ?>" class="button" /></div>

    </form>

    <script>
        $(document).ready(function() {
            $('.js-example-basic-multiple').select2();
        });
    </script>
</div>
<table border="1" style="font-size:16px; width:100%; direction:rtl; border:1px; border-collapse:collapse;  text-align:center;">
        <thead>
        <td colspan="7" style="background-color:#09F;"><strong style="color:#FFF; font-size:22px;"> المخزون الناقص</strong></td>
        </thead>
        <thead style="background-color:#CCC;">

        <th  class="text-center">اسم المنتج</a></th>
        <th  class="text-center">الكميه المتاحه</a></th>
        <th  class="text-center">عرض الكميه</a></th>



        </thead>
    <?php
    while ($row_new = mysqli_fetch_array($result_new)) {



        $alr=alert($row_new['id']);
        if($row_new['alert_shortcomings']>=$alr){
            echo '<tr class=".$class."">';
            echo "<td>" .$row_new['item']."</td>";
            echo "<td>" .GetQuantity($row_new['id'])."</td>";
            echo "<td><a href='item_analysis.php?id=".$row_new['id']."'><img src='images/eye-dark.png' width='16' height='16'></a></td>";
            echo '</tr>';

//            echo $row_new['item'].'Mahmoud'.$row_new['']. '<br>';
        }
        $xxx++;

    }
}
?>
</table>





<?php include"includes/footer.php"; ?>