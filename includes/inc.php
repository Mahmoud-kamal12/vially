<?php

ob_start(); // Initiate the output buffer

$dir =  getcwd();
$dir = explode('/',$dir);
$dir = $dir[array_key_last($dir)];

//ini_set('display_errors', 1);
//error_reporting(~0);
/* check connection */
error_reporting(0);
/*ini_set('display_errors',1);
ini_set('display_startup_errors',1);

// $user = "etolv_vially";
// $password = "Ipa~Sq#alVa[";
// db = "etolv_vially";

// $user = "etolv_vially";
// $password = "Ipa~Sq#alVa[";
// db = "etolv_vially";

error_reporting(-1);*/
$activationcode=file_get_contents("activationcode.txt");
$con=mysqli_connect("localhost","etolv_vially","etolv_vially","etolv_vially");

$allow_num_users=400;
$allow_num_cat=27000;
$allow_num_items=5000;
//$con=mysqli_connect("localhost","posmsyst_farah","eI@;#0o-BGMP","posmsyst_farahtest");
//$con=mysqli_connect("localhost","viallywe_app","Dg9tex[Fiq+q","viallywe_app");
if (!mysqli_set_charset($con, "utf8")) {
    //printf("Error loading character set utf8: %s\n", mysqli_error($con));
} else {
    // printf("Current character set: %s\n", mysqli_character_set_name($con));
}
if (mysqli_connect_errno())
{
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
$prefix=(string)$dir;
$branches = ['cairo','embaba', 'kawmya' , 'moderea' , 'shibin' , 'pos1' , 'pos2' , 'pos3' , 'store'];
include"includes/lang_ar.php";
$expire=time()+60*60*24*30*24;
if(isset($_POST['login'])){
    setcookie("user", "".$_POST['username']."", $expire);
    setcookie("pass", "".$_POST['password']."", $expire);
    if(isset($_GET['fm'])){
        $url="http".$_GET['fm']."";
    }else{
        $url="index.php";
    }
    header("Location: ".$url."");
}
$usernamek=$_COOKIE["user"];
$passwordk=$_COOKIE["pass"];
$result_login = @mysqli_query($con,"SELECT * FROM ".$prefix."_users where username='$usernamek' and password='$passwordk'");
$num=@mysqli_num_rows($result_login);
if($num>0){
    $login=1;
    while($row_login = mysqli_fetch_array($result_login))
    {
        $user_id=$row_login['id'];
        $user_name=$row_login['name'];
        $user_username=$row_login['username'];
        $user_password=$row_login['password'];
        $user_IsAdmin=$row_login['IsAdmin'];
        $user_sale=$row_login['sale'];
        $user_buy=$row_login['buy'];
        $user_SoldReturns=$row_login['SoldReturns'];
        $user_purchasesReturns=$row_login['purchasesReturns'];
        $user_DeleteBllsOfSale=$row_login['DeleteBllsOfSale'];
        $user_DeletePurchaseInvoices=$row_login['DeletePurchaseInvoices'];
        $user_ModifyBillsOfSale=$row_login['ModifyBillsOfSale'];
        $user_ModifyBillsBuy=$row_login['ModifyBillsBuy'];
        $user_Revenue=$row_login['Revenue'];
        $user_Expenses=$row_login['Expenses'];
        $user_Customers=$row_login['Customers'];
        $user_Suppliers=$row_login['Suppliers'];
        $user_GeneralSettings=$row_login['GeneralSettings'];
        $user_Groups=$row_login['Groups'];
        $user_Items=$row_login['Items'];
        $user_UsersAndPermissions=$row_login['UsersAndPermissions'];
        $user_ReportsPurchases=$row_login['ReportsPurchases'];
        $user_SalesReports=$row_login['SalesReports'];
        $user_ReportsSuppliers=$row_login['ReportsSuppliers'];
        $user_CustomerReports=$row_login['CustomerReports'];
        $user_InventoryReports=$row_login['InventoryReports'];
        $user_ReportsRevenues=$row_login['ReportsRevenues'];
        $user_ExpenseReports=$row_login['ExpenseReports'];

        $user_ReportsOfPayments=$row_login['ReportsOfPayments'];
        $user_EditPrice=$row_login['EditPrice'];
        $user_user_treasury=$row_login['user_treasury'];
        $user_profit=$row_login['profit'];
        $user_employee=$row_login['employee'];
        $user_add_item=$row_login['add_item'];
        $user_edit_item=$row_login['edit_item'];
        $user_del_item=$row_login['del_item'];

        $user_permision_treasury_withdrawal = $row_login['permision_treasury_withdrawal'];
        $user_permision_treasury_deposit = $row_login['permision_treasury_deposit'];
        $user_permision_delete_treasury = $row_login['permision_delete_treasury'];
        $user_Item_movement_detection = $row_login['Item_movement_detection'];
        $user_barcode_manual = $row_login['barcode_manual'];
        $user_Cost_price = $row_login['Cost_price'];

        $user_colors = $row_login['colors'];
        $user_sizes = $row_login['sizes'];


    }
}else{$login=0;}
if($login=="0"){
    $url="login.php";
    if(basename($_SERVER['PHP_SELF'])==$url){}else{
        $fm=basename("http://".$_SERVER[HTTP_HOST]."".$_SERVER[REQUEST_URI]."");
        $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        $url="login.php?fm=".str_replace('http', '', $actual_link)."";
        header("Location: ".$url."");
    }
}
?>
<?php
$demo=0;
if(isset($_POST['Editconfig'])){
    if($demo==1){
        $Edit_report='<div class="alert alert-warning text-right">
                   "'.$demo_alert.'"
                            </div>';
    }else{
        $CompanyName=Trim(stripslashes($_POST['CompanyName']));
        $Phone=Trim(stripslashes($_POST['Phone']));
        $TimeZone=Trim(stripslashes($_POST['TimeZone']));

        $Currency=Trim(stripslashes($_POST['Currency']));
        $Language=Trim(stripslashes($_POST['Language']));
        $E_mail=Trim(stripslashes($_POST['E_mail']));
        $Website=Trim(stripslashes($_POST['Website']));
        $Address=Trim(stripslashes($_POST['Address']));
        $ReturnPolicy=Trim(stripslashes($_POST['ReturnPolicy']));
        $CustomField1=Trim(stripslashes($_POST['CustomField1']));
        $CustomField2=Trim(stripslashes($_POST['CustomField2']));
        $PrintingAftermarket=Trim(stripslashes($_POST['PrintingAftermarket']));
        if(mysqli_query($con,"UPDATE ".$prefix."_config set CompanyName='".$CompanyName."',TimeZone='".$TimeZone."',Currency='".$Currency."',Language='".$Language."',E_mail='".$E_mail."',Website='".$Website."',Address='".$Address."',ReturnPolicy='".$ReturnPolicy."',Phone='".$Phone."',CustomField1='".$CustomField1."',CustomField2='".$CustomField2."',PrintingAftermarket='".$PrintingAftermarket."' WHERE id='1'"))
        {
            $Edit_report='<div class="alert alert-success text-right">
'.$Data_is_saved_lang.'
</div>';
        }
    }
}
?>
<?php
$result_get = @mysqli_query($con,"SELECT * FROM ".$prefix."_config where id='1'");
if(@mysqli_num_rows($result_get)>0){
    while($row_get = mysqli_fetch_array($result_get))
    {
        $open_from =$row_get['open_from'];
        $close_to =$row_get['close_to'];
        $get_db_id=$row_get['id'];
        $get_db_CompanyName=$row_get['CompanyName'];
        $get_db_isLogo=$row_get['isLogo'];
        $get_db_Logo=$row_get['Logo'];
        $get_db_TimeZone=$row_get['TimeZone'];
        $get_db_Currency=$row_get['Currency'];
        $get_db_sales_type=$row_get['sales_type'];
        if($get_db_Currency==1){$get_db_Currency="ريال"; $db_currency="1";}
        else if($get_db_Currency==2){$get_db_Currency="جنيه"; $db_currency="2";}
        else if($get_db_Currency==3){$get_db_Currency="دينار"; $db_currency="3";}
        else if($get_db_Currency==4){$get_db_Currency="دولار"; $db_currency="4";}
        else if($get_db_Currency==5){$get_db_Currency="يورو"; $db_currency="5";}
        else{}
        $get_db_Language=$row_get['Language'];
        $get_db_E_mail=$row_get['E_mail'];
        $get_db_Website=$row_get['Website'];
        $get_db_PrintingAftermarket=$row_get['PrintingAftermarket'];
        $get_db_Address=$row_get['Address'];
        $get_db_ReturnPolicy=$row_get['ReturnPolicy'];
        $get_db_Phone=$row_get['Phone'];
        $get_db_Branch=$row_get['Branch'];
        $get_db_CustomField1=$row_get['CustomField1'];
        $get_db_CustomField2=$row_get['CustomField2'];
        $get_db_CustomField3=$row_get['CustomField3'];
        $get_db_LastInvoiceNo=$row_get['LastreceivingsInvoiceNo'];
        $get_db_LastsaleInvoiceNo=$row_get['LastsaleInvoiceNo'];
        $get_db_receivings_type=$row_get['receivings_type'];
        $db_cat_items_show=$row_get['cat_items_show'];
    }
}

$open_from = DateTime::createFromFormat('H:i:s', $open_from);
$close_to = DateTime::createFromFormat('H:i:s', $close_to);
$now = DateTime::createFromFormat('H:i:s',date("H:i:s") );

if ($now > $open_from && $now < $close_to) {}else{

    if ($_COOKIE["user"] !== null){
        setcookie("user", "", time()-99999999999999);
        setcookie("pass", "", time()-99999999999999);
        /*	function backURL($url)
            {
                $backURL = split("backURL=",$url);
                return $backURL[1];
            }*/
        $fm=urlencode(getenv("HTTP_REFERER"));
        $url="login.php?fm=".str_replace('http', '', $fm)."";
        header("Location: ".$url."");
        exit();
    }

}

date_default_timezone_set(''.$get_db_TimeZone.'');
$dateonly=date("Y-m-d");
$items_per_page=50;
$Discount_type=1; // 1 مبلغ  - 2 نسبة
$showGroups=1; //1 ظهور / 0 اخفاء
if($showGroups==0){$db_cat_items_show=0;}
$inv_barcode=1;
$run_barcode=1;
$Retail_allow=0;
$Retail_Buying=0;
//$run_barcode=0;
$Update_SellBuyPrice=2;   //1 or 2
$key="4dd0ae2286d87bf4b4f575b5dddb3a18";
$use_colors=1;
$use_sizes=1;
function get_settings($id){
    global $con;
    $result_settings = @mysqli_query($con,"SELECT * FROM settings where id='$id'");
    $num=@mysqli_num_rows($result_settings);
    if($num>0){
        while($row_settings = mysqli_fetch_array($result_settings))
        {
            return $row_settings['value'];
        }
    }
}
#################
function NumberBreakdown($number, $returnUnsigned = false)
{
    $negative = 1;
    if ($number < 0)
    {
        $negative = -1;
        $number *= -1;
    }

    if ($returnUnsigned){
        return array(
            floor($number),
            ($number - floor($number))
        );
    }

    return array(
        floor($number) * $negative,
        ($number - floor($number)) * $negative
    );
}
#############################
function Get_total_items($sizeid,$colorid,$item){
    global $con;
    global $prefix;
    if($sizeid=="0"){
        $result_qty=@mysqli_query($con,"SELECT (Quantity*-1) as Quantitya  FROM ".$prefix."_sales where color='$colorid' and item='$item' union all select (Quantity) as Quantitya from ".$prefix."_receivings where color='$colorid' and item='$item' ");
    }else{
        $result_qty=@mysqli_query($con,"SELECT (Quantity*-1) as Quantitya  FROM ".$prefix."_sales where color='$colorid' and size='$sizeid' and item='$item' union all select (Quantity) as Quantitya from ".$prefix."_receivings where color='$colorid' and size='$sizeid' and item='$item' ");
    }
    $num_qty=@mysqli_num_rows($result_qty);

    if($num_qty>0) {
        while ($row_qty= mysqli_fetch_array($result_qty)) {
            $totalqty+=$row_qty[Quantitya];
        }
        return $totalqty;
    }
}



function checkQuantity($id , $color , $size ,$quantityt) {
    global $con;
    global $prefix;

    $sqlalast = "SELECT SUM(Quantity) as qq FROM ".$prefix ."_receivings where  item='$id' and color = '$color ' and size = '$size'";


    $resultalast = @mysqli_query($con, $sqlalast);
    $row = @mysqli_fetch_row($resultalast);
    $receivings = $row[0];

    $sqlalast = "SELECT SUM(Quantity) as qq FROM ".$prefix ."_sales where  item='$id' and color = '$color ' and size = '$size'";


    $resultalast = @mysqli_query($con, $sqlalast);
    $row = @mysqli_fetch_row($resultalast);
    $sales = $row[0];



    $sales == null ? 0 : $sales;
    $receivings == null ? 0 : $receivings;

    $all  = $receivings - $sales;

    if($all >= $quantityt and $all > 0)
        return true;
    else{
        return false;
    }

}

function GetQuantity($id,$all=null) {
    global $con;
    global $prefix;
    ############################
    $sqlalast = "SELECT item,id,Quantity,date,SupplierID FROM ".$prefix . "_receivings where  item='$id'  UNION ALL SELECT item,id,Quantity*-1,date,SupplierID FROM " . $prefix . "_sales where item='$id'";
    $resultalast = @mysqli_query($con, $sqlalast);
    while ($rowalast = @mysqli_fetch_array($resultalast)) {
        $Quantitytotallast+=$rowalast['Quantity'];
    }
    ####################
    if($all=='1'){
        $result_search= mysqli_query($con,"SELECT Quantity FROM items WHERE  id ='$id'");
        if(@mysqli_num_rows($result_search)>0){
            $i=1;
            while($row_search= mysqli_fetch_array($result_search)) {
                $getQuantity=$row_search['Quantity'];
                return  $Quantitytotala = $Quantitytotallast+$getQuantity;
            }

        }
    }else{
        return  $Quantitytotala = $Quantitytotallast;
    }
}
#############
function Get_model_name($modelid){
    global $con;
    $result_models= @mysqli_query($con,"SELECT item FROM items where id=".$modelid." order by id ASC");
    $num_models=@mysqli_num_rows($result_models);
    if($num_models>0) {
        while ($row_models= mysqli_fetch_array($result_models)) {
            $model_db=$row_models['item'];

        }
    }
    return $model_db;
}
#######################
function colors_option($id) {
    global $con;
    $result_colors = @mysqli_query($con, "SELECT * FROM colors order by id ASC");
    $num_colors = @mysqli_num_rows($result_colors);
    if ($num_colors > 0) {
        while ($row_colors = mysqli_fetch_array($result_colors)) {
            if ($id == $row_colors['id']) {
                $colors_option.='<option value="' . $row_colors['id'] . '" selected>' . $row_colors['color'] . '</option >';
            } else {
                $colors_option.='<option value="' . $row_colors['id'] . '">' . $row_colors['color'] . '</option >';
            }
        }
        echo $colors_option;
    }
}

function code_option($code) {
    global $con;
    $result_code = @mysqli_query($con, "SELECT * FROM items");
    $num = @mysqli_num_rows($result_code);
    if ($num > 0) {
        while ($row_code = mysqli_fetch_array($result_code)) {
            if ($code == $row_code['id']) {
                $costs_types.='<option value="' . $row_code['id'] . '" selected>' . $row_code['item'] . '</option >';
            } else {
                $costs_types.='<option value="' . $row_code['id'] . '">' . $row_code['item'] . '</option >';
            }
        }
        echo $costs_types;
    }
}

function products_option($id=null) {
    global $con;
    $result_product = @mysqli_query($con, "SELECT * FROM products where id!=-1");
    $num_product = @mysqli_num_rows($result_product);
    if ($num_product > 0) {
        while ($row_product = mysqli_fetch_array($result_product)) {
            if ($id == $row_product['id']) {
                $products_option.='<option value="' . $row_product['id'] . '" selected>' . $row_product['product_name'] . '</option >';
            } else {
                $products_option.='<option value="' . $row_product['id'] . '">' . $row_product['product_name'] . '</option >';
            }
        }
        echo $products_option;
    }
}
#######################
function Get_product_name($productid=null){
    global $con;
    $result_products= @mysqli_query($con,"SELECT product_name FROM products where id=".$productid." order by id ASC");
    $num_products=@mysqli_num_rows($result_products);
    if($num_products>0) {
        while ($row_products= mysqli_fetch_array($result_products)) {
            $product_db=$row_products['product_name'];

        }
    }
    return $product_db;
}
#######################
#########################
function get_color_name($colorid){
    global $con;
    $result_colors= @mysqli_query($con,"SELECT * FROM colors where id=".$colorid." order by id ASC");
    $num_colors=@mysqli_num_rows($result_colors);
    if($num_colors>0) {
        while ($row_colors= mysqli_fetch_array($result_colors)) {
            $color_db=$row_colors['color'];

        }
    }
    return $color_db;
}
#######################
function Get_size_name($sizeid){
    global $con;
    $result_sizes= @mysqli_query($con,"SELECT * FROM sizes where id=".$sizeid." order by id ASC");
    $num_sizes=@mysqli_num_rows($result_sizes);
    if($num_sizes>0) {
        while ($row_sizes= mysqli_fetch_array($result_sizes)) {
            $size_db=$row_sizes['size'];

        }
    }
    if($size_db==null){
        return 0;
    }else{
        return $size_db;
    }
}
################################# 
function new_bug($bug_num,$date,$notes){
    global $con;
    $sqlbug = "INSERT INTO bugs (bug_num, date, notes)
VALUES ('".$bug_num."','".$date."','".$notes."')";
    mysqli_query($con, $sqlbug);
}
#########################
#############################
#############################
function get_clolors_of_item($itemid){
    global $con;
    $result= @mysqli_query($con,"SELECT colors FROM items where id=".$itemid."");
    $num=@mysqli_num_rows($result);
    if($num>0) {
        while ($row= mysqli_fetch_array($result)) {
            $colors=$row['colors'];

        }
    }
    return $colors;
}
#############################
function get_sizes_of_item($itemid){
    global $con;
    $result= @mysqli_query($con,"SELECT sizes FROM items where id=".$itemid."");
    $num=@mysqli_num_rows($result);
    if($num>0) {
        while ($row= mysqli_fetch_array($result)) {
            $sizes=$row['sizes'];

        }
    }
    return $sizes;
}
#######################
function get_price_of_item($itemid){
    global $con;
    $result= @mysqli_query($con,"SELECT Retail_price FROM items where id=".$itemid."");
    $num=@mysqli_num_rows($result);
    if($num>0) {
        while ($row= mysqli_fetch_array($result)) {
            $price=$row['Retail_price'];

        }
    }
    return $price;
}
#######################
function Get_model_barcode($modelid){
    global $con;
    $result_models= @mysqli_query($con,"SELECT Barcode FROM items where id=".$modelid." order by id ASC");
    $num_models=@mysqli_num_rows($result_models);
    if($num_models>0) {
        while ($row_models= mysqli_fetch_array($result_models)) {
            $model_db=$row_models['Barcode'];

        }
    }
    return $model_db;
}
##################################
function Get_model_groupid($modelid){
    global $con;
    $result_models= @mysqli_query($con,"SELECT groupid FROM items where id=".$modelid." order by id ASC");
    $num_models=@mysqli_num_rows($result_models);
    if($num_models>0) {
        while ($row_models= mysqli_fetch_array($result_models)) {
            $model_db=$row_models['groupid'];

        }
    }
    return $model_db;
}
##################################
//$css_dir="http://" . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];
//$css_dir=dirname($css_dir);
function get_hide_items(){
    global $con;
    global $prefix;
    $result_hide_items= @mysqli_query($con,"SELECT * FROM ".$prefix."_items_hide");
    $num_hide_items=@mysqli_num_rows($result_hide_items);
    if($num_hide_items>0) {
        while ($row_hide_items= mysqli_fetch_array($result_hide_items)) {
            $hide_items_db.="'";
            $hide_items_db.=$row_hide_items['item'];
            $hide_items_db.="'";
            $hide_items_db.=',';
        }
    }
    if($num_hide_items<1){return '0';}else{
        return rtrim($hide_items_db, ",");
    }
}
##################
function currently_users(){
    global $con;
    global $prefix;
    $currently_users = @mysqli_query($con,"SELECT id FROM ".$prefix."_users");
    return $num_currently_users=@mysqli_num_rows($currently_users);
}

function currently_products(){
    global $con;
    $currently_products = @mysqli_query($con,"SELECT id FROM products");
    return $num_curr_products=@mysqli_num_rows($currently_products);
}

function currently_items(){
    global $con;
    $currently_items = @mysqli_query($con,"SELECT id FROM items");
    return $num_curr_items=@mysqli_num_rows($currently_items);
}
?>
