<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Principal</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-reboot.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-datepicker.standalone.css">
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<script>
$(document).ready(function () {
	$('#container .input-group.date').datepicker({
	    language: "es"
	});
	});
</script>
</head>
<body>
<div class="container" id="container">
			<form>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Email address</label>
				    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
				    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
				  </div>
				  <div class="input-group date mb-3">
					  <input type="text" class="form-control"><div class="input-group-addon">
					  <span class="input-group-text"><i class="material-icons">
						date_range
						</i></span></div>
					</div>
				  <div class="form-group">
				    <label for="exampleSelect1">Example select</label>
				    <select class="form-control" id="exampleSelect1">
				      <option>1</option>
				      <option>2</option>
				      <option>3</option>
				      <option>4</option>
				      <option>5</option>
				    </select>
				  </div>
				  <div class="form-group">
				    <label for="exampleSelect2">Example multiple select</label>
				    <select multiple class="form-control" id="exampleSelect2">
				      <option>1</option>
				      <option>2</option>
				      <option>3</option>
				      <option>4</option>
				      <option>5</option>
				    </select>
				  </div>
				  <div class="form-group">
				    <label for="exampleTextarea">Example textarea</label>
				    <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputFile">File input</label>
				    <input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
				    <small id="fileHelp" class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>
				  </div>
				  
				  <fieldset class="form-group">
				    <legend>Radio buttons</legend>
				    <div class="form-check">
				      <label class="form-check-label">
				        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="option1" checked>
				        Option one is this and that&mdash;be sure to include why it's great
				      </label>
				    </div>
				    <div class="form-check">
				    <label class="form-check-label">
				        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
				        Option two can be something else and selecting it will deselect option one
				      </label>
				    </div>
				    <div class="form-check disabled">
				    <label class="form-check-label">
				        <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios3" value="option3" disabled>
				        Option three is disabled
				      </label>
				    </div>
				  </fieldset>
				  <div class="form-check">
				    <label class="form-check-label">
				      <input type="checkbox" class="form-check-input">
				      Check me out
				    </label>
				  </div>
				  <button type="submit" class="btn btn-primary">Submit</button>
			</form>
			</div>
			<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
			<script type="text/javascript" src="resources/js/bootstrap-datepicker.min.js"></script>
			<script type="text/javascript" src="resources/js/bootstrap-datepicker.es.min.js"></script>
</body>
</html>