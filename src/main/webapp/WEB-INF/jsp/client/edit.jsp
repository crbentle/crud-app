<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Client</title>
		<!-- Bootstrap dataTables integration -->
		<script src="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css"></script>
    </head>
    <body>
    	<div class="container">
			<jsp:include page="../header.jsp"></jsp:include>
			
			<h1 class="text-center">Edit Client</h1>
			
			<c:if test="${fn:length(errors) gt 0}">
            	<p>Please correct the following errors in your submission:</p>
            	<ul>
               		<c:forEach items="${errors}" var="error">
                   		<li>${error}</li>
               		</c:forEach>
            	</ul>
        	</c:if>
        
        	<form name="edit" class="form-horizontal" action="${pageContext.request.contextPath}/client/edit" method="POST">
            	<input type="hidden" name="clientId" value="${client.clientId}"/>
  
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
        	
        	<p>&nbsp;</p>
        	<p>&nbsp;</p>
        
        	<c:if test="${fn:length(client.contacts) gt 0 or fn:length(unassociated) gt 0}">
				<div class="col-sm-1"></div>
				<div class="col-sm-9">
            		<div class="panel panel-info">
               			<div class="panel-heading">
      						<h3 class="panel-title text-center">Add or remove contacts</h3>
   						</div>
   						<div class="panel-body">
        					<table id="contacts-table" class="table table-bordered table-hover table-condensed" cellspacing="0" width="100%">
						        <thead>
						            <tr>
						                <th>Name</th>
						                <th class="text-center">Action</th>
						            </tr>
						        </thead>
						        <tbody>
						        	<c:if test="${fn:length(client.contacts) gt 0}">
						        		<c:forEach items="${client.contacts}" var="contact">
						        			<tr class="success">
						        				<td>${contact.firstName} ${contact.lastName}</td>
						        				<td align="center" class="col-sm-2">
						        					<a class="associate btn btn-xs btn-danger btn-block" href="${pageContext.request.contextPath}/person/associate/${contact.personId}/${client.clientId}/delete">
						        						Remove
						        					</a>
						        				</td>
						        			</tr>
						        		</c:forEach>
						        	</c:if>
						        
							        <c:if test="${fn:length(unassociated) gt 0}">
							        	<c:forEach items="${unassociated}" var="contact">
							        		<tr>
							        			<td class="contact">${contact.firstName} ${contact.lastName} ${contact.companyName ne null ? '('.concat(contact.companyName).concat(')') : ''}</td>
							        			<td align="center" class="col-sm-2">
							        				<a class="associate btn btn-xs btn-success btn-block" href="${pageContext.request.contextPath}/person/associate/${contact.personId}/${client.clientId}/add">
							        					Add
							        				</a>
							        			</td>
							        		</tr>
							        	</c:forEach>
							        </c:if>
						        </tbody>
        					</table>
        				</div><!-- .panel-body -->
        			</div><!-- .panel panel-info -->
        		</div><!-- .col-sm-9 -->
			</c:if>
        
			<jsp:include page="../footer.jsp"></jsp:include>

			<!-- DataTables js -->
			<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
			<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/js/bootstrap-dialog.min.js"></script>
			
			<!-- jquery-validate -->
			<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
			<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>

		</div><!-- .container -->
        
        <script>
		    $(function() {
		    	// initialize DataTable
		    	$('#contacts-table').DataTable( {
		            "paging":   false,
		            "ordering": false,
		            "info":     false,
		            "scrollY":	"200px",
		            "scrollCollapse": true,
		            "dom": '<"top"<"text-right"f>>rt<"clear">'
		        } );
		    	
		    	// Add onClick to .associate links
		        $(".associate").click( function( event ) {
		        	event.preventDefault();
		        	var link = $(this);
		        	// If we are adding the contact, warn if they already belong to another Client
		        	if( link.attr('href').match("/add$") ) {
		            	var contactName = link.parent().siblings(".contact").text();
		            	var existingCompany = contactName.match(/\((.*)\)/);
		            	if( existingCompany != null ){
		            		contactName = contactName.substring( 0, contactName.indexOf("(") );
		                	BootstrapDialog.confirm({
		                        title: 'WARNING',
		                        message: 'This will remove '+ contactName +' from ' + existingCompany[1] + '. Are you sure?',
		                        type: BootstrapDialog.TYPE_WARNING, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
		                        closable: true, // <-- Default value is false
		                        btnOKLabel: 'OK', // <-- Default value is 'OK',
		                        btnOKClass: 'btn-success', // <-- If you didn't specify it, dialog type will be used,
		                        callback: function(result) {
		                            // result will be true if button was click, while it will be false if users close the dialog directly.
		                            if(result) {
		                            	// Remove the old company from the contact name
		                            	link.parent().siblings(".contact").text( contactName );
		                            	// Do post
		                            	doAssociatePost( link );
		                            }else {
		                                // Do nothing
		                            }
		                        }
		                    });
		            	} else {
		            		// No previous company association. Add without warning.
		            		doAssociatePost( link );
		            	}
		        	} else {
		        		// Do 'remove' post
		        		doAssociatePost( link );
		        	}
		        });


				// Initialize form validation on the create form.
				$("form[name='edit']").validate({
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
		    
		    /*
		     * Submit a post request to add or remove a person association
		     */
		    function doAssociatePost( link ) {
		    	var href = link.attr("href");
		    	$.post( href )
					.done(function() {
						var href = link.attr("href");
						var text;
						if( href.match("/add$") ) {
							href = href.replace("add", "delete");
							text = "Remove";
						} else {
							href = href.replace("delete", "add");
							text = "Add";
						}
						
						link.attr("href", href);
						link.toggleClass("btn-danger btn-success");
						link.parents("tr").toggleClass("success");
						link.text(text);
					})
					.fail(function() {
						alert( "error" );
					});
			}
		</script>
	</body>
</html>
