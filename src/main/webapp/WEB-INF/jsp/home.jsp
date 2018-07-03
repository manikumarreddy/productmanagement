<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css">	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" language="javascript" src=" https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	
	<script type="text/javascript" >	
	
		$(document).ready(function() {
			var dTable=$('#productDataTable').DataTable( {
				"ajax": {
					"url": "../productManagement/products",
					"dataSrc": ""
				},
				"order": [[ 1, "asc" ]],				 
				"columns": [
					{ "data": "productId" },
					{ "data": "productName" },
					{ "data": "description" },
					{ "data": "relatedProducts" },
					{ "data": "img" }
				]
			} );
			$('#productDataTable tbody').on( 'click', 'tr', function () {
		        if ($(this).hasClass('selected') ) {
		            $(this).removeClass('selected');
		        }
		        else {
		            dTable.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected');
		        }
		    } );
			
		    $('#removeRow').click( function () {
		    	var selectedRow=$('tr.selected td');
		    	if(selectedRow.eq(0).text()!=""){
		    		$.ajax({
			    		  url: "../productManagement/delete",
			    		  method: "POST",
			    		  data: {productId:selectedRow.eq(0).text()}		    		  
			    		})
		    		  .done(function( data ) {
		    			  
		    		  });
			    	selectedRow.remove();
			    	messageHandling("success","Product removed from Product Inventory List");
		    	}else{
		    		messageHandling("error","Please select Product from product Inventory list to delete");
		    	}
		    	
		    } );
			
			$('#addRow').click(function(){
				$("#productModel").modal();
				$('form > input[type=reset]').trigger('click')
				$("#productModel form").attr("action","../productManagement/create");
				var numbers=dTable.$("td:eq(0)").text();
				var newProdId=1;
				if(numbers!=""){
					numbers=numbers.split('').map(Number);				
					newProdId=Math.max.apply(null, numbers);
					newProdId=newProdId+1;
				}
				
				$("#productId").val(newProdId);
			});
			$("#updateRow").click(function(){				
				var selectedCols=$('tr.selected td');
				if(selectedCols.length==0){					
			    	messageHandling("error","Please select Product from product Inventory list to update");
				}else{
					$("#productModel").modal();
					$('form > input[type=reset]').trigger('click')
					$("#productId").val(selectedCols.eq(0).text());
					$("#productName").val(selectedCols.eq(1).text());
					$("#productDescription").val(selectedCols.eq(2).text());
					$("#relatedProducts").val(selectedCols.eq(3).text());
					$("input[type=file]").attr("value",selectedCols.eq(4).text());
					$("#productModel form").attr("action","../productManagement/update");
				}
			});
			
			$(".submitChanges").click(function(){
				var action =$("#productModel form").attr('action');				
				$.ajax({
		    		  url: action,
		    		  method: "POST",
		    		  data: {productId:$("#productId").val(),
		    			  productName:$("#productName").val(),
		    			  description:$("#productDescription").val(),
		    			  relatedProducts:$("#relatedProducts").val(),
		    			  img:$("#productImage").val()
		    			  }
		    		})
	    		  .done(function(data) {	    		   
	    		    $("#closeModal").trigger("click");
	    		    if(action.indexOf("create")!=-1){
	    		    	 dTable.row.add(data).draw(false);
	    		    	 messageHandling("success","Product added to Product Inventory List");
	 	    		 
					}else{
						var selectedCols=$('tr.selected td');
						//selectedRow.data(data).draw();
						selectedCols.eq(0).html(data.productId);
						selectedCols.eq(1).html(data.productName);
						selectedCols.eq(2).html(data.description);
						selectedCols.eq(3).html(data.relatedProducts);
						selectedCols.eq(4).html(data.img);
						messageHandling("success","Product "+data.productName+" updated in Product Inventory List");
					}
	    		 });
			})
			
			var messageHandling=function(type,message){
				if(type=="error"){
					var cloned=$(".alert-danger").eq(0).clone().appendTo("#alertArea").removeClass("hide");
					cloned.children("span.msg").text(message);
					
				}else if(type=="success"){
					var cloned=$(".alert-success").eq(0).clone().appendTo("#alertArea").removeClass("hide");
					cloned.children("span.msg").text(message);
				}else{
					var cloned=$(".alert-warning").eq(0).clone().appendTo("#alertArea").removeClass("hide");
					cloned.children("span.msg").text(message);
				}
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
		.modal{
			top:40px;
		}
	    .form-control {
	    	height:34px !important;
	   }
	 	.table-bordered {
    		border: 1px solid #337ab7;
		}
	</style>
</head>
<body class="dt-example dt-example-bootstrap4">
	<div class="container">
	<header class="navbar navbar-expand navbar-dark flex-column flex-md-row bd-navbar">
  		<div class="col-sm-8">
  			<a align="left" class="navbar-brand" href="/" aria-label="ProductManagement">Product Management</a> 
  		</div>
  		<div class="col-sm-4"> 
    		<a align="right" class="navbar-brand" href="/">USER : ${msg}</a>
    	</div>
	</header>
	<div class="row">
   		<div class="col-sm-2"><button type="button" class="btn btn-primary" data-toggle="modal"  id="addRow">Add Product</button></div>   
		<div class="col-sm-2"><button type="button" class="btn btn-primary" data-toggle="modal" id="removeRow">Remove Product</button></div>
		<div class="col-sm-2"><button type="button" class="btn btn-primary" data-toggle="modal" id="updateRow">Update Product</button></div>
		<div class="col-sm-2"></div>
		<div class="col-sm-4" id="alertArea">
		  <div class="alert alert-success alert-dismissible hide">
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>Success!</strong>&nbsp;<span class="msg"></span> 
		  </div>
		  <div class="alert alert-warning alert-dismissible hide">
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>Warning!</strong>&nbsp;<span class="msg"></span> 
		  </div>
		  <div class="alert alert-danger alert-dismissible hide">
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>Error!</strong>&nbsp;<span class="msg"></span> 
		  </div>
		</div>
	</div>
	<table id="productDataTable" class="table table-striped table-bordered" style="width:100%">
			<thead>
				<tr>
					<th class="info">Product Id</th>
					<th class="info">Product Name</th>
					<th class="info">Product Description</th>
					<th class="info">Related Product</th>
					<th class="info">Product Image</th>
				</tr>
			</thead>
	</table>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="productModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action="/productManagement/create" method="POST">
			  <div class="form-group">
			    <label for="productName">Product Name (<span class="mandatory">*</span>)</label>
			    <input type="text" class="form-control" id="productName"  placeholder="Name of product" required>
			  </div>
			  <div class="form-group">
			    <label for="productDescription">Product description (<span class="mandatory">*</span>)</label>
			    <textarea   class="form-control" id="productDescription" placeholder="Description" required></textarea>
			  </div>
			  <div class="form-group">
			    <label for="relatedProducts">Related Products</label>
			    <input type="text" class="form-control" id="relatedProducts" placeholder="Enter related products seperated by any special character">
			  </div>
			  <div class="form-group">
			    <label for="productImage">Product image</label>
			    <input type="file" class="form-control-file" id="productImage">
			  </div>
			  <input type="hidden" class="form-control" id="productId"  value="">			  
			  <input type="reset" value="reset" class="btn btn-primary" id="resetProduct" style="display:none;"/>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeModal">Close</button>
	        <button type="submit" class="btn btn-primary submitChanges">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
