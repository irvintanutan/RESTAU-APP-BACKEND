<?php
defined('BASEPATH') OR exit('No direct script access allowed');


$route['default_controller'] = 'login_controller/index';
$route['404_override'] = '';
$route['error500'] = 'error_controller';
$route['translate_uri_dashes'] = TRUE;


// $route['log-user'] = 'login_controller/login_validation';


$route['dashboard'] = 'dashboard_controller/index';
$route['user-logout'] = 'login_controller/logout';



//************************************ ITEMS ROUTES ****************************************************************
//******************************************************************************************************************

$route['items-page'] = 'Items/Items_controller';

$route['showlist-items'] = 'Items/Items_controller/ajax_list';

$route['add-item'] = 'Items/Items_controller/ajax_add';

$route['edit-item/(:num)'] = 'Items/Items_controller/ajax_edit/$1';

$route['update-item'] = 'Items/Items_controller/ajax_update';

$route['delete-item/(:num)'] = 'Items/Items_controller/ajax_delete/$1';

//======================================== API SECTION =================================================================

$route['showlist-items-api'] = 'Items/Items_controller/ajax_api_list';


//************************************ PRODUCTS ROUTES ****************************************************************
//******************************************************************************************************************

$route['products-page'] = 'Products/Products_controller';

$route['showlist-products'] = 'Products/Products_controller/ajax_list';

$route['add-product'] = 'Products/Products_controller/ajax_add';

$route['edit-product/(:num)'] = 'Products/Products_controller/ajax_edit/$1';

$route['update-product'] = 'Products/Products_controller/ajax_update';

$route['delete-product/(:num)'] = 'Products/Products_controller/ajax_delete/$1';

//======================================== API SECTION =================================================================

$route['showlist-products-api'] = 'Products/Products_controller/ajax_api_list';


//************************************ PACKAGES ROUTES ****************************************************************
//******************************************************************************************************************

$route['packages-page'] = 'Packages/Packages_controller';

$route['showlist-packages'] = 'Packages/Packages_controller/ajax_list';

$route['add-package'] = 'Packages/Packages_controller/ajax_add';

$route['edit-package/(:num)'] = 'Packages/Packages_controller/ajax_edit/$1';

$route['update-package'] = 'Packages/Packages_controller/ajax_update';

$route['delete-package/(:num)'] = 'Packages/Packages_controller/ajax_delete/$1';

//======================================== API SECTION =================================================================

$route['showlist-packages-api'] = 'Packages/Packages_controller/ajax_api_list';


//************************************ CATEGORIES ROUTES ***************************************************************
//******************************************************************************************************************

$route['categories-page'] = 'Categories/Categories_controller';

$route['showlist-categories'] = 'Categories/Categories_controller/ajax_list';

$route['add-category'] = 'Categories/Categories_controller/ajax_add';

$route['edit-category/(:num)'] = 'Categories/Categories_controller/ajax_edit/$1';

$route['update-category'] = 'Categories/Categories_controller/ajax_update';

$route['delete-category/(:num)'] = 'Categories/Categories_controller/ajax_delete/$1';

//======================================== API SECTION =================================================================

$route['showlist-categories-api'] = 'Categories/Categories_controller/ajax_api_list';


//************************************ PROD DETAIL ROUTES **************************************************************
//******************************************************************************************************************

$route['prod-details-page/(:num)'] = 'Prod_details/Prod_details_controller/index/$1';

$route['showlist-prod-details/(:num)'] = 'Prod_details/Prod_details_controller/ajax_list/$1';

$route['add-prod-detail'] = 'Prod_details/Prod_details_controller/ajax_add';

$route['edit-prod-detail/(:num)/(:num)'] = 'Prod_details/Prod_details_controller/ajax_edit/$1/$2';

$route['update-prod-detail'] = 'Prod_details/Prod_details_controller/ajax_update';

$route['delete-prod-detail/(:num)/(:num)'] = 'Prod_details/Prod_details_controller/ajax_delete/$1/$2';

//======================================== API SECTION =================================================================

$route['showlist-prod-details-api/(:num)'] = 'Prod_details/Prod_details_controller/ajax_api_list/$1';


//************************************ PACK DETAIL ROUTES **************************************************************
//******************************************************************************************************************

$route['pack-details-page/(:num)'] = 'Pack_details/Pack_details_controller/index/$1';

$route['showlist-pack-details/(:num)'] = 'Pack_details/Pack_details_controller/ajax_list/$1';

$route['add-pack-detail'] = 'Pack_details/Pack_details_controller/ajax_add';

$route['edit-pack-detail/(:num)/(:num)'] = 'Pack_details/Pack_details_controller/ajax_edit/$1/$2';

$route['update-pack-detail'] = 'Pack_details/Pack_details_controller/ajax_update';

$route['delete-pack-detail/(:num)/(:num)'] = 'Pack_details/Pack_details_controller/ajax_delete/$1/$2';

//======================================== API SECTION =================================================================

$route['showlist-pack-details-api/(:num)'] = 'Pack_details/Pack_details_controller/ajax_api_list/$1';














//************************************** TRANSACTIONS ROUTES
//**************************************

$route['profiles-page/transactions-page/(:num)/(:num)'] = '../transactions/transactions_controller/index/$1/$2';

$route['profiles-page/showlist-transactions/(:num)'] = '../transactions/transactions_controller/ajax_list/$1';

$route['profiles-page/edit-transaction/(:num)'] = '../transactions/transactions_controller/ajax_edit/$1';

$route['profiles-page/add-transaction/(:num)'] = '../transactions/transactions_controller/ajax_add/$1';

$route['profiles-page/update-transaction/(:num)'] = '../transactions/transactions_controller/ajax_update/$1';

$route['profiles-page/delete-transaction/(:num)'] = '../transactions/transactions_controller/ajax_delete/$1';


//************************************** NOTIFICATIONS ROUTES
//**************************************

$route['notifications-page/notifications-monthly-page'] = 'notifications/notifications_controller/index/monthly';

$route['notifications-page/notifications-quarterly-page'] = 'notifications/notifications_controller/index/quarterly';

$route['notifications-page/notifications-deworming-page'] = 'notifications/notifications_controller/index/deworming';

$route['notifications-page/notifications-severe-page'] = 'notifications/notifications_controller/index/severe';





//************************************** LOGS ROUTES
//**************************************

$route['logs-page'] = 'logs/logs_controller';

$route['showlist-cis'] = 'logs/logs_controller/ajax_list';



//************************************** STATISTICS ROUTES
//**************************************


$route['statistics-page'] = 'statistics/statistics_controller/index';



//************************************** REPORTS (TCPDF) ROUTES
//**************************************

// cis report

$route['reports-page'] = 'reports/reports_controller';

$route['cis-report-active-male'] = 'pdf_reports/pdf_cis_report_controller/index/Male';

$route['cis-report-active-female'] = 'pdf_reports/pdf_cis_report_controller/index/Female';

$route['cis-report-graduated-male'] = 'pdf_reports/pdf_grad_report_controller/index/Male';

$route['cis-report-graduated-female'] = 'pdf_reports/pdf_grad_report_controller/index/Female';

// monthly checkup report

$route['monthly-report-male/(:num)/(:num)'] = 'pdf_reports/pdf_monthly_report_controller/index/Male/$1/$2';

$route['monthly-report-female/(:num)/(:num)'] = 'pdf_reports/pdf_monthly_report_controller/index/Female/$1/$2';

// child profile report

$route['child-report/(:num)'] = 'pdf_reports/pdf_child_report_controller/index/$1';



//************************************** HVI ROUTES
//**************************************

$route['profiles-page/dec-tree-page/(:num)'] = 'dec_tree/dec_tree_controller/index/$1';



//************************************** USERS
//**************************************

$route['users-page'] = 'users/users_controller/index';

$route['showlist-users'] = 'users/users_controller/ajax_list';

$route['edit-user/(:num)'] = 'users/users_controller/ajax_edit/$1';

$route['add-user/(:num)'] = 'users/users_controller/ajax_add/$1';

$route['update-user/(:num)'] = 'users/users_controller/ajax_update/$1';

$route['edit-priveleges/(:num)'] = 'users/users_controller/ajax_edit/$1';

$route['update-priveleges/(:num)'] = 'users/users_controller/ajax_priveleges_update/$1';

$route['delete-user/(:num)'] = 'users/users_controller/ajax_delete/$1';




//************************************** REPORT
//**************************************
			//** SALES **//
// $route['report/sales-report'] = 'sales_report/sales_report_controller';

// $route['report/sales-report/print-report/(:any)/(:any)'] = 'sales_report/sales_report_controller/ajax_set_report/$1/$2';


			//** INVENTORY **//
// $route['report/inventory-report'] = 'inventory_report/inventory_report_controller';

// $route['report/inventory-report/print-report'] = 'inventory_report/inventory_report_controller/ajax_set_report';

// $route['report/inventory-report/print-report-damaged'] = 'inventory_report/inventory_report_controller/ajax_set_report_damaged';

// $route['report/inventory-report/print-report-borrow'] = 'inventory_report/inventory_report_controller/ajax_set_report_borrow';

// data = [{
//     y: percent_active,
//     color: colors[0],
//     drilldown: {
//         name: 'Active genders',
//         categories: ['Male', 'Female'],
//         data: [((children_active_male / total_children_count) * 100), ((children_active_female / total_children_count) * 100)],
//         color: colors[0]
//     }
// }, {
//     y: percent_graduated,
//     color: colors[1],
//     drilldown: {
//         name: 'Graduated genders',
//         categories: ['Male', 'Female'],
//         data: [((children_graduated_male / total_children_count) * 100), ((children_graduated_female / total_children_count) * 100)],
//         color: colors[1]
//     }
// }],