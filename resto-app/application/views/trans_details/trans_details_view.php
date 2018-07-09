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
                                <label class="control-label col-md-2">Discount Type: <h4><?php if ($transaction->disc_type == 0){ echo 'n/a'; }else{ echo $this->discounts->get_discount_name($transaction->disc_type); } ?></h4></label>

                                <label class="control-label col-md-1" style="text-align: right;">Items: <h4><input type="text" value="" name="item_count" size="4" style="border: none; text-align: center;" readonly/></h4></label>

                                <?php

                                    $discount = $transaction->discount;

                                    $net_total = $gross_total - $discount;
                                ?>

                                <label class="control-label col-md-2" style="text-align: right;">Gross Total: <h4><?php echo number_format($gross_total, 2); ?></h4></label>
                                <label class="control-label col-md-2" style="text-align: right;">Discount: <h4>( <?php echo number_format($discount, 2); ?> )</h4></label>

                                <label class="control-label col-md-2" style="text-align: right;">Net Total: <h4 style="color: darkblue;"><?php echo number_format($net_total, 2); ?></h4></label>
                                

                            </div>
                        </div>

                        
                        


                        
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
                            

                            <?php 
                                if ($transaction->status == 'ONGOING'){
                            ?>
                                <button class="btn btn-default col-md-1" onclick="reload_table()"><i class="fa fa-refresh"></i> &nbsp;REFRESH</button>

                                <button class="btn btn-success col-md-2" onclick="set_payment()"><i class="fa fa-plus-square"></i> &nbsp;SET PAYMENT</button>

                                <button class="btn btn-warning col-md-2" onclick="set_discount()"><i class="fa fa-minus-square"></i> &nbsp;SET DISCOUNT</button>

                                <button class="btn btn-primary col-md-2" onclick="print_bill_out(<?php echo $transaction->trans_id; ?>)"><i class="fa fa-print"></i> &nbsp;PRINT BILL-OUT</button>

                                <label class="control-label col-md-3"></label>

                                <button class="btn btn-danger col-md-2" onclick="set_cancel(<?php echo $transaction->trans_id; ?>)"><i class="fa fa-trash"></i> &nbsp;CANCEL TRANSACTION</button>
                                
                            <?php
                                }
                                else if ($transaction->status == 'CLEARED')
                                {
                            ?>
                                <button class="btn btn-default col-md-1" onclick="reload_table()"><i class="fa fa-refresh"></i> &nbsp;REFRESH</button>

                                <button class="btn btn-primary col-md-2" onclick="print_receipt(<?php echo $transaction->trans_id; ?>)"><i class="fa fa-print"></i> &nbsp;REPRINT RECEIPT</button>

                                
                                
                            <?php
                                }
                            ?>
                            <br>
                            <hr>

                            <label class="control-label col-md-2">Payment Method: <h4><?php echo $transaction->method; ?></h4></label>
                            <label class="control-label col-md-3">Card Number: <h4><?php echo $transaction->card_number; ?></h4></label>

                            <label class="control-label col-md-3" style="text-align: right;">Amount Due: <h3 style="color: blue;">( ₱ <?php echo number_format($net_total, 2); ?> )</h3></label>
                            <label class="control-label col-md-2" style="text-align: right;">Cash Amount: <h3 style="color: green;">₱ <?php echo number_format($transaction->cash_amt, 2); ?></h3></label>
                            <label class="control-label col-md-2" style="text-align: right;">Change Amount: <h3 style="color: brown;">₱ <?php echo number_format($transaction->change_amt, 2); ?></h3></label>

                            <label class="control-label col-md-2">Staff: <h4><?php echo $this->users->get_username($transaction->user_id); ?></h4></label>
                            <label class="control-label col-md-10">Customer Name: <h4><?php echo $transaction->cust_name; ?></h4></label>

                            <label class="control-label col-md-2">Cashier: <h4><?php if ($transaction->cashier_id == 0){ echo "n/a"; }else{ echo $this->users->get_username($transaction->cashier_id); } ?></h4></label>
                            <label class="control-label col-md-10">Discount ID#: <h4><?php echo $transaction->cust_disc_id; ?></h4></label>

                            <label class="control-label col-md-12">Table(s): <h4><?php echo $table_str; ?></h4></label>
                            

                        </div>
                    </div>
                    <!--===================================================-->
                    <!-- End Striped Table -->
                    <span>Legend: [ &nbsp; <i style = "color: #ffffff;" class="fa fa-square"></i> - Regular Products &nbsp; | &nbsp; <i style = "color: #ffcc66;" class="fa fa-square"></i> - Packages &nbsp; | &nbsp; <i style = "color: #ffffcc;" class="fa fa-square"></i> - Package-products &nbsp; ]</span>
                </div>
                <!--===================================================-->
                <!--End page content-->
            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->


            <!-- Bootstrap modal -->
            <div class="modal fade" id="modal_form_set_payment" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h3 class="modal-title">Set Payment Form</h3>
                        </div>
                        <div class="modal-body form">
                            <form action="#" id="form_set_payment" class="form-horizontal">

                                <input type="hidden" value=<?php echo "'" . $transaction->trans_id . "'"; ?> name="trans_id"/> 
                                <input type="hidden" value=<?php echo "'" . $net_total . "'"; ?> name="amount_due"/>

                                <input type="hidden" value=<?php echo "'" . $managers_password . "'"; ?> name="managers_password"/>
                                
                                <div class="form-body">

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Amount Due :</label>
                                        <div class="col-md-9">
                                            <h3><input type="text" value=<?php echo "'" . "₱ " . number_format($net_total, 2) . "'"; ?> name="amount_due_str" size="15" style="border: none; text-align: right; color: darkblue;" readonly/></h3>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Payment Method :</label>
                                        <div class="col-md-9">
                                            <select id="method" name="method" class="form-control" style="font-size: 15px;" >
                                                <option value="Cash">Cash</option>
                                                <option value="Credit Card">Credit Card</option>
                                                <option value="Cash Card">Cash Card</option>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Cash :</label>
                                        <div class="col-md-9">
                                            <input id="cash_amt" name="cash_amt" placeholder="Cash Amount" class="form-control" type="number" style="font-size: 15px;" >
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Card Number :</label>
                                        <div class="col-md-9">
                                            <input id="card_number" name="card_number" placeholder="Card Number" class="form-control" type="text" style="font-size: 15px;" disabled>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Customer Name (Optional) :</label>
                                        <div class="col-md-9">
                                            <input id="cust_name" name="cust_name" placeholder="Customer Full Name" class="form-control" value=<?php echo "'" . $transaction->cust_name . "'"; ?> type="text" style="font-size: 15px;" disabled>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnSave" onclick="confirm_trans()" class="btn btn-primary"><i class="fa fa-floppy-o"></i> &nbsp;Confirm</button>

                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> &nbsp;Cancel</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!-- End Bootstrap modal -->

            <!-- Bootstrap modal -->
            <div class="modal fade" id="modal_form_set_discount" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h3 class="modal-title">Set Discount Form</h3>
                        </div>
                        <div class="modal-body form">
                            <form action="#" id="form_set_discount" class="form-horizontal">

                                <input type="hidden" value=<?php echo "'" . $transaction->trans_id . "'"; ?> name="trans_id"/>
                                <input type="hidden" value=<?php echo "'" . $gross_total . "'"; ?> name="gross_total"/>
                                
                                <div class="form-body">

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Gross Total :</label>
                                        <div class="col-md-9">
                                            <h3><input type="text" value=<?php echo "'" . "₱ " . number_format($gross_total, 2) . "'"; ?> name="gross_total_str" size="15" style="border: none; text-align: right; color: darkblue;" readonly/></h3>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Discount Type :</label>
                                        <div class="col-md-9">
                                            <select id="disc_type_trans_details" name="disc_type" class="form-control" style="font-size: 15px;" >
                                                <option value="">-- Select Discount Type --</option>
                                                <?php 
                                                    foreach($discounts as $row)
                                                    { 
                                                      echo '<option value="'.$row->disc_id.'">'.$row->name.'</option>';
                                                    }
                                                ?>
                                            </select>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Calculated Discount :</label>
                                        <div class="col-md-9">
                                            <input name="calc_disc" placeholder="Calculated Discount Amount" class="form-control" type="text" style="font-size: 15px;" readonly>
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Actual Discount :</label>
                                        <div class="col-md-9">
                                            <input name="discount" placeholder="Actual Discount Amount" class="form-control" type="number" style="font-size: 15px;" >
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">ID Number :</label>
                                        <div class="col-md-9">
                                            <input name="cust_disc_id" placeholder="Customer Discount ID Number" class="form-control" type="text" style="font-size: 15px;">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3">Customer Name (Optional) :</label>
                                        <div class="col-md-9">
                                            <input name="cust_name" placeholder="Customer Full Name" class="form-control" value=<?php echo "'" . $transaction->cust_name . "'"; ?> type="text" style="font-size: 15px;">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btnSave" onclick="confirm_trans()" class="btn btn-primary"><i class="fa fa-floppy-o"></i> &nbsp;Confirm</button>

                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> &nbsp;Cancel</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!-- End Bootstrap modal -->

