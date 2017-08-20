<?php

/**
 * Описание класса AjaxExample
 * @author Alexandr Smirnov
 * @version 0.1
 *
 */
class AjaxExample {
	
	private $db = null; // объект базы данных mysqli
	
	function __construct() {
		require_once 'database.php';
		$db = new database;
		$this->db = $db;
		if (!$this->db) {
			setLogMsg(1, __FILE__ . ' (' . __LINE__ . ') -> ' . __METHOD__ . ' : ' . ' -- Не удалось обратиться к объекту базы данных');
			die('Не удалось обратиться к объекту базы данных');
		}
		setLogMsg(3, __FILE__ . ' (' . __LINE__ . ') -> ' . __METHOD__ . ' : ' . ' -- Объект создан');
	}
	
	// получение списка категорий
	public function getProductGroups($parentGroupId = 0) {
		if (!is_numeric($parentGroupId)) $parentGroupId = 0;
		$query = sprintf('select pg.prgid as id, pg.name as name from %sproduct_group pg where pg.active = 1 and pg.prgid_parent = %u', DB_PREFIX, $parentGroupId);
		setLogMsg(0, __FILE__ . ' (' . __LINE__ . ') : query = ' . $query);
		if ($result = $this->db->mysqli->query($query)) {
			$rows = $this->db->fetch_all($result);
			$result->close();
			setLogMsg(3, __FILE__ . ' : ' . __LINE__ . ' -- result = ' . var_export($rows, true));
			return $rows;
		} else {
			// если значение было обнаружено
			setLogMsg(3, __FILE__ . ' : ' . __LINE__ . ' -- result error = ' . $this->db->mysqli->error);	
			return null;
		}
	}
	
	// получение списка товаров с ценами
	public function getProductsByGroupId($groupId) {
		if (!is_numeric($groupId)) $groupId = 0;
		$query = sprintf('select p.prid, p.name, p.description, concat(s.value, " ", (SELECT c.name FROM %1$scurency c WHERE c.cid = s.cid limit 1)) as stock
							from %1$sproduct p
							left join %1$sstock s on s.prid = p.prid and s.stid = (select stid from %1$sstock_type where name = "закупочная цена" limit 1)
							where p.prgid = %2$u', DB_PREFIX, $groupId);
		setLogMsg(0, __FILE__ . ' (' . __LINE__ . ') : query = ' . $query);
		if ($result = $this->db->mysqli->query($query)) {
			$rows = $this->db->fetch_all($result);
			$result->close();
			setLogMsg(3, __FILE__ . ' : ' . __LINE__ . ' -- result = ' . var_export($rows, true));
			return $rows;
		} else {
			// если значение было обнаружено
			setLogMsg(3, __FILE__ . ' : ' . __LINE__ . ' -- result error = ' . $this->db->mysqli->error);	
			return null;
		}
	}
	
	// получение списка атрибутов товара
	public function getProductProperies($prid) {
		if (!is_numeric($prid)) $prid = 0;
		$query = sprintf('select * from %sproperty_value_with_currency where prid = %u', DB_PREFIX, $prid);
		setLogMsg(0, __FILE__ . ' (' . __LINE__ . ') : query = ' . $query);
		if ($result = $this->db->mysqli->query($query)) {
			$rows = $this->db->fetch_all($result);
			$result->close();
			setLogMsg(3, __FILE__ . ' : ' . __LINE__ . ' -- result = ' . var_export($rows, true));
			return $rows;
		} else {
			// если значение было обнаружено
			setLogMsg(3, __FILE__ . ' : ' . __LINE__ . ' -- result error = ' . $this->db->mysqli->error);	
			return null;
		}
	}
	
}

?>