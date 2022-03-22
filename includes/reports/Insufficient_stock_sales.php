

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<?php $totalxpenses_invee=""; ?>

<?php


    $result_getbalance = mysqli_query($con,"SELECT Quantity FROM items where id='".$id."'");
    if(@mysqli_num_rows($result_getbalance)>0){
        while($row_getbalance = mysqli_fetch_array($result_getbalance))
        {
            $totalgetbalance=$row_getbalance['Quantity'];
        }
    }
    $q = ' ';
if (isset($_GET['products'])) {
    $q =  " {$prefix}_sales.item in (".implode(",",$_GET['products']) . ") and ";
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
$alr_num=@mysqli_num_rows($result_new);
?>
<div>


<form method="get" id="" >

<div style="width:25%; float:right;">
<label style="font-size:16px;"><?php echo"$from_lang"; ?></label><input type="date" name="from" id="from" value="<?php if (isset($_GET['from'])) {
        echo"" . $_GET['from'] . "";
    } else {
        echo date("d/m/Y");
    } ?>" class="w100" /> 
                                        <script type="text/javascript">
                                            $('#from').dateEntry({dateFormat: 'dmy/', spinnerImage: ''});
                                        </script>
</div>

<div style="width:25%; float:right;">
    <label style="float:right; font-size:16px;"><?php echo"$to_lang"; ?></label> <input type="date" name="to" id="to" value="<?php if (isset($_GET['to'])) {
        echo"" . $_GET['to'] . "";
        } else {
        echo date("d/m/Y");
        } ?>" class="w100" />  
        <script type="text/javascript">
        $('#to').dateEntry({dateFormat: 'dmy/', spinnerImage: ''});
        </script>
</div>
                                    

    <input type="hidden" value="Insufficient_stock_sales" name="reports">

    <div style="width:30%; float:right;">
    <label style="font-size:16px;display: block;">الصنف</label>
    <a href="reports.php?reports=Insufficient_stock_sales" ><img src="images/c.png" style="width:30px; height:30px;" title="الغاء"></a>
    <select class="js-example-basic-multiple" name="products[]" multiple="multiple" style="width: 70%;margin-bottom: 10px">
    <?php
        $result_new22 = mysqli_query($con, "SELECT * FROM items ");
        while ($row_new22 = mysqli_fetch_array($result_new22)) {
                $ch = ' ';
                if (isset($_GET['products'])) {
                    $ch = in_array($row_new22['id'] ,$_GET['products'] ) ? 'selected':' ';
                }
                echo '<option '. $ch .' value="'.$row_new22['id'].'">' .$row_new22['item'] .'</option>';
        }
?>

    </select>
    </div>

    <div style="width:10%; float:right;">
    <div style="padding-top:20px; text-align:center; margin: 0 auto;margin-bottom: 20px"><input type="submit" value="<?php echo"$View_report_lang"; ?>" class="button" /></div>
    </div>

    <div style="width:10%; float:right;">
    <?php 
    $url = "print_item_table_report.php?to" . $to . "&from=" . $from ."&q=" . $q;
    ?>
    <button class="button" style="padding-top:20px; text-align:center; margin: 0 auto;margin-bottom: 20px;display: inline;" onclick="openPrint('<?=$url?>')">طباعه</button>
    </div>

</form>

<script>
    let openPrint = (url) => {
        
        let windowP = window.open(url, '13909375026416', 'width=700,height=600,toolbar=0,menubar=0,location=0,status=0,scrollbars=1,resizable=0,left=0,top=0,menubar=0');
        windowP.print();
        return false;
    }
    $(document).ready(function() {
        $('.js-example-basic-multiple').select2();
    });
</script>
</div>
<?php
if ($alr_num>=1) {
    $xxx=1;
    ?>
<table border="1" style="font-size:16px; width:100%; direction:rtl; border:1px; border-collapse:collapse;  text-align:center;">
        <thead>
        <td colspan="7" style="background-color:#09F;"><strong style="color:#FFF; font-size:22px;"> المخزون الناقص من المبيعات</strong></td>
        </thead>

        <thead style="background-color:#CCC;">

        <th  class="text-center">اسم المنتج</a></th>
        <th  class="text-center">اللون </a></th>
        <th  class="text-center">المقاس</a></th>
        <th  class="text-center">الكميه</a></th>
        <th  class="text-center">عرض فى المرايه</a></th>

        </thead>
    <?php
    while ($row_new = mysqli_fetch_array($result_new)) {

            echo '<tr class=".$class."">';
            echo "<td>" .$row_new['name']."</td>";
            echo "<td>" .$row_new['color']."</td>";
            echo "<td>" .$row_new['size']."</td>";
            echo "<td>" .$row_new['quantity']."</td>";
            echo "<td><a href='item_analysis.php?id=".$row_new['id']."'><img src='images/eye-dark.png' width='16' height='16'></a></td>";
            echo '</tr>';

        $xxx++;

    }
}
?>
</table>





<?php include"includes/footer.php"; ?>