<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/favicon.png" type="">

  <title> 한길식당 </title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
  <script>
  console.log("${userVO}")
	</script>
</head>

<body>

  <div class="hero_area">
    <div class="bg-box">
      <img src="images/hero-bg.jpg" alt="">
    </div>
    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.html">
            <span>
              한길식당
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  mx-auto ">
              <li class="nav-item active">
                 <a class="nav-link" href="index.jsp">Home </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="menu.jsp">Menu</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="reviewMain.jsp">Review</a>
              </li>
<%--              <c:if test="${not empty sessionScope.user12VO && sessionScope.user12VO.id == 'manager'}"> --%>
                <li class="nav-item">
                  <a class="nav-link" href="bookboard.jsp">bookBoard</a>
                </li>
<%--               </c:if> --%>
              <c:if test="${empty sessionScope.user12VO }">
               <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
              </li>
              </c:if> 
              <c:if test="${not empty sessionScope.user12VO }">
               <li class="nav-item">
                <a class="nav-link" href="logout.jsp">Logout</a>
              </li>
             
              </c:if> 
              <li class="nav-item">
                <a class="nav-link" href="register.jsp">Register</a>
              </li>
              <li class="nav-item active">
 				<a class="nav-link" href="#" onclick="checkLogin()">Book Table <span class="sr-only">(current)</span> </a>
              </li>
            </ul>
            <script>
                function checkLogin() {
                    <c:if test="${empty sessionScope.user12VO}">
                        alert('로그인이 필요합니다');
                        window.location.href = 'login.jsp';
                    </c:if>
                    <c:if test="${not empty sessionScope.user12VO}">
                        window.location.href = 'book.jsp';
                    </c:if>
                }
            </script>           
		
            <div class="user_option">
              <a href="" class="user_link">
                <i class="fa fa-user" aria-hidden="true"></i>
              </a>
              <a class="cart_link" href="#">
                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                  <g>
                    <g>
                      <path d="M345.6,33.963c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                   c29.184,0,53.248-23.552,53.248-53.248C398.336,57.515,374.784,33.963,345.6,33.963z" />
                    </g>
                  </g>
                  <g>
                    <g>
                      <path d="M345.6,338.827c-29.184,0-53.248,23.552-53.248,53.248s23.552,53.248,53.248,53.248
                   s53.248-23.552,53.248-53.248S374.784,338.827,345.6,338.827z" />
                    </g>
                  </g>
                  <g>
                    <g>
                      <path d="M439.296,84.875c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.531,84.992,10.635,61.952,10.635H20.48
                   C9.216,10.635,0,19.851,0,31.115c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                   c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                   C457.728,97.675,450.56,86.923,439.296,84.875z" />
                    </g>
                  </g>
                  <g>
                    <g>
                      <path d="M215.04,389.515c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                   c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.275,216.576,418.699,215.04,389.515z" />
                    </g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  0
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                  <g>
                  </g>
                </svg>
              </a>
              <form class="form-inline">
                <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                  <i class="fa fa-search" aria-hidden="true"></i>
                </button>
              </form>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
    <!-- slider section -->
    <section class="slider_section ">
      <div id="customCarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                      Fast Food Restaurant
                    </h1>
                    <p>
                    Welcome to 한길식당. We will always  your love with the best food and best service. Thank you.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>