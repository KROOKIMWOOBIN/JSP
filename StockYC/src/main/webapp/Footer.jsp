<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
        // JavaScript function to scroll to the top
        function scrollToTop() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'  // Use smooth scrolling
            });
        }
</script>
</head>
<body>
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 mt-5 border-top bg-dark">
    <div class="col-md-4 ms-2 d-flex align-items-center">
    	<span class="mb-1 mb-lg-0 ms-3 me-lg-1 text-white">Stock Web Project</span>
    </div>
    <a href="javascript:void(0);" onclick="scrollToTop();" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none ms-2 ms-lg-5 me-3">
        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
  			<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707z"/>
		</svg>
    </a>
  </footer>
</body>
</html>