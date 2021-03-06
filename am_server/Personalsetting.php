<?php

class Personalsetting extends Control implements RESTfulInterface 
{
	private $db = null;
	private $target_type;
	
	function __construct() {
		
		require "./config/config.php";
		require "./lib/pdodb.php";
		
		$this->db = new PDODB();
		$res = $this->db->connect( $_DB['host'], $_DB['dbname'], $_DB['username'], $_DB['password'] );
		
		if( !$res )
			self::exceptionResponse(500, "Server maintenance");
		
		$this->target_type_list = self::getTargetType();
			
	}
	
	
	function restGet($segments) {
		
		//check segment's lenth for choosing function
		$result = null;
		$function = $segments[0];
		
		switch($function) {
			case "target":		//get partial info
				$result = $this->getTarget($segments[1]);
				break;
				
			default:
				//$result = $this->getSchedule($segments[0]);
				break;
		}
		
		if( !$result )
			self::exceptionResponse(404, 'Not found');
		else 
			print_r(json_encode($result));
		
	}
	
	function restPost($segments) {
		$data = json_decode( file_get_contents('php://input'), true );
		
		if( !is_array($data) ) {
			self::exceptionResponse(400, "Request is not a valid json format.");
		}
		else {
			$result = $this->insertTarget($segments[0], $data);
			if(!$result) {
				self::exceptionResponse(501, "Server Error!");
			} else {
				print_r(json_encode( array("id"=>$segments[0], "record"=>$result) ));
			}
		}
		
	}
	
	
	function restPut($segments) {
		$data = json_decode( file_get_contents('php://input'), true );
		
		
	}
	
	
	function restDelete($segments) {
		$result = $this->deleteTarget($segments[0]);
		if( !$result )
			self::exceptionResponse(501, "Server Error");
	}
	
	
	
	private function getTargetType() {
		$sql = "SELECT id, type FROM personal_target_item ";
		$result = $this->db->queryAll($sql);
		
		if( !$result )
			return FALSE;

		return $result;
	}
	
	private function getTargetTypeId($query_str) {
		foreach($this->target_type_list as $value) {
			if($query_str == $value["type"]) {
				return $value["id"];
			}	
		}
	}
	
	
	private function getTarget($agent_id) {
		$data = array();
		
		//get target item by agent_id
		$sql = "SELECT 
					type_id, 
					target, 
					value 
				FROM 
					personal_target
				WHERE 
					agent_id = ?";
		 
		$result = $this->db->queryAll($sql, array($agent_id));
		 
		if( !$result )
			return FALSE;

		foreach($this->target_type_list as $type) {
			$type_id = $type["id"];
			$type_name = $type["type"];
			$target = array();
			
			foreach($result as $key => $value) {
				if($value["type_id"] == $type_id) {
					$target[$value["target"]] = $value["value"];
					unset($result[$key]);
				}
			}
			
			$data[$type_name] = $target;
		}
		 
		return $data;
	}
	
	
	private function insertTarget($agent_id, $data) {
		$count = 0;
		
		//delete existing record first.
		$result = $this->deleteTarget($agent_id);
		if(!$result)
			return FALSE; 

		foreach($data as $type => $item) {
			//get type id
			$type_id = $this->getTargetTypeId($type);
				
			foreach($item as $target => $value) {
				$insert_data["agent_id"] = $agent_id;
				$insert_data["type_id"] = $type_id;
				$insert_data["target"] = $target;
				$insert_data["value"] = $value;
					
				$result = $this->db->insert("agent_metrics.personal_target", $insert_data);
				if( !$result )
					return FALSE;
				
				$count ++;
			}
		}
		
		return $count;
	}
	
	private function deleteTarget($agent_id) {
		$result = $this->db->delete("agent_metrics.personal_target", array("agent_id"=>$agent_id));
		
		if( !$result )
			return FALSE;
		else 
			return TRUE;
	}
	
  
}
?>