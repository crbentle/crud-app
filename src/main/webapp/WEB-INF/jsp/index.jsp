<!DOCTYPE html>
<html lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Aquent coding challenge</title>
	</head>
	
	<body>
		<div class="container">
			<jsp:include page="header.jsp"></jsp:include>
			
			<div class="col-sm-9">
				<h1>Aquent developer candidate project</h1>
				<p>Please use the menu bar to access the different pieces of the application.</p>
				
				<div class="panel panel-primary">
					<div class="panel-heading"><b>Requirements</b></div>
					<div class="panel-body">
				  
						<h3>Story #1</h3>
						<hr />
						<p>Add ability to manage clients (companies):</p>
						<ul>
							<li>The user should be able to create, edit, delete and list Clients.</li>
							<li>Clients should have a company name, website URI, phone number, and physical/mailing address.</li>
							<li>Clients can have zero, one, or multiple associated contacts.</li>
							<li>When editing a person, the user should be able to choose the associated client.</li>
							<li>When viewing a person, the associated client should be shown.</li>
							<li>When viewing a client, the associated contacts should be shown.</li>
							<li>When editing a client, the user should be able to add or remove associated contacts.</li>
						</ul>
						
						<h3>Story #2</h3>
						<hr />
						<p>Add client­side styling and validation:</p>
						<ul>
							<li>Using jQuery and your preferred javascript validation technique, prevent the submission on invalid data on the edit forms and inform the user of errors. The validations implemented on the front­end should be equivalent to the existing server side validation.</li>
							<li>Add standard styling to the pages using a modern CSS3/HTML5 framework like Twitter Bootstrap or Foundation (or similar).</li>
						</ul>
					</div>
				</div>
				
				<div class="panel panel-info">
					<div class="panel-heading"><b>Additional features</b></div>
					<div class="panel-body">
						<p>The following additional features were added:</p>
						<ul>
							<li>Confirmation dialog and AJAX delete when deleting a client or person instead of a separate confirmation page.</li>
							<li>Searchable contacts table on the Client edit page to make selecting a contact easier if the user list becomes very long.</li>
							<li>Confirmation dialog before removing contact association away from an existing Client on Client edit page.</li>
							<li>AJAX add/remove contact calls.</li>
							<li>Searchable Select list of Clients when creating or editing a person.</li>
							
						</ul>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="footer.jsp"></jsp:include>

	</body>
</html>