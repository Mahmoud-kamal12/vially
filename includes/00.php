<?php
ob_start(); // Initiate the output buffer
//ini_set('display_errors', 1);
//error_reporting(~0);
/* check connection */
error_reporting(0);
/*ini_set('display_errors',1);
ini_set('display_startup_errors',1);
error_reporting(-1);*/
$activationcode=file_get_contents("activationcode.txt");
$con=mysqli_connect("localhost","root","root","cost");
//$con=mysqli_connect("localhost","root","etolv123etolv","db");
if (!mysqli_set_charset($con, "utf8")) {
    //printf("Error loading character set utf8: %s\n", mysqli_error($con));
} else {
   // printf("Current character set: %s\n", mysqli_character_set_name($con));
}
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
$ch = curl_init();
$os="http://".$_SERVER[HTTP_HOST]."/pos/os.php";
curl_setopt($ch, CURLOPT_URL,"$os");
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS,
    "hash=".$activationcode."");

// in real life you should use something like:
// curl_setopt($ch, CURLOPT_POSTFIELDS,
//          http_build_query(array('postvar1' => 'value1')));

// receive server response ...
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$server_output = curl_exec ($ch);
if($server_output!=='1'){die();}
  ?>
  <?php
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
	  $user_ExpenseReports=$row_login['ExpenseReports'];
	  $user_ExpenseReports=$row_login['ExpenseReports'];
	  $user_profit=$row_login['profit'];
	  $user_employee=$row_login['employee'];
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
  if(isset($_POST['Editconfig'])){
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
$Edit_report='<div style="text-align:center; background-color:#95D183; border-radius:5px;float:right;width:100%; margin:0 auto;"">
<span style="float:left; padding-left:20px;"><img src="images/chmarkicon.png" style="border:0px;" /></span>
تم حفظ البيانات
</div>'; 
}
  }
  ?>
  <?php
			$result_get = @mysqli_query($con,"SELECT * FROM ".$prefix."_config where id='1'");
if(@mysqli_num_rows($result_get)>0){
while($row_get = mysqli_fetch_array($result_get))
  {
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
	   
	   $db_cat_items_show=$row_get['cat_items_show'];
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
//$run_barcode=0;
$Update_SellBuyPrice=1;
$key="4dd0ae2286d87bf4b4f575b5dddb3a18";
	function get_settings($id){
    global $con;
    $result_settings = @mysqli_query($con,"SELECT * FROM ".$prefix."_settings where id='$id'");
$num=@mysqli_num_rows($result_settings);
if($num>0){
while($row_settings = mysqli_fetch_array($result_settings))
  {
	 return $row_settings['value'];	 	 	 	
 } 
}
}
			?>
