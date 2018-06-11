            <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                
                <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <div id="page-title">
                    <h1 class="page-header text-overflow"><?php echo $title; ?>: S<?php echo $transaction->trans_id . ': ' . $transaction->datetime;?></h1>

                    <!--Searchbox-->
                    <!-- <div class="searchbox">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search..">
                            <span class="input-group-btn">
                                <button class="text-muted" type="button"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </div> -->
                </div>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End page title-->

                <!--Breadcrumb-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <ol class="breadcrumb">
                    <li><a href="<?php echo base_url('dashboard');?>">Dashboard</a></li>
                    <li><a href="<?php echo base_url('/transactions-page');?>">Transactions List</a></li>
                    <li class="active">S<?php echo $transaction->trans_id; ?></li>
                </ol>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End breadcrumb-->
                <!--Page content-->
                <!--===================================================-->
                <div id="page-content">
                    <!-- Basic Data Tables -->
                    <!--===================================================-->
                    <div class="panel" style="height: 1000px;">

                        <div class="panel-heading">

                            <div class="panel-body col-md-12">

                                <label class="control-label col-md-1">Status: <?php if ($transaction->status == 'ONGOING'){ $status = '<h4 style="color: green;">ONGOING</h4>'; }else if ($transaction->status == 'CANCELLED'){ $status = '<h4 style="color: brown;">CANCELLED</h4>'; }else{ $status = '<h4 style="color: gray;">CLEARED</h4>'; } echo $status; ?></h4></label>
                                <label class="control-label col-md-2">Order Type: <h4><?php echo $transaction->order_type; ?></h4></label>
                                <label class="control-label col-md-2">Discount Type: <h4><?php echo $transaction->disc_type; ?></h4></label>

                                <label class="control-label col-md-1" style="text-align: right;">Items: <h4><input type="text" value="" name="item_count" size="5" style="border: none; font-size: 16px; text-align: right;" readonly/></h4></label>

                                <?php

                                    $discount = $transaction->discount;

                                    $net_total = $gross_total - $discount;
                                ?>

                                <label class="control-label col-md-2" style="text-align: right;">Gross Total: <h4><?php echo number_format($gross_total, 2); ?></h4></label>
                                <label class="control-label col-md-2" style="text-align: right;">Discount: <h4>( <?php echo number_format($discount, 2); ?> )</h4></label>

                                <label class="control-label col-md-2" style="text-align: right;">Net Total: <h4 style="color: darkblue;"><?php echo number_format($net_total, 2); ?></h4></label>
                                

                            </div>
                        </div>

                        
                            
                            
                        

                        <input type="hidden" value=<?php echo "'" . $transaction->trans_id . "'"; ?> name="trans_id"/> 
                        
                        


                        
                        <div class="panel-body col-md-12" style="margin-top: -5%">

                            
                            <hr>

                            <table id="trans-details-table" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th style="width:60px;">ID</th>
                                        <th>Name</th>

                                        <th>Price</th>
                                        <th>Qty</th>
                                        <th>Total</th>

                                        <th style="width:60px;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>

                            <button class="btn btn-success" onclick=""><i class="fa fa-plus-square"></i> &nbsp;Set Payment</button>
                            
                            <button class="btn btn-default" onclick="reload_table()"><i class="fa fa-refresh"></i> &nbsp;Reload</button>

                            <button class="btn btn-warning" onclick=""><i class="fa fa-plus-square"></i> &nbsp;Set Discount</button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                            <button class="btn btn-danger" onclick=""><i class="fa fa-plus-square"></i> &nbsp;Cancel Transaction</button>
                            <hr>

                            <label class="control-label col-md-2">Payment Method: <h4><?php echo $transaction->method; ?></h4></label>
                            <label class="control-label col-md-3">Card Number: <h4><?php echo $transaction->card_number; ?></h4></label>

                            <label class="control-label col-md-3" style="text-align: right;">Amount Due: <h3 style="color: blue;">( ₱ <?php echo number_format($net_total, 2); ?> )</h3></label>
                            <label class="control-label col-md-2" style="text-align: right;">Cash Amount: <h3 style="color: green;">₱ <?php echo number_format($transaction->cash_amt, 2); ?></h3></label>
                            <label class="control-label col-md-2" style="text-align: right;">Change Amount: <h3 style="color: brown;">₱ <?php echo number_format($transaction->change_amt, 2); ?></h3></label>

                            <label class="control-label col-md-3">Customer Name: <h4><?php echo $transaction->cust_name; ?></h4></label>
                            <label class="control-label col-md-9">Table(s): <h4><?php echo $table_str; ?></h4></label>

                        </div>
                    </div>
                    <!--===================================================-->
                    <!-- End Striped Table -->
                    <span>Legend: [ &nbsp; <i style = "color: #ffcc66;" class="fa fa-square"></i> - Packages &nbsp; | &nbsp; <i style = "color: #ffffcc;" class="fa fa-square"></i> - Package-products &nbsp; ]</span>
                </div>
                <!--===================================================-->
                <!--End page content-->
            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->
