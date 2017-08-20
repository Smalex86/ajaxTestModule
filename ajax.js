var getProductList = function() {
	/* функция отправки запроса на получение списка товаров */
	"use strict";
	$("#message").empty();
	if ($(this)[0].tagName == "OPTION") { $.getJSON("../ajax.php?getProducts=" + $(this).val(), insertIntoProductList); }			
}, 		
getProductInfo = function() {
	/* функция отправки запроса на получение атрибутов товара */
	"use strict";
	$("#message").empty();
	if ($(this)[0].tagName == "A") { $.getJSON("../ajax.php?getProductInfo=" + $(this).attr('prid'), insertIntoProduct); }
},	
productBuy = function() {
	/* функция отправки запроса на покупку товара */
	"use strict";
	$("#message").text("Переход на страницу покупки товара ... заглушка");		
},		
productCheck = function() {
	/* функция отправки запроса на проверку товара */
	"use strict";
	$("#message").text("Вызов функции проверки товара ... заглушка");
},
insertIntoProduct = function(product) {
	/* вставка данных о продукте (набор атрибутов) */
	"use strict";
	$("#message").empty();
	var $productInfo = $("#productList").empty().append("<p>Информация о товаре</p>"), 
		$table = $("<table class='table'><tr><th>Атрибут</th><th>Значение</th></tr></table>").appendTo($productInfo);
	if (product !== null) { $.each(product, function(key, value) {
			$('<tr/>').append("<td>" + value['name'] + "</td>").append("<td>" + value['value'] + "</td>").appendTo($table);				
	});}
},	
insertIntoGroupList = function (counts) {
	/* функция для вставки полученного списка групп товаров */
	"use strict";
	$("#message").empty();
	var $groupList = $("#groupList").empty().append("<p>Категории товаров</p>"), 
		$select = $("<select size=5 id='groupList'></select>").appendTo($groupList);
	$.each(counts, function(key, value) { $select.append("<option value=" + value['id'] + ">" + value['name']); });
	$("option").each( function() { $(this).bind('click', getProductList); });
},
insertIntoProductList = function (counts) {
	/* функция для вставки полученного набора данных списка продуктов */
	"use strict";
	$("#message").empty();
	var $productList = $("#productList").empty().append("<p>Список товаров</p>"), 
		$table = $("<table class='table'><tr><th>№</th><th>Название</th><th>Цена</th><th>Действия</th></tr></table>").appendTo($productList),
		$buttons, $tmp, $tr;
	if (counts !== null) {
		$.each(counts, function(key, value) {
			$tmp = $('<a/>', {'class': 'btn btn-default btn-xs', text: 'Детали', click: getProductInfo, "prid": value['prid']})
				.add('<a/>', {'class': 'btn btn-default btn-xs',	text: 'Проверить', click: productCheck, "prid": value['prid']})
				.add('<a/>', {'class': 'btn btn-default btn-xs',	text: 'Купить',	click: productBuy,	"prid": value['prid']});
			$tr = $('<tr/>').append("<td>" + value['prid'] + "</td>").append("<td>" + value['name'] + "</td>").append("<td>" + value['stock'] + "</td>");
			$('<td/>').append($tmp).appendTo($tr);
			$table.append($tr);
		});
	}
},		
main = function () {
	/* функция срабатывающая при загрузке страницы */
	"use strict";
	$.getJSON("../ajax.php?getGroups=1", insertIntoGroupList);
	$.getJSON("../ajax.php?getProducts=0", insertIntoProductList);
}
$(document).ready(main);