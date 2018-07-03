<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!--  %@ taglib prefix="spring" uri="http://www.springframework.org/tags"% -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, user-scalable=no">	
	<title>Product Management</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" language="javascript" src=" https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script>
	$(document).ready(function() {
		$('#submitLogin').click( function () {	    	
    		  $("#submitForm").submit();
	    });
		
		/*$("body").on('DOMSubtreeModified', "msg", function() {
		    $('.alert').removeClass("hide");
		});*/
		if($("#errorMessage").text()!=""){
			$("#msg").text($("#errorMessage").text());
			$(".alert").removeClass("hide");
		}
	});
	</script>
	<style>
		tr.odd.selected {
    		background-color: #acbad4;
		}
		tr.selected{
		    background-color: #B0BED9 !important;
		}
		.mandatory{
			color:red;
		}
		.modal-header {
		    padding: 15px;
		    border-bottom: 1px solid #e5e5e5;
		    background-color: #0069d9;
		    color: #fff;
		    border-top-left-radius: 0.8rem;
    		border-top-right-radius: 0.8rem;
		}
		.close:not(:disabled):not(.disabled) {
		    cursor: pointer;
		    color: #fff;
		}
		.bd-navbar {
		    position: -webkit-sticky;
		    position: sticky;
		    top: 0;
		    z-index: 1071;
		    color:#fff;
	   }
	  .bd-navbar {
		    min-height: 4rem;
		    background-color: #563d7c;
		    box-shadow: 0 .5rem 1rem rgba(0,0,0,.05),inset 0 -1px 0 rgba(0,0,0,.1);
		    color:#fff;
	    }
	    .show{
	    	display:show;
	    }
	    .hide{
	    	display:none;
	    }
	    #alertArea{
	    	z-index: 99999;
		    position: absolute;
		    float: right;
		    overflow: overlay;
		    right: 0;
	    }
	    .alert {
		    padding: 5px;
		    margin-bottom: 10px;
		    border: 1px solid transparent;
		    border-radius: 4px;
		    font-size: 12px;
	   }
	   .container{
	   	    position: relative;
	   }
	   .alert-dismissable .close, .alert-dismissible .close {
		    position: relative;
		    top: -2px;
		    right: 0px;
		    padding:2px;
	   }
	   .navbar-brand{
	   		color:#fff;
	   }
	   .navbar-brand:focus, .navbar-brand:hover {
		    text-decoration: none;
		    color:#337ab7;
		}
	</style>
</head>
<body class="container">
	<header class="navbar navbar-expand navbar-dark flex-column flex-md-row bd-navbar">
  		<div class="col-sm-8">
  			<a align="left" class="navbar-brand" href="/" aria-label="ProductManagement">Product Management</a> 
  		</div>
  		<div class="col-sm-4"> 
    		<a align="right" class="navbar-brand" href="/">Login</a>
    	</div>
	</header>
	<div class="row">
   		<div class="col-sm-4"></div>   
		<div class="col-sm-4">
			<div class="panel-group">
			   <div class="panel panel-primary">
			      <div class="panel-heading">Login Product Management</div>
			      <div class="panel-body">
			      	<form:form name="submitForm" method="POST" id="submitForm">
					<div align="center">
						<div class="form-group">
						    <label for="userName">UserName (<span class="mandatory">*</span>)</label>
						    <input type="text" class="form-control" id="userName" name="userName" placeholder="AttuID" required>
						  </div>
						  <div class="form-group">
						    <label for="password">Password (<span class="mandatory">*</span>)</label>
						    <input type="text"   class="form-control" id="password" name="password" placeholder="Password" required></input>
						  </div>	  
						  <input type="submit" value="Submit" class="btn btn-primary" id="submitLogin"/>
						  <div style="color: red;display:none;" id="errorMessage">${error}</div>						  
					</div>
					</form:form>
			      </div>
			    </div>
			 </div>
		</div>	
		<div class="col-sm-4">			
		  <div class="alert alert-danger alert-dismissible hide">
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>Error!</strong><span id="msg"></span> 
		  </div>
		</div>
	</div>
</body>
</html>