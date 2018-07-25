
            <!--MAIN NAVIGATION-->
            <!--===================================================-->
            <nav id="mainnav-container">
                <div id="mainnav">

                    <!--Shortcut buttons-->
                    <!--================================-->
                    <div id="mainnav-shortcut">
                        <ul class="list-unstyled">
                            <li class="col-xs-4" data-content="Additional Sidebar">
                                <a id="demo-toggle-aside" class="shortcut-grid" href="#">
                                    <i class="fa fa-magic"></i>
                                </a>
                            </li>
                            <li class="col-xs-4" data-content="Notification">
                                <a id="demo-alert" class="shortcut-grid" href="#">
                                    <i class="fa fa-bullhorn"></i>
                                </a>
                            </li>
                            <li class="col-xs-4" data-content="Page Alerts">
                                <a id="demo-page-alert" class="shortcut-grid" href="#">
                                    <i class="fa fa-bell"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!--================================-->
                    <!--End shortcut buttons-->

                    <!--Menu-->
                    <!--================================-->
                    <div id="mainnav-menu-wrap">
                        <div class="nano">
                            <div class="nano-content">
                                <ul id="mainnav-menu" class="list-group">
                        
                                    <!--Category name-->
                                    <li class="list-header">Navigation</li>
                        
                                    <!--Menu list item-->
                                    <?php if($this->uri->segment(1) == 'dashboard'){ ?>

                                    <li class="active-link">
                                        <a href="<?php echo base_url('dashboard');?>">
                                            <i class="fa fa-dashboard"></i>
                                            <span class="menu-title">
                                                <strong>Dashboard</strong>
                                                <span class="label label-success pull-right">Top</span>
                                            </span>
                                        </a>
                                    </li>

                                    <?php }else{ ?>

                                    <li>
                                        <a href="<?php echo base_url('dashboard');?>">
                                            <i class="fa fa-dashboard"></i>
                                            <span class="menu-title">
                                                Dashboard
                                                <span class="label label-success pull-right">Top</span>
                                            </span>
                                        </a>
                                    </li>

                                    <?php } ?>

                                    <?php if($this->session->userdata('administrator') == '1'): ?>
                                    <!--Menu list item-->
                                        <?php if($this->uri->segment(1) == 'statistics-page'){ ?>

                                            <li class="active-link">
                                                <a href="<?php echo base_url('statistics-page');?>">
                                                    <i class="fa fa-bar-chart"></i>
                                                    <span class="menu-title">
                                                        <strong>Statistics / Charts</strong>
                                                    </span>
                                                </a>
                                            </li>

                                        <?php }else{ ?>

                                            <li>
                                                <a href="<?php echo base_url('statistics-page');?>">
                                                    <i class="fa fa-bar-chart"></i>
                                                    <span class="menu-title">
                                                        Statistics / Charts
                                                    </span>
                                                </a>
                                            </li>

                                        <?php } ?>

                                    <?php endif ?>
                        
                                    <li class="list-divider"></li>
                        
                                    <!--Category name-->
                                    
                                    <li class="list-header">Operations</li>
                                    
                                    <!--Menu list item-->
                        
<!-- ================================================== RESTO APP CODES ================================================== -->
                                    

                                    <!--Menu list item-->
                                    
                                    <?php if($this->session->userdata('administrator') == '1'): ?>

                                        <?php if($this->uri->segment(1) == 'items-page'){ ?>

                                            <li class="active-link">
                                                <a href="<?php echo base_url();?>items-page">
                                                    <i class="fa fa-archive"></i>
                                                    <strong><span class="menu-title">Items</span></strong>
                                                    <span class="label label-danger pull-right">Admin</span>
                                                </a>
                                            </li>

                                        <?php }else{ ?>

                                            <li>
                                                <a href="<?php echo base_url();?>items-page">
                                                    <i class="fa fa-archive"></i>
                                                    <span class="menu-title">Items</span>
                                                    <span class="label label-danger pull-right">Admin</span>
                                                </a>
                                            </li>

                                        <?php } ?>

                                    <?php endif ?>

                                    <!--Menu list item-->


                                    <!--Menu list item-->
                                    
                                    <?php if($this->session->userdata('administrator') == '1'): ?>

                                        <?php if($this->uri->segment(1) == 'products-page' || $this->uri->segment(1) == 'packages-page'){ ?>

                                            <li class="active-link">
                                                <a href="#">
                                                    <i class="fa fa-cutlery"></i>
                                                    <strong><span class="menu-title">Menu</span></strong>
                                                    <i class="arrow"></i>
                                                </a>

                                                <!--Submenu-->
                                                <ul class="collapse">
                                                    <li><a href="<?php echo base_url();?>products-page">Products</a>
                                                    </li>                                            
                                                    <li><a href="<?php echo base_url();?>packages-page">Packages</a>
                                                    </li>
                                                </ul>
                                            </li>

                                        <?php }else{ ?>

                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-cutlery"></i>
                                                    <span class="menu-title">Menu</span>
                                                    <i class="arrow"></i>
                                                </a>

                                                <!--Submenu-->
                                                <ul class="collapse">
                                                    <li><a href="<?php echo base_url();?>products-page">Products</a>
                                                    </li>                                            
                                                    <li><a href="<?php echo base_url();?>packages-page">Packages</a>
                                                    </li>
                                                </ul>
                                            </li>

                                        <?php } ?>

                                    <?php endif ?>

                                    <!--Menu list item-->  


                                    <!--Menu list item-->
                                    
                                    <?php if($this->session->userdata('administrator') == '1'): ?>

                                        <?php if($this->uri->segment(1) == 'categories-page'){ ?>

                                            <li class="active-link">
                                                <a href="<?php echo base_url();?>categories-page">
                                                    <i class="fa fa-braille"></i>
                                                    <strong><span class="menu-title">Categories</span></strong>
                                                    
                                                </a>
                                            </li>

                                        <?php }else{ ?>

                                            <li>
                                                <a href="<?php echo base_url();?>categories-page">
                                                    <i class="fa fa-braille"></i>
                                                    <span class="menu-title">Categories</span>
                                                    
                                                </a>
                                            </li>

                                        <?php } ?>

                                    <?php endif ?>

                                    <!--Menu list item-->       


                                    <!--Menu list item-->
                                    
                                    <?php if($this->session->userdata('administrator') == '1' || $this->session->userdata('cashier') == '1'): ?>

                                        <?php if($this->uri->segment(1) == 'tables-page'){ ?>

                                            <li class="active-link">
                                                <a href="<?php echo base_url();?>tables-page">
                                                    <i class="fa fa-table"></i>
                                                    <strong><span class="menu-title">Tables</span></strong>
                                                    
                                                </a>
                                            </li>

                                        <?php }else{ ?>

                                            <li>
                                                <a href="<?php echo base_url();?>tables-page">
                                                    <i class="fa fa-table"></i>
                                                    <span class="menu-title">Tables</span>
                                                    
                                                </a>
                                            </li>

                                        <?php } ?>

                                    <?php endif ?>

                                    <!--Menu list item-->


                                    <!--Menu list item-->

                                    <?php if($this->session->userdata('administrator') == '1'): ?>

                                        <?php if($this->uri->segment(1) == 'discounts-page' || $this->uri->segment(1) == 'prod-discounts-page' || $this->uri->segment(1) == 'pack-discounts-page'){ ?>

                                            <li class="active-link">
                                                <a href="#">
                                                    <i class="fa fa-tags"></i>
                                                    <strong><span class="menu-title">Discounts</span></strong>
                                                    <span class="label label-danger pull-right">Admin</span>
                                                </a>

                                                <!--Submenu-->
                                                <ul class="collapse">
                                                    <li><a href="<?php echo base_url();?>discounts-page">Trans. Discounts</a>
                                                    </li>                                            
                                                    <li><a href="<?php echo base_url();?>prod-discounts-page">Product Discounts</a>
                                                    </li>
                                                    <li><a href="<?php echo base_url();?>pack-discounts-page">Package Discounts</a>
                                                    </li>
                                                </ul>
                                            </li>

                                        <?php }else{ ?>

                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-tags"></i>
                                                    <span class="menu-title">Discounts</span>
                                                    <span class="label label-danger pull-right">Admin</span>
                                                </a>

                                                <!--Submenu-->
                                                <ul class="collapse">
                                                    <li><a href="<?php echo base_url();?>discounts-page">Trans. Discounts</a>
                                                    </li>                                            
                                                    <li><a href="<?php echo base_url();?>prod-discounts-page">Product Discounts</a>
                                                    </li>
                                                    <li><a href="<?php echo base_url();?>pack-discounts-page">Package Discounts</a>
                                                    </li>
                                                </ul>
                                            </li>

                                        <?php } ?>

                                    <?php endif ?>

                                    <!--Menu list item-->    


                                    <!--Menu list item-->
                                    
                                    <?php if($this->session->userdata('administrator') == '1' || $this->session->userdata('cashier') == '1'): ?>

                                        <?php if($this->uri->segment(1) == 'transactions-page' || $this->uri->segment(1) == 'transactions-page-cleared' || $this->uri->segment(1) == 'transactions-page-cancelled'){ ?>

                                            <li class="active-link">
                                                <a href="#">
                                                    <i class="fa fa-qrcode"></i>
                                                    <strong><span class="menu-title">Transactions</span></strong>
                                                    <i class="arrow"></i>
                                                </a>

                                                <!--Submenu-->
                                                <ul class="collapse">
                                                    <li><a href="<?php echo base_url();?>transactions-page">Ongoing</a>
                                                    </li>                                            
                                                    <li><a href="<?php echo base_url();?>transactions-page-cleared">Cleared</a>
                                                    </li>
                                                    <li><a href="<?php echo base_url();?>transactions-page-cancelled">Cancelled</a>
                                                    </li>
                                                </ul>
                                            </li>

                                        <?php }else{ ?>

                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-qrcode"></i>
                                                    <span class="menu-title">Transactions</span>
                                                    <i class="arrow"></i>
                                                </a>

                                                <!--Submenu-->
                                                <ul class="collapse">
                                                    <li><a href="<?php echo base_url();?>transactions-page">Ongoing</a>
                                                    </li>                                            
                                                    <li><a href="<?php echo base_url();?>transactions-page-cleared">Cleared</a>
                                                    </li>
                                                    <li><a href="<?php echo base_url();?>transactions-page-cancelled">Cancelled</a>
                                                    </li>
                                                </ul>
                                            </li>

                                        <?php } ?>

                                    <?php endif ?>

                                    <!--Menu list item-->                 



<!-- ================================================== MISCELLANEOUS ================================================ -->
    

                        
                                    
                                    <li class="list-divider"></li>
                        
                                    <!--Category name-->
                                    <li class="list-header">Miscellaneous</li>
                        
                                    
                                    <!--Menu list item-->
                        
                                    <!--Menu list item-->
                                    <?php if($this->session->userdata('administrator') == "1"): ?>

                                        <?php if($this->uri->segment(1) == 'users-page'){ ?>

                                            <li class="active-link">
                                                <a href="<?php echo base_url();?>users-page">
                                                    <i class="fa fa-user-circle"></i>
                                                    <strong><span class="menu-title">Users</span></strong>
                                                    <span class="label label-danger pull-right">Admin</span>
                                                    
                                                </a>
                                            </li>

                                        <?php }else{ ?>

                                            <li>
                                                <a href="<?php echo base_url();?>users-page">
                                                    <i class="fa fa-user-circle"></i>
                                                    <span class="menu-title">Users</span>
                                                    <span class="label label-danger pull-right">Admin</span>
                                                    
                                                </a>
                                            </li>

                                        <?php } ?>

                                    <?php endif ?>



                                    <!--Menu list item-->

                                    <?php if($this->uri->segment(1) == 'logs-page'){ ?>

                                        <li class="active-link">
                                            <a href="<?php echo base_url();?>logs-page">
                                                <i class="fa fa-history"></i>
                                                <strong><span class="menu-title">System Logs</span></strong>
                                            </a>
                                        </li>

                                    <?php }else{ ?>

                                        <li>
                                            <a href="<?php echo base_url();?>logs-page">
                                                <i class="fa fa-history"></i>
                                                <span class="menu-title">System Logs</span>
                                            </a>
                                        </li>

                                    <?php } ?>


                                    <!--Menu list item-->
                                    
                                    <?php if($this->session->userdata('administrator') == '1'): ?>

                                        <?php if($this->uri->segment(1) == 'reports-page'){ ?>

                                            <li class="active-link">
                                                <a href="<?php echo base_url();?>reports-page">
                                                    <i class="fa fa-file"></i>
                                                    <strong><span class="menu-title">Reports</span></strong>
                                                    <span class="label label-danger pull-right">Admin</span>
                                                </a>
                                            </li>

                                        <?php }else{ ?>

                                            <li>
                                                <a href="<?php echo base_url();?>reports-page">
                                                    <i class="fa fa-file"></i>
                                                    <span class="menu-title">Reports</span>
                                                    <span class="label label-danger pull-right">Admin</span>
                                                </a>
                                            </li>

                                        <?php } ?>

                                    <?php endif ?>



                                    <!--Menu list item-->

                                    <?php if($this->session->userdata('administrator') == '1'): ?>

                                        <?php if($this->uri->segment(1) == 'store-config-page'){ ?>

                                            <li class="active-link">
                                                <a href="<?php echo base_url();?>store-config-page">
                                                    <i class="fa fa-cogs"></i>
                                                    <strong><span class="menu-title">Store Config</span></strong>
                                                    <span class="label label-danger pull-right">Admin</span>
                                                </a>
                                            </li>

                                        <?php }else{ ?>

                                            <li>
                                                <a href="<?php echo base_url();?>store-config-page">
                                                    <i class="fa fa-cogs"></i>
                                                    <span class="menu-title">Store Config</span>
                                                    <span class="label label-danger pull-right">Admin</span>
                                                </a>
                                            </li>

                                        <?php } ?>

                                    <?php endif ?>
                                    

                                    <!--Menu list item-->
                                    

                                    <?php if($this->uri->segment(1) == 'notifications-page'){ ?>

                                        <li class="active-link">
                                            <a href="#">
                                                <i class="fa fa-bell"></i>
                                                <strong><span class="menu-title">Notifications</span></strong>
                                                <i class="arrow"></i>
                                            </a>
                                        
                                            <!--Submenu-->
                                            <ul class="collapse">
                                                <li><a href="<?php echo base_url();?>notifications-page/notifications-monthly-page">No Monthly Checkup</a>
                                                </li>                                            
                                                <li><a href="<?php echo base_url();?>notifications-page/notifications-quarterly-page">No HVI (Quarterly)</a>
                                                </li>
                                                <li><a href="<?php echo base_url();?>notifications-page/notifications-deworming-page">No Deworming</a>
                                                </li>
                                                <li><a href="<?php echo base_url();?>notifications-page/notifications-severe-page">Severe Malnutrition</a>
                                                </li>
                                            </ul>
                                        </li>

                                    <?php }else{ ?>

                                        <li>
                                            <a href="#">
                                                <i class="fa fa-bell"></i>
                                                <span class="menu-title">Notifications</span>
                                                <i class="arrow"></i>
                                            </a>
                                        
                                            <!--Submenu-->
                                            <ul class="collapse">
                                                <li><a href="<?php echo base_url();?>notifications-page/notifications-monthly-page">No Monthly Checkup</a>
                                                </li>                                            
                                                <li><a href="<?php echo base_url();?>notifications-page/notifications-quarterly-page">No HVI (Quarterly)</a>
                                                </li>
                                                <li><a href="<?php echo base_url();?>notifications-page/notifications-deworming-page">No Deworming</a>
                                                </li>
                                                <li><a href="<?php echo base_url();?>notifications-page/notifications-severe-page">Severe Malnutrition</a>
                                                </li>
                                            </ul>
                                        </li>

                                    <?php } ?>


                                    


                                </ul>

                            </div>
                        </div>
                    </div>
                    <!--================================-->
                    <!--End menu-->

                </div>
            </nav>
            <!--===================================================-->
            <!--END MAIN NAVIGATION-->

        </div>
