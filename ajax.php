<?php

ini_set('display_errors', 'On'); // показывать ошибки - на готовом продукте убрать

header('Content-Type: text/html; charset=utf-8');
include_once dirname(__FILE__) . '/lib/config.php';
include_once 'logging.php';

setLogMsg(3, __FILE__ . ' : ' . __LINE__ . ' -- POST = ' . var_export($_POST, true), 'getpost.log');
setLogMsg(3, __FILE__ . ' : ' . __LINE__ . ' -- GET = ' . var_export($_GET, true), 'getpost.log');

include_once 'AjaxExample.php';
$ajaxObj = new AjaxExample();

$data = null;

// вернуть список категорий
if (isset($_GET['getGroups'])) {
	$data = $ajaxObj->getProductGroups($_GET['getGroups']);
	$data = json_encode($data);
}

// вернуть набор товаров
if (isset($_GET['getProducts'])) {
	$data = $ajaxObj->getProductsByGroupId($_GET['getProducts']);
	$data = json_encode($data);
}

// вернуть список атрибутов товара
if (isset($_GET['getProductInfo'])) {
	$data = $ajaxObj->getProductProperies($_GET['getProductInfo']);
	$data = json_encode($data);
}

echo $data;

?>