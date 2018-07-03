<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Product Management</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, user-scalable=no">	
	<title>Product Management</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" language="javascript" src=" https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script>
		$(document).ready(function() {
			//$("#mainContent").load("/jsp/login.jsp");
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
	</style>
</head>
<body class="container">	
	<div id="mainContent">
		<jsp:include page="/WEB-INF/jsp/login.jsp"></jsp:include>
	</div>
</body>
</html>