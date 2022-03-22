<?php
include"includes/inc.php";
/*
$page_size="A4";
$page_size_margin="0";
$body_width="700px";
$body_height="210px";
$table_margin_left="5px";
$table_margin_top="5px";
$table_width="700px";
$td_width="3.8cm";
$td_height="1.27cm";
$td_padding="0px 0px 0px 0px";
$img_width="3.8cm";
$img_height="1.27cm";
$img_padding="0px 0px 0px";
$img_float="left";
$perpage=110;
$perline=5;
 * */
$sizeid=Trim(stripslashes($_GET['sizeid']));
$code=Trim(stripslashes($_GET['code']));
$page_size=get_settings(7);
$page_size_margin=get_settings(8);
$body_width=get_settings(9);
$body_height=get_settings(10);
$table_margin_left=get_settings(11);
$table_margin_top=get_settings(12);
$table_width=get_settings(13);
$td_width=get_settings(14);
$td_height=get_settings(15);
$td_padding=get_settings(16);
$img_width=get_settings(17);
$img_height=get_settings(18);
$img_padding=get_settings(19);
$img_float=get_settings(20);
$perpage=get_settings(21);
$perline=get_settings(22);
$original_img_height=get_settings(23);
?>
<html>
    <head><meta http-equiv="Content-Type" content="text/html; charset=ibm866">

      
    </head>
<style>
@media print {
    .break {page-break-after: always;}
}
.center {
   margin: auto;
    width: 60%;
   // border: 1px solid #73AD21;
    padding: 3px;
width:145px;
hight:65px;
text-align:left;
}
.barcode{
    padding-top: 2px;
}
</style>
<body style="margin-left: 0px;">
                                                <?php
  $get_size_id_db=$_GET['sizeid'];                                              
 $result_colors= @mysqli_query($con,"SELECT * FROM colors where id in (".rtrim(get_clolors_of_item($_GET['code']), ",").")   order by id ASC");
                                        $num_colors=@mysqli_num_rows($result_colors);
                                        if($num_colors>0) {
                                             $count=0;
                                            while ($row_colors= mysqli_fetch_array($result_colors)) {
                                             $color_db=$row_colors['color'];
                                             $color_db_id=$row_colors['id'];
$color_name=get_color_name($color_db_id);   
$total=Get_total_items(''.$get_size_id_db.'',''.$color_db_id.'',$_GET['code']);  
  $code_wthedata=Get_model_barcode($_GET['code']).'-'.$get_size_id_db.'-'.$color_db_id;
                       if($total<=0){}else{
                         
    for ($index = 0; $index < $total; $index++) {
          if($count==$perline) //three images per row
            {
                        $count = 0;
            }
$barcode="".$_GET['code']."-".$get_size_id_db."-".$row_colors['id'].""; 
echo'<div class="barcode" style="width: 171px; background-color: aquamarine; font-size: 12px;">
<div style="width: 100%; float: right;">
<div style="float: left; width: 30%; text-align: left;white-space: nowrap;">'.get_color_name($row_colors['id']).' </div>
<div style="float: left; width: 35%; text-align:center;white-space: nowrap;"">S:'.Get_size_name($get_size_id_db).'</div>
<div style="float: left; text-align: right; width: 35%;white-space: nowrap;""> <span style="text-align:left;"></span></div>
</div>
<div style="width: 100%; float: right;">
<div style="float: left; width: 30%; text-align: left;white-space: nowrap;">'.Get_model_name($_GET['code']).'</div>
<div style="float: left; width: 35%; text-align:center;white-space: nowrap;"">P:'.get_price_of_item($_GET['code']).'</div>
<div style="float: left; text-align: right; width: 35%;white-space: nowrap;""> <span style="text-align:left;">'.Get_product_name(Get_model_groupid($_GET['code'])).'</span></div>
</div>
<div style="text-align:center;"><img  src="barcode_labels_a.php?codetype=code128&size=20&text='.$barcode.'">
</div>
</div>
<div class="break"></div>';         
          
 $count++;  

    }
                      
                       }
                 
                                            }
                                        }
                                        ?>

    </body>
</html>