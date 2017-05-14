<%-- 
    Document   : edit
    Created on : Apr 22, 2011, 3:04:46 PM
    Author     : FMilens
--%>

<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Person</title>
    </head>
    <body>
    	<div class="container">
			<jsp:include page="../header.jsp"></jsp:include>
  
        	<h1 class="text-center">Edit Person</h1>
        
        	<c:if test="${fn:length(errors) gt 0}">
            	<p>Please correct the following errors in your submission:</p>
            	<ul>
                	<c:forEach items="${errors}" var="error">
                    	<li>${error}</li>
                	</c:forEach>
            	</ul>
        	</c:if>

	        <form class="form-horizontal" name="edit" action="${pageContext.request.contextPath}/person/edit" method="POST">
	            <input type="hidden" name="personId" value="${person.personId}"/>
				<div class="form-group">
			  		<label class="control-label col-sm-3" for="firstName">First Name:</label>
			     	<div class="col-sm-6">
			     		<input type="text" class="form-control" name="firstName" value="${person.firstName}">
					</div>
				</div>
				
				<div class="form-group">
			  		<label class="control-label col-sm-3" for="lastName">Last Name:</label>
			     	<div class="col-sm-6">
			     		<input type="text" class="form-control" name="lastName" value="${person.lastName}">
					</div>
				</div>
				
				<div class="form-group">
			  		<label class="control-label col-sm-3" for="emailAddress">Email Address:</label>
			     	<div class="col-sm-6">
			     		<input type="text" class="form-control" name="emailAddress" value="${person.emailAddress}">
					</div>
				</div>
				
				<div class="form-group">
			  		<label class="control-label col-sm-3" for="streetAddress">Street Address:</label>
			     	<div class="col-sm-6">
			     		<input type="text" class="form-control" name="streetAddress" value="${person.streetAddress}">
					</div>
				</div>
				
				<div class="form-group">
			  		<label class="control-label col-sm-3" for="city">City:</label>
			     	<div class="col-sm-6">
			     		<input type="text" class="form-control" name="city" value="${person.city}">
					</div>
				</div>
				
				<div class="form-group">
			  		<label class="control-label col-sm-3" for="state">State:</label>
			     	<div class="col-sm-6">
			     		<input type="text" class="form-control" name="state" value="${person.state}">
					</div>
				</div>
				
				<div class="form-group">
			  		<label class="control-label col-sm-3" for="zipCode">Zip Code:</label>
			     	<div class="col-sm-6">
			     		<input type="text" class="form-control" name="zipCode" value="${person.zipCode}">
					</div>
				</div>
				
				<c:if test="${fn:length(clients) gt 0}">
					<div class="form-group">
						<label class="control-label col-sm-3" for="clientId">Client: <small><em>(optional)</em></small></label>
						<div class="col-sm-6">
		  					<select class="form-control selectpicker" data-live-search="true" id="clientId" name="clientId" title="Choose one of the following...">
								<option value="-1">None</option>
								<c:forEach items="${clients}" var="client" varStatus="index">
									<option ${client.clientId eq person.clientId ? 'selected' : ''} value="${client.clientId}">${client.companyName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</c:if>
	            
	            <div class="row">
	    			<div class="col-sm-9">
	        			<div class="text-right">
	            			<input type="submit" class="btn btn-primary" name="Submit" value="Submit"/>
	        			</div>
	    			</div>
				</div>
	        </form>
	        
			<jsp:include page="../footer.jsp"></jsp:include>

			<!-- bootstrap-select -->
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
			<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
			
			<!-- jquery-validate -->
			<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
			<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
		</div>
		
		<script>
			$(function() {
				// Initialize form validation on the create form.
				$("form[name='edit']").validate({
					errorClass : "text-danger",
				  // Specify validation rules
				  rules: {
				    // The key name on the left side is the name attribute
				    // of an input field. Validation rules are defined
				    // on the right side
				    firstName: {
				    	required: true,
				    	maxlength: 50
				    },
				    lastName: {
				    	required: true,
				    	maxlength: 50
				    },
				    emailAddress: {
				    	required: true,
				        email: true
				    },
					streetAddress: {
				     	required: true,
				    	maxlength: 50
				    },
				    city: {
						required: true,
				    	maxlength: 50
					},
					state: {
						required: true,
						minlength: 2,
						maxlength: 2
					},
					zipCode: {
						required: true,
						minlength: 5,
						maxlength: 5
					}
				  },
				  // Specify validation error messages
				  messages: {
					firstName: "First name is required with maximum length of 50",
					lastName: "Last name is required with maximum length of 50",
					emailAddress: "Email address is required with maximum length of 50",
				    streetAddress: "Street address is required with maximum length of 50",
				    city: "City is required with maximum length of 50",
				    state: {
			            required: "State is required with length 2",
			            minlength: "State is required with length 2",
			            maxlength: "State is required with length 2"
			        },
				    zipCode: {
			            required: "Zip code is required with length 5",
			            minlength: "Zip code is required with length 5",
			            maxlength: "Zip code is required with length 5"
			        }
				  },
				  // Make sure the form is submitted to the destination defined
				  // in the "action" attribute of the form when valid
				  submitHandler: function(form) {
				    form.submit();
				  }
				});
			});
		</script>
    </body>
</html>
