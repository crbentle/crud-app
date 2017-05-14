<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Create Client</title>
    </head>
    <body>
		<div class="container">
			<jsp:include page="../header.jsp"></jsp:include>
			<h1 class="text-center">Create Client</h1>

			<c:if test="${fn:length(errors) gt 0}">
            	<p>Please correct the following errors in your submission:</p>
            	<ul>
                	<c:forEach items="${errors}" var="error">
                    	<li>${error}</li>
                	</c:forEach>
            	</ul>
        	</c:if>
        
        	<form class="form-horizontal" name="create" action="${pageContext.request.contextPath}/client/create" method="POST">
				<div class="form-group">
		  			<label class="control-label col-sm-3" for="companyName">Company Name:</label>
		     		<div class="col-sm-6">
		     			<input type="text" class="form-control" name="companyName" value="${client.companyName}">
					</div>
				</div>
			
				<div class="form-group">
	            	<label class="control-label col-sm-3"  for="website">Website:</label>
	            	<div class="col-sm-6">
	            		<input type="text" class="form-control" name="website" value="${client.website}"/>
	            	</div>
	            </div>
				
				<div class="form-group">
	            	<label class="control-label col-sm-3" for="phone">Phone number:</label>
	            	<div class="col-sm-6">
	            		<input type="text" class="form-control" name="phone" value="${client.phone}"/>
	            	</div>
	            </div>
				
				<div class="form-group">
	            	<label class="control-label col-sm-3" for="streetAddress">Street Address:</label>
	            	<div class="col-sm-6">
	            		<input type="text" class="form-control" name="streetAddress" value="${client.streetAddress}"/>
	            	</div>
	            </div>
				
				<div class="form-group">
	            	<label class="control-label col-sm-3" for="city">City:</label>
	            	<div class="col-sm-6">
	            		<input type="text" class="form-control" name="city" value="${client.city}"/>
	            	</div>
	            </div>
				
				<div class="form-group">
	            	<label class="control-label col-sm-3" for="state">State:</label>
	            	<div class="col-sm-6">
	            		<input type="text" class="form-control" name="state" value="${client.state}"/>
	            	</div>
	            </div>
				
				<div class="form-group">
	            	<label class="control-label col-sm-3" for="zipCode">Zip Code:</label>
	            	<div class="col-sm-6">
	            		<input type="text" class="form-control" name="zipCode" value="${client.zipCode}"/>
	            	</div>
	            </div>
	            
	            <div class="row">
	    			<div class="col-sm-9">
	        			<div class="text-right">
	            			<input type="submit" class="btn btn-primary" name="Submit" value="Submit"/>
	        			</div>
	    			</div>
				</div>
        	</form>
        
			<jsp:include page="../footer.jsp"></jsp:include>
			<!-- jquery-validate -->
			<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
			<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
		</div>
		
		<script>
			$(function() {
				// Initialize form validation on the create form.
				$("form[name='create']").validate({
					errorClass : "text-danger",
				  // Specify validation rules
				  rules: {
				    // The key name on the left side is the name attribute
				    // of an input field. Validation rules are defined
				    // on the right side
				    companyName: {
				    	required: true,
				    	maxlength: 50
				    },
				    website: {
				    	required: true,
				        url: true,
				    	maxlength: 50
				    },
				    phone: {
				    	required: true,
						phoneUS: true
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
					companyName: "Company name is required with maximum length of 50",
					website: "Website is required with maximum length of 50",
					phone: "Valid phone number is required",
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
