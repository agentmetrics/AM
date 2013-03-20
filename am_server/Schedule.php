<?php

class Schedule extends Control implements RESTfulInterface 
{
	private $db = null;
	
	function __construct() {
		
		require "./config/config.php";
		require "./lib/pdodb.php";
		
		$this->db = new PDODB();
		$res = $this->db->connect( $_DB['host'], $_DB['dbname'], $_DB['username'], $_DB['password'] );
		
		if( !$res )
			self::exceptionResponse(500, "Server maintenance");
			
	}
	
	
	function restGet($segments) {
		
		//check segment's lenth for choosing function
		$result = null;
		$function = $segments[0];
		
		switch($function) {
			case "partial":		//get partial info
				$result = $this->getCustomerPartial();
				break;
				
			default:
				$result = $this->getSchedule($segments[0]);
				break;
		}
		
		if( !$result )
			self::exceptionResponse(404, 'Not found');
		else 
			print_r(json_encode($result));
		
	}
	
	
	function restPost($segments) {
		$data = json_decode( file_get_contents('php://input'), true );
		
		if( !is_array($data) )
			self::exceptionResponse(400, "Request is not a valid json format:" . file_get_contents('php://input'));
		
  		$schedule['start_time'] = $data['start_time'];
  		$schedule['end_time'] = $data['end_time'];
  		$schedule['detail'] = $data['detail'];
  		$schedule['customer_id'] = $data['customer_id'];
  		$schedule['start_day'] = $data['start_day'];
  		$schedule['end_day'] = $data['end_day'];
  		$schedule['start_month'] = $data['start_month'];
  		$schedule['end_month'] = $data['end_month'];
  		$schedule['start_year'] = $data['start_year'];
  		$schedule['end_year'] = $data['end_year'];
  		$schedule['subject'] = $data['subject'];
  		$schedule['account_id'] = $data["account_id"];
  		$schedule['schedule_type'] = $data['schedule_type'];
  		$schedule['create_time'] = time();
    	$schedule['modify_time'] = "";
    	$schedule['delete_time'] = "";
    	$schedule['creator'] = $data['creator'];
    	$schedule['modifier'] = $data['modifier'];
    	$schedule['complete'] = $data['complete'];

		$result = $this->db->insert("agent_metrics.schedule", $schedule);

		if( $result ) {
			$res['id'] = $result;
			
			// $this->insertEvaluation($res['id'], $data["evaluation"]);
			// $this->insertTags($res['id'], $data["tags"]);
			
			print_r(json_encode( array("id"=>$result) ));
		}
		else {
			self::exceptionResponse(500, "can not insert data into DB!");
		}
  }
	
 
  function restPut($segments) {
  	$data = json_decode( file_get_contents('php://input'), true );
  	//var_dump($data);
  	
  	if( !is_array($data) )
			self::exceptionResponse(400, "Request is not a valid json format:" . file_get_contents('php://input'));
  	
  	if( !isset($data["id"]) or empty($data["id"]) )
  		self::exceptionResponse(400, "Request is not a valid json format:" . file_get_contents('php://input'));
  	
		$schedule['start_time'] = $data['start_time'];
  		$schedule['end_time'] = $data['end_time'];
  		$schedule['detail'] = $data['detail'];
  		$schedule['customer_id'] = $data['customer_id'];
  		$schedule['start_day'] = $data['start_day'];
  		$schedule['end_day'] = $data['end_day'];
  		$schedule['start_month'] = $data['start_month'];
  		$schedule['end_month'] = $data['end_month'];
  		$schedule['start_year'] = $data['start_year'];
  		$schedule['end_year'] = $data['end_year'];
  		$schedule['subject'] = $data['subject'];
  		$schedule['account_id'] = $data["account_id"];
  		$schedule['schedule_type'] = $data['schedule_type'];
  		$schedule['create_time'] = $data['create_time'];
    	$schedule['modify_time'] = time();
    	$schedule['creator'] = $data['creator'];
    	$schedule['modifier'] = $data['modifier'];
    	$schedule['complete'] = $data['complete'];
	
	if( !empty($data["delete"]) )
    	$schedule['delete_time'] = time();
		
		$result = $this->db->update("agent_metrics.schedule", $schedule, array("id"=>$data["id"]));
		
		if( $result ) {
			// $this->insertEvaluation($data["id"], $data["evaluation"]);
			// $this->insertTags($data["id"], $data["tags"]);
			echo TRUE;
		}
		else {
			self::exceptionResponse(500, "can not insert data into DB!");
		}
  }
 
  
	function restDelete($segments) {
		$result = $this->db->delete("agent_metrics.schedule", array("id"=>$schedule_id));
		
		if( !$result )
			self::exceptionResponse(500, "can not insert data into DB!");
		else
			echo TRUE;
    }
  
  /* <Internal>
   * request: customer id
   * response: customer[]
   */
  function getSchedule($schedule_id) {
  	
  	$sql = "SELECT * FROM schedule WHERE id=?";
  	
  	$result = $this->db->query($sql, array($schedule_id));
  	
  	if( !$result )
  		return FALSE;
  	
  	//personal
  	$schedule['id'] = $result['id'];
  	$schedule['start_time'] = $result['start_time'];
  	$schedule['end_time'] = $result['end_time'];
  	$schedule['detail'] = $result['detail'];
  	$schedule['customer_id'] = $result['customer_id'];
  	$schedule['start_day'] = $result['start_day'];
  	$schedule['end_day'] = $result['end_day'];
  	$schedule['start_month'] = $result['start_month'];
  	$schedule['end_month'] = $result['end_month'];
  	$schedule['start_year'] = $result['start_year'];
  	$schedule['end_year'] = $result['end_year'];
  	$schedule['subject'] = $result['subject'];
  	$schedule['account_id'] = $result["account_id"];
  	$schedule['schedule_type'] = $result['schedule_type'];
  	$schedule['create_time'] = $result['create_time'];
    $schedule['modify_time'] = $result['modify_time'];
    $schedule['delete_time'] = $result['delete_time'];
    $schedule['creator'] = $result['creator'];
    $schedule['modifier'] = $result['modifier'];
    $schedule['complete'] = $result['complete'];
  	
  	return $schedule;
  }
  
}
?>