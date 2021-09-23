<?php 
 session_start();

 $conn = new mysqli("localhost", "root", "", "quiz");
 $msg="";

 if(isset($_POST['login'])){
 	$username= $_POST['username'];
 	$password= $_POST['password'];
 	$password= sha1($password);
 	$usertype= $_POST['usertype'];

 	$sql = "SELECT * FROM student WHERE username=? AND password=? AND role=?";

 	$stmt=$conn->prepare($sql);
 	$stmt->bind_param("sss",$username,$password,$usertype);
 	$stmt->execute();
 	$result = $stmt->get_result();
 	$row = $result->fetch_assoc();

 	session_regenerate_id();
 	$_SESSION['username']= $row['username'];
 	$_SESSION['usertype']= $row['role'];

 	session_write_close();

 	if($result->num_rows == 1 && $_SESSION['usertype']=="Student"){
 		header("location: student/manage_quiz/manage_quiz.php");
 	}
 	else if($result->num_rows == 1 && $_SESSION['usertype']=="Teacher"){
 		header("location: teacher/manage_quiz/manage_quiz.php");
 	}else{
 		$msg="Username or Password is Incorrect!";
 	}
 	
 }

?>




<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="author" content="Chirag Awasthi">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1,shrink-to-fit=no">
	<title>Login</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<body class="bg-dark">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-5 bg-light mt-5 px-0">
				<h3 class="text-center text-light bg-danger p-3">Login </h3>
				<form action="<?= $_SERVER['PHP_SELF'] ?>" method="post" class="p-4">
					<div class="form-group">
						<input type="text" name="username" class=" form-control form-control-lg" placeholder="username" required>
					</div><br>
					<div class="form-group">
						<input type="password" name="password" class=" form-control form-control-lg" placeholder="password" required>
					</div><br>
					<div class="form-group">
						<label for="usertype">I'm a :</label>
						<input type="radio" name="usertype" value="Student" class="custom-radio" required>&nbsp;Student |  
 						<input type="radio" name="usertype" value="Teacher" class="custom-radio" required>&nbsp;Teacher
						 

					</div><br>
					<div class="form-group">
						<input type="submit" name="login" class="btn btn-danger btn-block " style="width: 100%">
					</div>
					<h5 class="text-danger text-center"><?= $msg;  ?></h5>
				</form>

			</div>
		</div>
	</div>


</body>
</html>