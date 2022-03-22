<?php
if($user_SalesReports!=="1" and $user_IsAdmin!=1){
    echo '<div class="alert alert-warning text-right" style="margin-top:150px;">
                  '.$not_have_permission_lang.'
                            </div>';
}else{ ?>
    <table border="1" style="font-size:16px; width:100%; direction:rtl; border:1px; border-collapse:collapse;  text-align:center;">
        <thead>
        <td colspan="7" style="background-color:#09F;"><strong style="color:#FFF; font-size:22px;"> <?php echo"$sales_lang"; ?></strong></td>
        </thead>
        <thead style="background-color:#CCC;">

        <th  class="text-center"><?php echo"$custommer_name"; ?> </a></th>

        <th  class="text-center"><?php echo"$custommer_phone"; ?> </a></th>



        </thead>
        <?php
        if($orderby==null){$orderby="id";}
        if($type==null){$type="DESC";}
        ###########################################
        $from=str_replace("/", "-", $_GET['from']);
        $to=str_replace("/", "-", $_GET['to']);
        $from=stripslashes(date('Y-m-d',strtotime($from)));
        $to=stripslashes(date('Y-m-d',strtotime($to)));
        $tbl_name="".$prefix."_sales_inv";		//your table name
        // How many adjacent pages should be shown on each side?
        $adjacents = 3;

        /*
           First get total number of rows in data table.
           If you have a WHERE clause in your query, make sure you mirror it here.
        */
        $query = "SELECT COUNT(*) as num  FROM  ".$prefix."_sales_inv where type in('1','2') and  left(date, 10) BETWEEN '".$from."' AND '".$to."' GROUP BY customer_phone";
        $total_pages = mysqli_num_rows(mysqli_query($con,$query));

        $total_pages = $total_pages[num];

        /* Setup vars for query. */
        $targetpage = "?reports=".$_GET['reports']."&from=".$_GET['from']."&to=".$_GET['to']."&limit=".$_GET['limit']."&orderby=".$_GET['orderby']."&type=".$_GET['type'].""; 	//your file name  (the name of this file)
        //how many items to show per page
        if(!empty($_GET['limit'])){
            $_SESSION[limit]=$_GET['limit'];
        }else{}
        if(!empty($_SESSION[limit])){
            $limit = $_SESSION[limit];
            if($limit>100){$limit=$items_per_page+20;}
        }else{
            $limit = $items_per_page+20;
        }
        $page = $_GET['page'];
        if($page)
            $start = ($page - 1) * $limit; 			//first item to display on this page
        else
            $start = 0;								//if no page var is given, set start to 0
        $sql = "SELECT * FROM ".$prefix."_sales_inv where customer_phone <> '' AND customer_phone IS NOT null AND type in('1','2') and left(date,10) BETWEEN '".$from."' AND '".$to."' GROUP BY customer_phone order by $orderby $type LIMIT $start, $limit";
        $result = @mysqli_query($con,$sql);
        /* Setup page vars for display. */
        if ($page == 0) $page = 1;					//if no page var is given, default to 1.
        $prev = $page - 1;							//previous page is page - 1
        $next = $page + 1;							//next page is page + 1
        $lastpage = ceil($total_pages/$limit);		//lastpage is = total pages / items per page, rounded up.
        $lpm1 = $lastpage - 1;						//last page minus 1

        /*
            Now we apply our rules and draw the pagination object.
            We're actually saving the code to a variable in case we want to draw it more than once.
        */
        $pagination = "";
        if($lastpage > 1)
        {
            $pagination .= "<div class=\"pagination\">";
            //previous button
            if ($page > 1)
                $pagination.= "<a href=\"$targetpage&page=$prev\">>></a>";
            else
                $pagination.= "<span class=\"disabled\">>></span>";

            //pages
            if ($lastpage < 7 + ($adjacents * 2))	//not enough pages to bother breaking it up
            {
                for ($counter = 1; $counter <= $lastpage; $counter++)
                {
                    if ($counter == $page)
                        $pagination.= "<span class=\"current\">$counter</span>";
                    else
                        $pagination.= "<a href=\"$targetpage&page=$counter\">$counter</a>";
                }
            }
            elseif($lastpage > 5 + ($adjacents * 2))	//enough pages to hide some
            {
                //close to beginning; only hide later pages
                if($page < 1 + ($adjacents * 2))
                {
                    for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++)
                    {
                        if ($counter == $page)
                            $pagination.= "<span class=\"current\">$counter</span>";
                        else
                            $pagination.= "<a href=\"$targetpage&page=$counter\">$counter</a>";
                    }
                    $pagination.= "...";
                    $pagination.= "<a href=\"$targetpage&page=$lpm1\">$lpm1</a>";
                    $pagination.= "<a href=\"$targetpage&page=$lastpage\">$lastpage</a>";
                }
                //in middle; hide some front and some back
                elseif($lastpage - ($adjacents * 2) > $page && $page > ($adjacents * 2))
                {
                    $pagination.= "<a href=\"$targetpage&page=1\">1</a>";
                    $pagination.= "<a href=\"$targetpage&page=2\">2</a>";
                    $pagination.= "...";
                    for ($counter = $page - $adjacents; $counter <= $page + $adjacents; $counter++)
                    {
                        if ($counter == $page)
                            $pagination.= "<span class=\"current\">$counter</span>";
                        else
                            $pagination.= "<a href=\"$targetpage&page=$counter\">$counter</a>";
                    }
                    $pagination.= "...";
                    $pagination.= "<a href=\"$targetpage&page=$lpm1\">$lpm1</a>";
                    $pagination.= "<a href=\"$targetpage&page=$lastpage\">$lastpage</a>";
                }
                //close to end; only hide early pages
                else
                {
                    $pagination.= "<a href=\"$targetpage&page=1\">1</a>";
                    $pagination.= "<a href=\"$targetpage&page=2\">2</a>";
                    $pagination.= "...";
                    for ($counter = $lastpage - (2 + ($adjacents * 2)); $counter <= $lastpage; $counter++)
                    {
                        if ($counter == $page)
                            $pagination.= "<span class=\"current\">$counter</span>";
                        else
                            $pagination.= "<a href=\"$targetpage&page=$counter\">$counter</a>";
                    }
                }
            }

            //next button
            if ($page < $counter - 1)
                $pagination.= "<a href=\"$targetpage&page=$next\"><<</a>";
            else
                $pagination.= "<span class=\"disabled\"><<</span>";
            $pagination.= "</div>\n";
        }
        ###############
        $i=0;

        while($row = @mysqli_fetch_array($result))
        {

            $issingle=$i/2;
            $dot = strstr($issingle, '.');
            if($dot==""){
                $class="background_color_FFF";
            }else{$class='background_color_D5EFF0';}
            if($row['supplier']==""){$supplier_name="";}else{
                $result_suppliers = mysqli_query($con,"SELECT id,name FROM ".$prefix."_clients WHERE id=".$row['supplier']."");
                if(@mysqli_num_rows($result_suppliers)>0){
                    while($row_suppliers = mysqli_fetch_array($result_suppliers))
                    {
                        $supplier_name=$row_suppliers['name'];
                    }
                }
            }
            if($row['PaymentMethod']==1){$PaymentMethod="$cash_lang";}
            else if($row['PaymentMethod']==2){$PaymentMethod="$On_credit_lang";}
            else if($row['PaymentMethod']==3){$PaymentMethod="$check_lang";}
            else{}
#############################
            ?>


            <tr class="<?php echo"".$class.""; ?>">
                <td><?php echo"".$row['customer_name'].""; ?></td>
                <td><?php echo"".$row['customer_phone'].""; ?></td>
            </tr>

            <?php $i++; } ?>

        <tr>
            <td class="text-center" colspan="7"><?php echo"$pagination"; ?></td>
        </tr>
    </table>
<?php } ?>