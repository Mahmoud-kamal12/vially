<?php
include "includes/inc.php";
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
            }
        </style>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
               <title><?php echo"" . $get_db_CompanyName . ""; ?></title>
        <script>
            function showResults(str) {
                if (str.length == 0) {
                    document.getElementById("livesearchcl").innerHTML = "";
                    document.getElementById("livesearchcl").style.border = "0px";
                    return;
                }
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                } else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        document.getElementById("livesearchcl").innerHTML = xmlhttp.responseText;
                        document.getElementById("livesearchcl").style.border = "0px solid #A5ACB2";
                    }
                }
                xmlhttp.open("GET", "suppliers_search_r.php?q=" + str, true);
                xmlhttp.send();
            }
        </script>
        <script>
            function showResultspaym(str) {
                if (str.length == 0) {
                    document.getElementById("livesearchcl").innerHTML = "";
                    document.getElementById("livesearchcl").style.border = "0px";
                    return;
                }
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                } else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        document.getElementById("livesearchcl").innerHTML = xmlhttp.responseText;
                        document.getElementById("livesearchcl").style.border = "0px solid #A5ACB2";
                    }
                }
                xmlhttp.open("GET", "suppliers_search_paym_r.php?q=" + str, true);
                xmlhttp.send();
            }
        </script>
        <script>
            function showResultsOfItems(str) {
                if (str.length == 0) {
                    document.getElementById("livesearch").innerHTML = "";
                    document.getElementById("livesearch").style.border = "0px";
                    return;
                }
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                } else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        document.getElementById("livesearch").innerHTML = xmlhttp.responseText;
                        document.getElementById("livesearch").style.border = "0px solid #A5ACB2";
                    }
                }
                xmlhttp.open("GET", "items_search_r.php?q=" + str, true);
                xmlhttp.send();
            }
        </script>

        <script>
            function showResultsOfItemssalei(str) {
                if (str.length == 0) {
                    document.getElementById("livesearch30").innerHTML = "";
                    document.getElementById("livesearch30").style.border = "0px";
                    return;
                }
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                } else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        document.getElementById("livesearch30").innerHTML = xmlhttp.responseText;
                        document.getElementById("livesearch30").style.border = "0px solid #A5ACB2";
                    }
                }
                xmlhttp.open("GET", "items_search_sale_r.php?q=" + str, true);
                xmlhttp.send();
            }
        </script>
        <script>
            function showResultsOfCli(str) {
                if (str.length == 0) {
                    document.getElementById("livesearchcli").innerHTML = "";
                    document.getElementById("livesearchcli").style.border = "0px";
                    return;
                }
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                } else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        document.getElementById("livesearchcli").innerHTML = xmlhttp.responseText;
                        document.getElementById("livesearchcli").style.border = "0px solid #A5ACB2";
                    }
                }
                xmlhttp.open("GET", "clients_search_r.php?q=" + str, true);
                xmlhttp.send();
            }
        </script>
        <script>
            function showResultsOfClipaym(str) {
                if (str.length == 0) {
                    document.getElementById("livesearchcli").innerHTML = "";
                    document.getElementById("livesearchcli").style.border = "0px";
                    return;
                }
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                } else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        document.getElementById("livesearchcli").innerHTML = xmlhttp.responseText;
                        document.getElementById("livesearchcli").style.border = "0px solid #A5ACB2";
                    }
                }
                xmlhttp.open("GET", "clients_search_paym_r.php?q=" + str, true);
                xmlhttp.send();
            }
        </script>
        <script>
            function showResultsOfItemssr(str) {
                if (str.length == 0) {
                    document.getElementById("livesearchit40").innerHTML = "";
                    document.getElementById("livesearchit40").style.border = "0px";
                    return;
                }
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                } else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        document.getElementById("livesearchit40").innerHTML = xmlhttp.responseText;
                        document.getElementById("livesearchit40").style.border = "0px solid #A5ACB2";
                    }
                }
                xmlhttp.open("GET", "items_search_resale_r.php?q=" + str, true);
                xmlhttp.send();
            }
        </script>
        <script>
            function showResultsOfItemsrew(str) {
                if (str.length == 0) {
                    document.getElementById("livesearch22").innerHTML = "";
                    document.getElementById("livesearch22").style.border = "0px";
                    return;
                }
                if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                } else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        document.getElementById("livesearch22").innerHTML = xmlhttp.responseText;
                        document.getElementById("livesearch22").style.border = "0px solid #A5ACB2";
                    }
                }
                xmlhttp.open("GET", "showResultsOfItemsrew.php?q=" + str, true);
                xmlhttp.send();
            }
        </script>
        <?php include"includes/css.php"; ?>
           <?php include"includes/js.php"; ?>
          <link href="menu_source/styles.css" rel="stylesheet" type="text/css">
<script type='text/javascript' src='menu_source/menu_jquery.js'></script>
<script type="text/javascript" src="js/chart.js"></script>  
    </head>
    <body class="cmenu1 example-target">

        <div>
            <div>
                <?php
                if ($get_db_isLogo == 1) {
                    if ($get_db_Logo == "") {
                        echo '<img src="images/yourLogoHere.png" style="float:left; border:0px;"/>';
                    } else {
                        echo '<img src="uploads/' . $get_db_Logo . '" style="float:left; border:0px;"/>';
                    }
                } else {
                    //echo"<div class='logodiv'>$get_db_CompanyName</div>";
                }
                ?>
            </div>
            <?php
            include"includes/buttons.php";
            ?>
        </div>

        <div id='main'>
            <article style="margin-bottom:70px;">
                <style>
                    .wrap {
                        width: 100%;
                        overflow:auto;
                    }

                    .fleft {
                        float:left; 
                        width: 80%;
                        text-align:center;
                        min-height:400px;
                    }

                    .fright {
                        float: right;
                        min-height: 400px;
                        width: 20%;
                        text-align:center;
                    }

                </style>


                <div class="wrap">
                    <div class="fleft">
                        <?php if ($_GET['reports'] == "items_and_inventory" or $_GET['reports'] == null or $_GET['reports'] == "Insufficient_stock"  or  $_GET['reports'] == "Insufficient_stock_sales" ) {
                            
                        } else { ?>
                            <form method="get" id="contentnoprint">
                                <div style="width:70%; margin:0 auto;">
                                    <?php
                                    if ($_GET['reports'] == "expenses") { ?>
                                    
                                                                            <select name="type" size="1" class="form-control">
                                            <option value="">الكل</option>
    <?php
    $expensestype = mysqli_query($con, "SELECT * FROM " . $prefix . "_expenses_set order by id ASC");
    $num_expensestype = mysqli_num_rows($expensestype);
    if ($num_expensestype > 0) {
        while ($row_expensestype = mysqli_fetch_array($expensestype)) {
            if ($row_expensestype['id'] == $_GET['type']) {
                echo'<option value="' . $row_expensestype['id'] . '"   selected="selected">' . $row_expensestype['expensestype'] . '</option>';
            } else {
                echo'<option value="' . $row_expensestype['id'] . '">' . $row_expensestype['expensestype'] . '</option>';
            }
        }
    }
    ?>
                                        </select>

                                        
                                    <?php } ?>
                                    
                                    <?php
                                    if ($_GET['reports'] == "client_returns" or $_GET['reports'] == "customer_payments") {
                                        $result_search_clientid = mysqli_query($con, "SELECT name FROM " . $prefix . "_clients WHERE id='" . $_GET['clientID'] . "'");
                                        if (@mysqli_num_rows($result_search_clientid) > 0) {
                                            while ($row_search_clientid = mysqli_fetch_array($result_search_clientid)) {
                                                $clientname = $row_search_clientid['name'];
                                            }
                                        }
                                        ?>
                                        <div style="width:20%; float:right;"><label style="float:right; font-size:16px;"><?php echo"$The_client_lang"; ?></label><input type="text" name="client" id="client" dir="rtl" value="<?php if (isset($_GET['clientID'])) {
                                    echo"" . $clientname . "";
                                } ?>" class="w100" <?php if ($_GET['reports'] == "customer_payments") { ?> onkeyup="showResultsOfClipaym(this.value);" <?php } else { ?> onkeyup="showResultsOfCli(this.value);"<?php } ?>  autocomplete="off" />
                                            <div id="livesearchcli" style="z-index:1000000000; width:20%; padding-right:50px;  text-align:right; margin-top:5px;  float:right; position:fixed; border:0px; "></div>
                                            <input type="hidden" name="clientID" value="<?php echo"" . $_GET['clientID'] . ""; ?>" />
                                        </div>
                                    <?php } ?>

                                    <?php
                                    if ($_GET['reports'] == "suppliers_receivings" or $_GET['reports'] == "payments_suppliers") {
                                        $result_search_suppliersid = mysqli_query($con, "SELECT name FROM " . $prefix . "_suppliers WHERE id='" . $_GET['SupplierID'] . "'");
                                        if (@mysqli_num_rows($result_search_suppliersid) > 0) {
                                            while ($row_search_suppliersid = mysqli_fetch_array($result_search_suppliersid)) {
                                                $suppliername = $row_search_suppliersid['name'];
                                            }
                                        }
                                        ?>
                                        <div style="width:20%; float:right;"><label style="float:right; font-size:16px;"><?php echo"$The_Supplier_lang"; ?></label><input type="text" name="supplier" id="supplier" dir="rtl" value="<?php if (isset($_GET['SupplierID'])) {
                                            echo"" . $suppliername . "";
                                        } ?>" class="w100"  <?php if ($_GET['reports'] == "payments_suppliers") { ?>onkeyup="showResultspaym(this.value)"<?php } else { ?>onkeyup="showResults(this.value)" <?php } ?>  autocomplete="off" />
                                            <div id="livesearchcl" style="z-index:1000000000; width:20%; padding-right:50px;  text-align:right; margin-top:5px;  float:right; position:fixed; border:0px; "></div>
                                            <input type="hidden" name="SupplierID" value="<?php echo"" . $_GET['SupplierID'] . ""; ?>" />
                                        </div>
                                    <?php } ?>
                                    <?php
                                    if ($_GET['reports'] == "item_sale") {
                                        $result_search_itemsid = mysqli_query($con, "SELECT item FROM items WHERE id='" . $_GET['q'] . "'");
                                        if (@mysqli_num_rows($result_search_itemsid) > 0) {
                                            while ($row_search_itemsid = mysqli_fetch_array($result_search_itemsid)) {
                                                $itemsname = $row_search_itemsid['item'];
                                            }
                                        }
                                        ?>
                                        <div style="width:20%; float:right;"><label style="float:right; font-size:16px;"><?php echo"$the_Item_lang"; ?></label><input type="text" name="item" id="item" value="<?php if (isset($_GET['q'])) {
                                            echo"" . $itemsname . "";
                                        } ?>" onkeyup="showResultsOfItemssalei(this.value)" autocomplete="off"  class="w100" />
                                            <div id="livesearch30" style="z-index:1000000000; width:20%; padding-right:50px;  text-align:right; margin-top:5px;  float:right; position:fixed; border:0px; "></div>
                                            <input type="hidden" name="q" value="<?php echo"" . $_GET['q'] . ""; ?>" />
                                        </div>
                                    <?php } ?>
                                    <?php
                                    if ($_GET['reports'] == "item_receivings") {
                                        $result_search_itemsid = mysqli_query($con, "SELECT item FROM items WHERE id='" . $_GET['q'] . "'");
                                        if (@mysqli_num_rows($result_search_itemsid) > 0) {
                                            while ($row_search_itemsid = mysqli_fetch_array($result_search_itemsid)) {
                                                $itemsname = $row_search_itemsid['item'];
                                            }
                                        }
                                        ?>
                                        <div style="width:20%; float:right;"><label style="float:right; font-size:16px;"><?php echo"$the_Item_lang"; ?></label><input type="text" name="item" id="item" value="<?php if (isset($_GET['q'])) {
                                            echo"" . $itemsname . "";
                                        } ?>" onkeyup="showResultsOfItemsrew(this.value)" autocomplete="off"  class="w100" />
                                            <div id="livesearch22" style="z-index:1000000000; width:20%; padding-right:50px;  text-align:right; margin-top:5px;  float:right; position:fixed; border:0px; "></div>
                                            <input type="hidden" name="q" value="<?php echo"" . $_GET['q'] . ""; ?>" />
                                        </div>
                                    <?php } ?>
                                    <?php
                                    if ($_GET['reports'] == "items_returns") {
                                        $result_search_itemsid = mysqli_query($con, "SELECT item FROM items WHERE id='" . $_GET['q'] . "'");
                                        if (@mysqli_num_rows($result_search_itemsid) > 0) {
                                            while ($row_search_itemsid = mysqli_fetch_array($result_search_itemsid)) {
                                                $itemsname = $row_search_itemsid['item'];
                                            }
                                        }
                                        ?>
                                        <div style="width:20%; float:right;"><label style="float:right; font-size:16px;"><?php echo"$the_Item_lang"; ?></label><input type="text" name="item" id="item" value="<?php if (isset($_GET['q'])) {
                                    echo"" . $itemsname . "";
                                } ?>" onkeyup="showResultsOfItemssr(this.value)" autocomplete="off"  class="w100" />
                                            <div id="livesearchit40" style="z-index:1000000000; width:20%; padding-right:50px;  text-align:right; margin-top:5px;  float:right; position:fixed; border:0px; "></div>
                                            <input type="hidden" name="q" value="<?php echo"" . $_GET['q'] . ""; ?>" />
                                        </div>

    <?php } ?>
                                    <div style="width:40%; float:right;"><label style="float:right; font-size:16px;"><?php echo"$from_lang"; ?></label><input type="date" name="from" id="from" value="<?php if (isset($_GET['from'])) {
        echo"" . $_GET['from'] . "";
    } else {
        echo date("d/m/Y");
    } ?>" class="w100" /> 
                                        <script type="text/javascript">
                                            $('#from').dateEntry({dateFormat: 'dmy/', spinnerImage: ''});
                                        </script>
                                    </div>
                                    <div style="width:40%; float:right;"><label style="float:right; font-size:16px;"><?php echo"$to_lang"; ?></label> <input type="date" name="to" id="to" value="<?php if (isset($_GET['to'])) {
        echo"" . $_GET['to'] . "";
    } else {
        echo date("d/m/Y");
    } ?>" class="w100" />  
                                        <script type="text/javascript">
                                            $('#to').dateEntry({dateFormat: 'dmy/', spinnerImage: ''});
                                        </script>

                                    </div>

                                </div>
                                <?php if ($_GET['reports'] == 'sales' or $_GET['reports'] == 'sales_returns' ) { ?>
                                    <label style="float:right; font-size:16px;">اختر البائع</label>
                                    <select name="seller" id="seller" onchange="valw(this)">
                                        <option value="0" selected >الكل</option>

                                        <?php

                                        $result_cat = mysqli_query($con, "SELECT * FROM " . $prefix . "_staff ");
                                        while ($row_cat = mysqli_fetch_array($result_cat)) {
                                            $ss = (isset($_GET['seller']) and $_GET['seller'] == $row_cat['id'] )?  'selected' : ' ';
                                            echo  "<option ".$ss." value='".$row_cat['id']."'>" .$row_cat['name']."</option>";
                                        }
                                        ?>

                                    </select>
                                <?php }?>
                                <div style="float:right; padding-top:20px; text-align:center;"><input type="submit" value="<?php echo"$View_report_lang"; ?>" class="button" /></div>
                                <input type="hidden" name="reports" value="<?php echo"" . $_GET['reports'] . ""; ?>" />
                            </form>
                        <?php } ?>
                        <?php
                        if ($_GET['reports'] == "receivings") {
                            include"includes/reports/receivings_r.php";
                        } else if ($_GET['reports'] == "sales") {
                            include"includes/reports/sales_r.php";
                        } else if ($_GET['reports'] == "receivings_returns") {
                            include"includes/reports/receivings_returns_r.php";
                        } else if ($_GET['reports'] == "expenses") {
                            include"includes/reports/expenses_r.php";
                        }else if ($_GET['reports'] == "list_customer") {
                            include"includes/reports/list_customer.php";
                        } else if ($_GET['reports'] == "suppliers_receivings") {
                            include"includes/reports/suppliers_receivings_r.php";
                        }else if ($_GET['reports'] == "Insufficient_stock") {
                            include"includes/reports/Insufficient_stock.php";
                        }else if ($_GET['reports'] == "Insufficient_stock_sales") {
                            include"includes/reports/Insufficient_stock_sales.php";
                        } else if ($_GET['reports'] == "item_receivings") {
                            include"includes/reports/item_receivings_r.php";
                        } else if ($_GET['reports'] == "sales_returns") {
                            include"includes/reports/sales_returns_r.php";
                        } else if ($_GET['reports'] == "client_returns") {
                            include"includes/reports/client_returns_r.php";
                        } else if ($_GET['reports'] == "items_returns") {
                            include"includes/reports/items_returns_r.php";
                        } else if ($_GET['reports'] == "profit") {
                            include"includes/reports/profit.php";
                        } else if ($_GET['reports'] == "items_and_inventory") {
                            include"includes/reports/items_and_inventory.php";
                        } else if ($_GET['reports'] == "customer_payments") {
                            include"includes/reports/customer_payments_r.php";
                        } else if ($_GET['reports'] == "payments_suppliers") {
                            include"includes/reports/payments_suppliers_r.php";
                        } else if ($_GET['reports'] == "item_sale") {
                            include"includes/reports/item_sale_r.php";
                        } else {
                            if ($user_IsAdmin == 1) {

  $this_year=date("Y");                     
if($_GET['chart']=="daily"){
     echo"<h3>".$Daily_sales_lang."</h3>";
    $sql_chart = "SELECT DATE_FORMAT(date, '%d') as monthe,sum(Total) as total FROM ".$prefix."_sales_inv where type in('1','2') and date_format(date, '%Y-%m')=date_format(now(), '%Y-%m') and YEAR(date)='$this_year' group by DAY(date)  order by DAY(date) ASC";
}else if($_GET['cahrt']=="monthly"){
     echo"<h3>".$Monthly_sales_lang."</h3>";
$sql_chart = "SELECT DATE_FORMAT(date, '%m-%Y') as monthe,sum(Total) as total FROM ".$prefix."_sales_inv where type in('1','2') and YEAR(date)='$this_year' group by MONTH(date)  order by MONTH(date) ASC";
}else{
 $sql_chart = "SELECT DATE_FORMAT(date, '%m-%Y') as monthe,sum(Total) as total FROM ".$prefix."_sales_inv where type in('1','2')  and YEAR(date)='$this_year' group by MONTH(date)  order by MONTH(date) ASC";   
}
    echo"<ul class='list-inline'>
        <li><a href='?chart=monthly'>".$Monthly_sales_lang."</a></li>
       <li><a href='?chart=daily'>".$Daily_sales_lang."</a></li>
                        </ul>";
	$result_chart = @mysqli_query($con,$sql_chart);
        $chart_num=@mysqli_num_rows($result_chart);
        $chart_i=1;
        while($row_chart = @mysqli_fetch_array($result_chart)){
           if($chart_i==$chart_num){ $chart_months.="'".$row_chart['monthe']."'";}else{ $chart_months.="'".$row_chart['monthe']."',"; }
           if($chart_i==$chart_num){ $chart_total.="'".$row_chart['total']."'";}else{ $chart_total.="'".$row_chart['total']."',"; }
           $chart_i++;
        }
?>
          		<canvas id="canvas" height="300" width="580"></canvas>

    

	<script>
        var barChartData = {
    labels: [<?php echo"$chart_months"; ?>],
    datasets: [
        {
            label: "المبيعات الشهرية",
            fillColor: "rgba(245, 124, 21, 0.75)",
            strokeColor: "#901B1B",
            highlightFill: "#0026F8",
            highlightStroke: "#901B1B",
            data: [<?php echo"$chart_total"; ?>]
        }
    ]
};

	window.onload = function(){
		var ctx = document.getElementById("canvas").getContext("2d");
		window.myBar = new Chart(ctx).Line(barChartData, {
			responsive : true
		});
	}

	</script>
                                <table border="1" style="width:50%; text-align:center; margin:0 auto; border-collapse:collapse;">
                                        <tr>
                                        <td>

        <?php
        $result_gettreasury = mysqli_query($con, "SELECT SUM(Amount) as Amount FROM " . $prefix . "_treasury");
        $row_gettreasury = mysqli_fetch_assoc($result_gettreasury);
        print $totaltreasury = round($row_gettreasury['Amount'], 2);
        ?>  
                                        </td>
                                        <td><?php echo"$Total_cash_treasury_lang"; ?></td>
                                    </tr>
                                    <tr>
                                        <td>    <?php
                                            $result_getsales_inv = mysqli_query($con, "SELECT SUM(Total) as Total FROM " . $prefix . "_sales_inv where supplier!=''");
                                            $row_getsales_inv = mysqli_fetch_assoc($result_getsales_inv);
                                            $totalsales_inv = $row_getsales_inv['Total'];
#######################
                                            $result_getbalancescl = mysqli_query($con, "SELECT balance FROM " . $prefix . "_clients");
                                            if (@mysqli_num_rows($result_getbalancescl) > 0) {
                                                while ($row_getbalancescl = mysqli_fetch_array($result_getbalancescl)) {
                                                    $totalgetbalancecl+=$row_getbalancescl['balance'];
                                                }
                                            }
                                            print round(($totalgetbalancecl + $totalsales_inv), 2);
######################################################
                                            ?></td> 
                                        <td><?php echo"$Customers_dues_lang"; ?></td>

                                    </tr>
                                    <tr>
                                        <td><?php
                                            $result_getreceivings_inv = mysqli_query($con, "SELECT SUM(Total) as Total FROM " . $prefix . "_receivings_inv where supplier!=''");
                                            $row_getreceivings_inv = mysqli_fetch_assoc($result_getreceivings_inv);
                                            $totalreceivings_inv = $row_getreceivings_inv['Total'];
#######################
##################
                                            $result_getbalances = mysqli_query($con, "SELECT balance FROM " . $prefix . "_suppliers");
                                            if (@mysqli_num_rows($result_getbalances) > 0) {
                                                while ($row_getbalances = mysqli_fetch_array($result_getbalances)) {
                                                    $totalgetbalance+=$row_getbalances['balance'];
                                                }
                                            }
######################################################
                                            print($totalgetbalance + $totalreceivings_inv);
                                            ?></td>
                                        <td><?php echo"$Debt_to_suppliers_lang"; ?></td>
                                    </tr>
                                    <tr>
                                        <td><?php
##################
                                            $result_price = mysqli_query($con, "SELECT price,Quantity,id FROM items");
                                            if (@mysqli_num_rows($result_price) > 0) {
                                                while ($row_price = mysqli_fetch_array($result_price)) {
                                                    $totalgetprice+=$row_price['price'] * ($row_price['Quantity'] + GetQuantity($row_price['id']));
                                                }
                                            }
######################################################
                                            print round($totalgetprice, 2);
                                            ?></td>
                                        <td><?php echo"$stock_Purchase_price_lang"; ?></td>
                                    </tr>


                                    <tr>
                                        <td><?php
##################
                                            $result_Retail_price = mysqli_query($con, "SELECT Retail_price,Quantity,id FROM items");
                                            if (@mysqli_num_rows($result_Retail_price) > 0) {
                                                while ($row_Retail_price = mysqli_fetch_array($result_Retail_price)) {
                                                    $totalgetRetail_price+=$row_Retail_price['Retail_price'] * ($row_Retail_price['Quantity'] + GetQuantity($row_Retail_price['id']));
                                                }
                                            }
                                            print round($totalgetRetail_price, 2);
######################################################
                                            ?></td>
                                        <td><?php echo"$stock_Selling_price_lang"; ?></td>
                                    </tr>




                                </table>

        <?php
    }
}
?>
                    </div>
                    <div class="fright" id="contentnoprint3">
                        
                        <div id='cssmenu'>
                            <ul>
                                <li class='<?php if ($_GET['reports'] == "") {
    echo"active";
} ?>'><a href='reports.php'><span><?php echo"$Reports_lang"; ?></span></a></li>
                                <li class='<?php if ($_GET['reports'] == "receivings" or $_GET['reports'] == "receivings_returns" or $_GET['reports'] == "suppliers_receivings" or $_GET['reports'] == "item_receivings") {
    echo"active";
} ?>'><a href='#'><span><?php echo"$Purchases_lang"; ?></span></a>
                                    <ul>
                                        <li><a href='?reports=receivings'><span><?php echo"$Purchases_lang"; ?></span></a></li>
                                        <li><a href='?reports=receivings_returns'><span><?php echo"$Returns_Purchases_lang"; ?></span></a></li>
                                        <li class='last'><a href='?reports=suppliers_receivings'><span><?php echo"$Purchases_supplier_lang"; ?></span></a></li>
                                        <li class='last'><a href='?reports=item_receivings'><span><?php echo"$Purchases_items_lang"; ?></span></a></li>
                                    </ul>
                                </li>
                                <li class='<?php if ($_GET['reports'] == "list_customer" or $_GET['reports'] == "sales" or $_GET['reports'] == "sales_returns" or $_GET['reports'] == "client_returns" or $_GET['reports'] == "items_returns") {
    echo"active";
} ?>'><a href='#'><span><?php echo"$sales_lang"; ?></span></a>
                                    <ul>
                                        <li><a href='?reports=sales'><span><?php echo"$sales_lang"; ?></span></a></li>
                                        <li><a href='?reports=item_sale'><span><?php echo"$Sales_items_lang"; ?></span></a></li>
                                        <li><a href='?reports=sales_returns'><span><?php echo"$Sales_returns_lang"; ?></span></a></li>

                                        <li><a href='?reports=list_customer'><span><?php echo"$list_customer"; ?></span></a></li>
                                        <li class='last'><a href='?reports=client_returns'><span><?php echo"$Returns_client_lang"; ?></span></a></li>
                                        <li class='last'><a href='?reports=items_returns'><span><?php echo"$Return_items_lang"; ?></span></a></li>
                                    </ul>
                                </li>

                                <li class='<?php if ($_GET['reports'] == "expenses") {
    echo"active";
} ?>'><a href='?reports=expenses'><span><?php echo"$Expenses_lang"; ?></span></a></li>
                                <li class='<?php if ($_GET['reports'] == "payments_suppliers") {
    echo"active";
} ?>'><a href='?reports=payments_suppliers'><span><?php echo"$Suppliers_payments_lang"; ?></span></a></li>
                                <li class='<?php if ($_GET['reports'] == "customer_payments") {
    echo"active";
} ?>'><a href='?reports=customer_payments'><span><?php echo"$Customers_payments_lang"; ?></span></a></li>
                                <li class='<?php if ($_GET['reports'] == "items_and_inventory") {
    echo"active";
} ?>'><a href='?reports=items_and_inventory'><span><?php echo"$Items_and_inventory_lang"; ?></span></a></li>
                                <li class='<?php if ($_GET['reports'] == "profit") {
    echo"active";
} ?>'><a href='?reports=Insufficient_stock'><span><?php echo"$Insufficient_stock"; ?></span></a></li>
                                <li class='<?php if ($_GET['reports'] == "Insufficient_stock") {
                                    echo"active";
} ?>'><a href='?reports=profit'><span><?php echo"$profits_lang"; ?></span></a></li>
                                <li class='<?php if ($_GET['reports'] == "Insufficient_stock_sales") {
                                    echo"active";
} ?>'><a href='?reports=Insufficient_stock_sales'><span><?php echo"الناقص من مخزون المبيعات"; ?></span></a></li>
                            </ul>
                        </div>
                    </div>

                </div>

            </article>

        </div>

        <div id="toolbar">
            <footer>
<?php include"includes/scroller_container.php"; ?>
            </footer>
        </div>
    </body>
</html>
<?php include 'includes/footer.php'; ?>