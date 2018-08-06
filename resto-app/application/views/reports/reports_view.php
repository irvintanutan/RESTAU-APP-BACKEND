            <!--CONTENT CONTAINER-->
            <!--===================================================-->
            <div id="content-container">
                
                <!--Page Title-->
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <div id="page-title">
                    <h1 class="page-header text-overflow"><?php echo $title; ?></h1>

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
                    <li class="active">Generate Reports</li>
                </ol>
                <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
                <!--End breadcrumb-->
                <!--Page content-->
                <!--===================================================-->
                <div class="col-md-12">
                    <!-- Basic Data Tables -->
                    <!--===================================================-->
                    <div class="col-md-6">
                        <div id="page-content" class="panel panel-light panel-colorful col-md-12">
                            <!--===================================================-->
                            <div class="panel-heading">
                                <h3 class="panel-title">Transactions Reports Selection</h3>
                            </div>

                            <div class="panel-body">
                                <form action="#" id="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Select Report Type :</label>
                                        <div class="col-md-9">
                                            <select name="report_type" id="report_type" class="form-control" style="font-size: 15px;">
                                                <option value="null">--Select Type--</option>
                                                <option value="trans-cleared">Cleared Transactions</option>
                                                <option value="trans-cancelled">Cancelled Transactions</option>
                                                <option value="trans-refunded">Refunded Transactions</option>
                                                <option value="trans-all-status">All Status Transactions</option>
                                            </select>
                                        </div>
                                        <br><br><br>
                                        <div class="col-md-12">
                                            <label class="control-label col-md-3">Date From :</label>
                                            <input name="date_from_trans" id="date_range_trans" class="col-md-3"type="date">
                                            <label class="control-label col-md-3">Date To :</label>
                                            <input name="date_to_trans" id="date_range_trans" class="col-md-3" type="date">
                                        </div>
                                        <div class="col-md-12">
                                            <label class="control-label col-md-3">Date From :</label>
                                            <input name="date_from_trans" id="date_range_trans" class="col-md-3"type="date">
                                            <label class="control-label col-md-3">Date To :</label>
                                            <input name="date_to_trans" id="date_range_trans" class="col-md-3" type="date">
                                        </div>
                                        <br><br><hr>
                                        <div class="col-md-8"></div>
                                        <button type="button" id="generate_report" onclick="set_report()" class="btn btn-dark col-md-4" style="font-size: 15px;" disabled><i class="fa fa-file"></i> &nbsp;Generate Report</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <div id="page-content" class="panel panel-light panel-colorful">
                            <!--===================================================-->
                            <div class="panel-heading">
                                <h3 class="panel-title">Menu Item Reports Selection</h3>
                            </div>

                            <div class="panel-body">
                                <form action="#" id="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Select Report Type :</label>
                                        <div class="col-md-9">
                                            <select name="report_type" id="report_type" class="form-control" style="font-size: 15px;">
                                                <option value="null">--Select Type--</option>
                                                <option value="menu-products">Menu Products</option>
                                                <option value="menu-packages">Menu Packages</option>
                                                <option value="menu-top-selling">Top Selling</option>
                                                <option value="menu-all">All Menu Items</option>
                                            </select>
                                        </div>
                                        <br><br><br>
                                        <div class="col-md-12">
                                            <label class="control-label col-md-3">Date From :</label>
                                            <input name="date_from_trans" id="date_range_trans" class="col-md-3"type="date">
                                            <label class="control-label col-md-3">Date To :</label>
                                            <input name="date_to_trans" id="date_range_trans" class="col-md-3" type="date">
                                        </div>
                                        <br><br><hr>
                                        <div class="col-md-8"></div>
                                        <button type="button" id="generate_report" onclick="set_report()" class="btn btn-dark col-md-4" style="font-size: 15px;" disabled><i class="fa fa-file"></i> &nbsp;Generate Report</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
                <!--===================================================-->
                <!--End page content-->
            </div>
            <!--===================================================-->
            <!--END CONTENT CONTAINER-->

