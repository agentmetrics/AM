<?php

class Customer extends Control implements RESTfulInterface {
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
			case "paying":		//get paying customer list of this month  
				$result = $this->getPayingCustomer();
				break;
			case "birthday":	//get birthday customer list of this month
				$result = $this->getBirthdayCustomer();
				break;
			case "new":			//get new customer list of this month
				$result = $this->getNewCustomer();
				break;
			default:
				$result = $this->getCustomer($segments[0]);
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
			self::exceptionResponse(400, "Request is not a valid json format.");
		
		$customer['name'] = $data["name"];
		$customer['address'] = $data["address"];
		$customer['identify_no'] = $data["identify_no"];
		$customer['birthday'] = $data["birthday"];
		$customer['cellphone'] = $data["cellphone"];
		$customer['email'] = $data["email"];
		$customer['gender'] = $data["gender"];
		$customer['marriage'] = $data["marriage"];
		$customer['telephone'] = $data["telephone"];
		//$customer['thumbnail'] = $data["thumbnail"];
		//$customer['fb_id'] = $data["fb_id"];
		$customer['agent_id'] = $data['agent_id'];
		$customer['child_boy'] = $data["child"]['boy'];
		$customer['child_girl'] = $data["child"]['girl'];
		$customer['note'] = $data["note"];
    	$customer['personality'] = $data["personality"];
		$customer['company_name'] = $data["company"]['name'];
		$customer['company_address'] = $data["company"]["address"];
		$customer['company_phone'] = $data["company"]["phone"];
		//$customer['company_fax'] = $data["company"]["fax"];
		//$customer['company_job_desc'] = $data["company"]["job_desc"];
		$customer['company_category'] = $data["company"]["category"];
		$customer['company_title'] = $data["company"]["title"];
		//$customer['company_worktime_start'] = $data["company"]["worktime_start"];
		//$customer['company_worktime_end'] = $data["company"]["worktime_end"];
		$customer['create_time'] = time();
		
		$result = $this->db->insert("agent_metrics.customer", $customer);

		if( $result ) {
			$res['id'] = $result;
			
			/*FIXME, add checking db record*/
			$this->insertEvaluation($res['id'], $data["evaluation"]);
			$this->insertTags($res['id'], $data["tags"]);
			
			//caculate score
			$weight = doubleval($data["evaluation"]["weight"]);
			$count_list = array_slice($data["evaluation"], 0, count($data["evaluation"])-1);
			$sum = array_sum($count_list) * $weight;
			
			print_r(json_encode( array("id"=>$result, "score"=>$sum) ));
		}
		else {
			self::exceptionResponse(500, "can not insert data into DB!");
		}
  }
	
 
  	function restPut($segments) {
  		$data = json_decode( file_get_contents('php://input'), true );
  		//var_dump($data);
  	
  		if( !is_array($data) )
			self::exceptionResponse(400, "Request is not a valid json format. ");
  	
	  	if( !isset($data["id"]) or empty($data["id"]) )
	  		self::exceptionResponse(400, "Request is not a valid json format. ");
	  	
		$customer['name'] = $data["name"];
		$customer['address'] = $data["address"];
		$customer['identify_no'] = $data["identify_no"];
		$customer['birthday'] = $data["birthday"];
		$customer['cellphone'] = $data["cellphone"];
		$customer['email'] = $data["email"];
		$customer['gender'] = $data["gender"];
		$customer['marriage'] = $data["marriage"];
		$customer['telephone'] = $data["telephone"];
		//$customer['thumbnail'] = $data["thumbnail"];
		//$customer['fb_id'] = $data["fb_id"];
		$customer['agent_id'] = $data['agent_id'];
		$customer['child_boy'] = $data["child"]['boy'];
		$customer['child_girl'] = $data["child"]['girl'];
		$customer['note'] = $data["note"];
    	$customer['personality'] = $data["personality"];
		$customer['company_name'] = $data["company"]['name'];
		$customer['company_address'] = $data["company"]["address"];
		$customer['company_phone'] = $data["company"]["phone"];
		$customer['company_category'] = $data["company"]["category"];
		$customer['company_title'] = $data["company"]["title"];
		$customer['modify_time'] = time();
		
		$result = $this->db->update("agent_metrics.customer", $customer, array("id"=>$data["id"]));
		
		if( $result ) {
				
			/*FIXME, add checking db record*/
			$this->insertEvaluation($data["id"], $data["evaluation"]);
			$this->insertTags($data["id"], $data["tags"]);
			
			//caculate score
			$weight = doubleval($data["evaluation"]["weight"]);
			$count_list = array_slice($data["evaluation"], 0, count($data["evaluation"])-1);
			$sum = array_sum($count_list) * $weight;
			
			print_r(json_encode( array("id"=>$data["id"], "score"=>$sum) ));
		}
		else {
			self::exceptionResponse(500, "can not insert data into DB!");
		}
	}
 
  
	function restDelete($segments) {
		$result = $this->db->delete("agent_metrics.customer", array("id"=>$segments[0]));
		
		if( !$result )
			self::exceptionResponse(500, "can not insert data into DB!");
		else
			echo TRUE;
  	}
  
  
  
  /* <Internal>
   * request: customer id, evaluation[]
   * response: boolean
   */
  private function insertEvaluation($customer_id, $data) {
  	$evaluation['customer_id'] = $customer_id;
  	$evaluation['age'] = $data["age"];
  	$evaluation['contact_difficulty'] = $data["contact_difficulty"];
  	$evaluation['contact_frequency'] = $data["contact_frequency"];
  	$evaluation['dependent_count'] = $data["dependent_count"];
  	$evaluation['income_monthly'] = $data["income_monthly"];
  	$evaluation['known_time'] = $data["known_time"];
  	$evaluation['weight'] = $data["weight"];
  	$evaluation['marriage'] = $data["marriage"];
  	$evaluation['create_time'] = time();

  	
  	//Do delete record first
  	$result = $this->db->delete("agent_metrics.customer_evaluation", array("customer_id"=>$customer_id));
  	if( !$result )
  		return FALSE;
  	
  	$result = $this->db->insert("agent_metrics.customer_evaluation", $evaluation);
  	if( !$result )
  		return FALSE;
  	else
  		return TRUE;
  }
  
  
  /* <Internal>
   * request: customer id, tags[]
   * response: boolean
   */
  private function insertTags($customer_id, $data) {
  	/*
  	"tags" : ["�i�R","�j��","����","���f"]
  	*/
  	
    if(is_null($data)) return;
 
  	$now = time();
  	
  	//Do delete record first
  	$result = $this->db->delete("agent_metrics.customer_tags", array("customer_id"=>$customer_id));
  	if( !$result )
  		return FALSE;
  	
  	foreach($data as $tag) {
  		$insert_data["customer_id"] = $customer_id;
  		$insert_data["tag"] = $tag;
  		$insert_data["create_time"] = $now;
  		
  		$result = $this->db->insert("agent_metrics.customer_tags", $insert_data);
  		if( !$result )
  			return FALSE;
  	}
  	
  	return TRUE;
  }
  
  
  /* <Internal>
   * request: customer id, relationship[]
   * response: boolean
   */
  private function insertRelationship($customer_id, $data) {
  	$now = time();
  	
  	//Do delete record first
  	$result = $this->db->delete("agent_metrics.customer_relationship", array("customer_id"=>$customer_id));
  	if( !$result )
  		return FALSE;
  	 
  	foreach($data as $relationship) {
  		$insert_data["customer_id"] = $customer_id;
  		$insert_data["related"] = $relationship["related"];
  		$insert_data["relationship_id"] = $relationship["relationship_id"];
  		$insert_data["create_time"] = $now;
  	
  		$result = $this->db->insert("agent_metrics.customer_tags", $insert_data);
  		if( !$result )
  			return FALSE;
  	}
  	 
  	return TRUE;
  }
  
  
  /* <Internal>
   * request: customer id
   * response: customer[]
   */
  function getCustomer($customer_id) {
  	
  	$sql = "SELECT * FROM customer WHERE id=?";
  	
  	$result = $this->db->query($sql, array($customer_id));
  	
  	if( !$result )
  		return FALSE;
  	
  	//personal
  	$personal['id'] = $result['id'];
  	$personal['name'] = $result['name'];
  	$personal['address'] = $result['address'];
  	$personal['identify_no'] = $result['identify_no'];
  	$personal['birthday'] = $result['birthday'];
  	$personal['cellphone'] = $result['cellphone'];
  	$personal['email'] = $result['email'];
  	$personal['gender'] = $result['gender'];
  	$personal['marriage'] = $result['marriage'];
  	$personal['telephone'] = $result['telephone'];
  	$personal['thumbnail'] = $result['thumbnail'];
  	$personal['fb_id'] = $result['fb_id'];
  	$customer['note'] = $data["note"];
  	$personal['create_time'] = $result['create_time'];
  	$personal['modify_time'] = $result['modify_time'];
    $personal['personality'] = $result['personality'];
  	
  	//children
  	$child['boy'] = $result['child_boy'];
  	$child['girl'] = $result['child_girl'];
  	
  	//visit_history
  	$visit_records = $this->getVisitRecords($customer_id);
  	
  	//evaluation
  	$evaluations = $this->getEvaluation($customer_id);
  	
  	//tag
  	$tags = $this->getTags($customer_id);
  	
   
  	//company
  	$company['name'] = $result['company_name'];
  	$company['address'] = $result['company_address'];
  	$company['phone'] = $result['company_phone'];
  	$company['category'] = $result['company_category'];
  	$company['title'] = $result['company_title'];

  	
  	//combine the data
  	$data = $personal;
  	$data['child'] = $child;
  	$data['company'] = $company;
  	
  	if( $evaluations )
  		$data['evaluation'] = $evaluations;
  	
  	if( $visit_records )
  		$data['visit_history'] = $visit_records;
  	
  	if( $tags )
  		$data['tags'] = $tags;

    //relationship
    $relationship = $this->getRelationship($customer_id);
    if( $relationship )
      $data['relationship'] = $relationship;
  	
  	return $data;
  }
  
  
  /* <Internal>
   * request: none
   * response: last customer partial[]
   */
  function getCustomerPartial() {
  	$data = array();
  	
  	$sql = "SELECT 
  				id, 
  				name, 
  				cellphone, 
  				gender, 
  				personality, 
  				birthday, 
  				create_time, 
  				is_paying 
  			FROM 
  				customer ";
  	
  	$result = $this->db->queryAll($sql);
  	if( !$result ) 
  		return FALSE;

  	foreach($result as $customer) {
  		$partial = array();
  		$partial = $customer;
  		
  		//check this month birthdy.
  		$partial["is_birthday"] = $this->is_current_month($customer["birthday"]);
  		
  		//check 
  		$partial["is_new"] = $this->is_current_month($customer["create_time"]);
  		
  		//visit_history
  		$last_visit = $this->getLastVisit($customer["id"]);
  		if($last_visit)
  			$partial["last_visit_time"] = $last_visit["time"];
  		
  		//evaluation
  		$evaluations = $this->getEvaluation($customer["id"]);
  		if($evaluations) {
  			$weight = doubleval($evaluations["weight"]);
  			$count_list = array_slice($evaluations, 0, count($evaluations)-1);
  			$sum = array_sum($count_list) * $weight;
  			$partial["evaluation_score"] = $sum;
  		}
  			
  		//tag
  		$tags = $this->getTags($customer["id"]);
  		if($tags)
  			$partial["tags"] = $tags;
  		
  		array_push($data, $partial);
  	}
  	
  	if( count($data) == 0 )
  		return FALSE;
  	
  	return $data;
  }
  
  
  /* <Internal>
   * request: customer id
   * response: last visit record[]
   */
  function getLastVisit($customer_id) {
  	$sql = "SELECT 
  				detail, 
  				place, 
  				time 
  			FROM 
  				customer_visit_history 
  			WHERE 
  				customer_id=? 
  			ORDER BY 
  				create_time DESC LIMIT 1";
  	
  	$result = $this->db->query($sql, array($customer_id));
  
  	return $result;
  }


  /* <Internal>
   * request: customer id
   * response: visit records[]
   */
  function getVisitRecords($customer_id) {

    $history = array();
    $sql = "SELECT 
              id,
              detail, 
              place, 
              time 
            FROM 
              customer_visit_history 
            WHERE 
              customer_id=? 
            ORDER BY 
              create_time DESC";
    
    $result = $this->db->queryAll($sql, array($customer_id));

    foreach($result as $visit) {
      $record = array();
      $record['time'] = $visit['time'];
      $record['content'] = $visit['detail'];
      array_push($history, $record);
    }
  
    return $history;
  }
  
  
  /* <Internal>
   * request: customer id
   * response: evaluation[]
   */
  function getEvaluation($customer_id) {
  	$sql = "SELECT 
  						income_monthly, 
  						age, 
  						marriage, 
  						dependent_count, 
  						known_time, 
  						contact_frequency, 
  						contact_difficulty, 
  						weight 
  					FROM 
  						customer_evaluation 
  					WHERE 
  						customer_id=? 
  					ORDER BY 
  						create_time DESC LIMIT 1";
  	
  	$result = $this->db->query($sql, array($customer_id));
  
  	return $result;
  }
 
  /* <Internal>
   * request: customer id
   * response: relationship[]
   */
  function getRelationship($customer_id) {
    $first_tier_relationship = $this->_getRelationship($customer_id, -1);
    $result = array();
    foreach($first_tier_relationship as $relationship) {
      $record = array();
      $record['relationship_id'] = $relationship['relationship_id'];
      $record['related'] = $relationship['related'];
      $record['link'] = $this->_getRelationship($relationship['relationship_id'], $customer_id);
      array_push($result, $record);
    }
    return $result;
  }

  function _getRelationship($customer_id, $exclude_id) {
    $relationship = array();
    $sql = "SELECT 
              related, 
              relationship_id
            FROM 
              customer_relationship
            WHERE 
              customer_id=?";
    
    $result = $this->db->queryAll($sql, array($customer_id));

    foreach($result as $friendship) {
      if($exclude_id != $friendship['relationship_id']){
        $record = array();
        $record['relationship_id'] = $friendship['relationship_id'];
        $record['related'] = $friendship['related'];
        array_push($relationship, $record);
      }
    }
    return $relationship;
  }

  
	/* <Internal>
   * request: customer id
   * response: tags[]
   */
	function getTags($customer_id) {
		$sql = "SELECT tag FROM customer_tags WHERE customer_id=? ";
		
		$result = $this->db->queryAll($sql, array($customer_id), PDO::FETCH_COLUMN);
		
		return $result;
	}
	
	
	function is_current_month( $time ) {
		$result = "0";
		$time_array = getdate($time);
		$current_month = strtolower(date("F"));
		if(strtolower($time_array["month"]) == $current_month) {
			$result = "1";
			//var_dump($current_month);
		}
		return $result;
	}
	
}
?>