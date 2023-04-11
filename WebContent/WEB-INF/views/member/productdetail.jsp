<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <body>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/css/style.css" type="text/css">
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large" src="img/product/details/product-details-1.jpg" alt="">
                        </div>
                        <div class="product__details__pic__slider owl-carousel owl-loaded owl-drag">
                            
                            
                            
       
   <div class="owl-stage-outer"><div class="owl-stage" 
   style="transform: translate3d(-350px, 0px, 0px); transition: all 1.2s ease 0s;
    width: 1050px;"><div class="owl-item cloned" style="width: 67.5px; 
    margin-right: 20px;">
    <div class="img">
    
    <div class="manPicture" data-id="${product.product_code }"></div>
    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${product.product_name }</h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                        </div>
                        <div class="product__details__price">${product.product_price }</div>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty"><span class="dec qtybtn">-</span>
                                    <input type="text" value="1">
                                <span class="inc qtybtn">+</span></div>
                            </div>
                        </div>
                        <a href="#" class="primary-btn">ADD TO CARD</a>
                        <ul>
                      
                        <li><b>수령방법</b> <samp>직접방문</samp></li>
                  <li><b>Shipping</b> <span>01 day shipping. <samp>Free pickup today</samp></span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Description</a>
                            </li>
                            
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                               <p>${product.product_detail }</p>
                                </div>
                            </div>
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery.nice-select.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/js/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/js/mixitup.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/js/main.js"></script>
    </body>