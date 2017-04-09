<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write Review</title>
</head>
<body>
<div class="container">
  <h2>Write Review</h2>
 <form method="post" action="/coe/product/${product.pid}/commentadded" commandName="comment" class="form-horizontal">
	<div class="form-group">
      <label class="control-label col-sm-2" for="pLevel">Product Customer Satisfaction :</label>
	   <div class="col-sm-10">
	   <input type="text" class="form-control" id="comment" path="pLevel" name="pLevel"/>
		 </div>
        </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="sLevel">Service Satisfaction:</label>
	   <div class="col-sm-10">
	   	   <input type="text" class="form-control" id="sLevel" path="sLevel" name="sLevel" />
		 </div>
        </div>
        <!-- <div class="form-group">
				<label class="control-label col-sm-2" for="time">Date:</label>
				<div class="col-sm-10">
					<input type="date" class="form-control" id="time"
						name="time" path="time" />
				</div>
			</div> -->
         <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-info">Submit</button> 
      </div>
    </div>

   </form>
</div>

</body>
</html>