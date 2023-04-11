<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resources/css/shop/shop_registForm.css">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css" />
	<div class="col-lg-8" style="margin: 0 auto;">

		<!--상단 타이틀  -->
		<div class="section" id="register">
			<br>
			<br>
			<h4>상품상세 페이지</h4>
			<br>
			<br>

			<div class="mToggleBar etoggle selected card card-body">
				<form action="regist.do" method="post">
					<h4 class="eToggleTitle">상품진열</h4>

					<input type="hidden" name="shop_id" value="${product.shop_id }" />

					<!-- 본문 -->
					<div class="toggleArea " style="display: block;">
						<div class="mBoard typeProduct">
							<table border="1">

								<!-- 상품이름과 내용 나누기 -->
								<colgroup>
									<col class="product_regist_name">
									<col style="width: auto">
								</colgroup>
								<tbody>
									<tr>
										<!--판매여부  -->
										<th scope="row">판매상태</th>
										<td><input type="text" readonly
											value="${product.product_status }"></td>
									</tr>
									<tr>
										<th>상품구분</th>
										<td>
											<%-- ${product_category.category_List } --%> <select
											class="category_code" name="category_code">
												<%--  <option value="${product_category.category_code }">${product_category.category_name }</option> --%>
												<option>${product.category_name }</option>
										</select>


										</td>

									</tr>

								</tbody>
							</table>
						</div>
					</div>
			</div>
		</div>
		<!--상품등록  -->
		<div class="section" id="register">
			<div class="mToggleBar etoggle selected card card-body">
				<h4 class="eToggleTitle">상품등록정보</h4>
				<!-- 본문 -->
				<div class="toggleArea" style="display: block;">
					<div class="mBoard typeProduct">
						<table border="1">

							<!-- 상품이름과 내용 나누기 -->
							<colgroup>
								<col class="product_regist">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<tr>
									<!--상품등록  -->
									<th scope="row">상품명</th>


									<td>
										<div class="gIcoShop">
											<div class="overlapTip">

												<input type="text" name="product_name" id="product_name"
													style="width: 730px;" readonly
													value="${product.product_name }">
											</div>

										</div>
									</td>
								</tr>

								<tr>
									<!--상품등록  -->
									<th scope="row">상품 브랜드</th>


									<td>
										<div class="gIcoShop">
											<div class="overlapTip">

												<input type="text" name="product_maker" id="product_maker"
													class="product_maker" style="width: 730px;"
													value="${product_product_maker }">
											</div>
										</div>
									</td>


								</tr>

								<tr>
									<!--원산지  -->
									<th scope="row">원산지</th>

									<td>
										<div class="gIcoShop">
											<input type="text" readonly
												value="${product.product_origin }">
										</div>
									</td>


								</tr>

								<tr>
									<!--원산지  -->
									<th scope="row">보관방법</th>


									<td>
										<div class="gIcoShop">
											<input type="text" readonly value="${product.product_keep }">
										</div>
									</td>


								</tr>
								<!--상품코드  -->

								<tr>
									<!--상품상세설명  -->
									<th scope="row">상품 상세설명</th>
									<td>
										<div class="form-group">
											<textarea class="textarea" name="product_detail" id="content"
												rows="20" cols="90" value="${product.product_detail }">
</textarea>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 판매정보 -->
		<div class="section" id="register">
			<div class="mToggleBar etoggle selected card card-body">
				<div class="toggleArea" style="display: block;">
					<div class="mBoard typeProduct">
						<table border="1">
							<!--두개로  -->
							<colgroup>
								<col class="product_regist">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">판매가</th>


									<td><div class="mBoard" id="calcFormBasic"
											style="width: 500px;">
											<table border="1" summary="">
												<colgroup>
													<col style="width: 33%">
													<col style="width: 33%">
												</colgroup>

												<thead>
													<tr>
														<th scope="col">할인율</th>
														<th scope="col">판매가</th>
													</tr>
												</thead>
												<tbody class="right">
													<tr>
														<td><span id="price_discount"
															class="product_discount"></span> <input type="text"
															name="product_discount"
															value="${product.product_discount }">%</td>
														<td><span id="product_price" class="product_price"></span>
															<input type="text" name="product_price"
															value="${product.product_price }">원</td>
													</tr>
												</tbody>

											</table>
										</div></td>
								</tr>
								<tr>
									<!--주문수량제한  -->
									<th scope="row">주문수량제한</th>
									<td>
										<div class="mBoard gSmall">
											<table border="1" summary="" class="gDivision">
												<tbody>
													<tr>
														<th scope="row">최소 주문수량</th>
														<td>
															<div class="single-set-area" style="display: none;">-
																구성상품 설정이 적용됩니다.</div>
															<div>
																<input type="text"
																	style="width: 40px; ime-mode: disabled;"
																	value="${product.product_min }" name="product_min"
																	id="product_min"> 개 이상
															</div>

														</td>
													</tr>
													<tr>


														<th scope="row">최대 주문수량</th>
														<td><input type="text" readonly
															value="${product.product_max }">개</td>
													</tr>
												</tbody>
											</table>
										</div>
									</td>
								</tr>
								<!--이미지  -->
								<div class="toggleArea" style="display: block;">
									<div class="mBoard typeProduct">
										<table border="1">

											<!--두개로  -->
											<colgroup>
												<col class="product_regist">
												<col style="width: auto">
											</colgroup>
											<tbody>
												<tr>
													<!--이미지  -->
													<th scope="row">이미지</th>

													<td>
														<div class="gIcoShop">
															<div class="mForm">


																<!-- 대표 이미지와 리스트이미지 선택바 항목 -->

																<tr>
																	<!--이미지  -->
																	<th scope="row">페이지 이미지</th>

																	<td>
																		<div class="gIcoShop">

																			<!--개별 이미지등록시 드래그 통한 순서변경 파트  -->
																			<div class="mCtrl typeHeader">

																				<div class="Imagebody" style="margin: 0 auto;">
																					<div class="col-md-12" style="text-align: center;">
																						<table border="1">
																							<tbody>
																							<colgroup>
																								<col class="product_regist_name">
																								<col style="width: auto">
																							</colgroup>
																							<input type="hidden" name="picture"
																								value="noImage.jpg" />
																							<div class="input-group mb-3">
																								<div class="mailbox-attachments clearfix"
																									style="text-align: center;">
																									<div class="mailbox-attachment-icon has-img"
																										id="pictureView"
																										style="border: 1px solid green; height: 150px; width: 150px;"></div>
																									<div class="mailbox-attachment-info">
																										<div class="input-group input-group-sm"
																											style="flex-direction: column;">

																											<input id="inputFileName mt-3"
																												class="form-control" type="text"
																												name="tempPicture" disabled
																												style="width: 150px;" />


																										</div>
																									</div>
																								</div>
																							</div>

																							</tbody>
																						</table>
																					</div>
																	</td>


																</tr>

																<!-- 개별이미지 등록 -->
											</tbody>
										</table>
									</div>
								</div>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="" style="margin-left: 50%; margin-bottom: 30px;">
		<button class="btn btn-sm"
			style="background-color: red; margin-right: 20px; color: white;"
			onclick="location.href='productList.do?shop_id='" +shop.shop_id>이전으로</button>
		<input type="submit" value="수정하기"
			onclick="location.href='productupdate.do?shop_id='"
			+shop.shop_id" style="background-color: green; color: white; border-radius: 10px;">
		</form>




	</div>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/demo.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<form role="imageForm" action="picture.do" method="post"
		enctype="multipart/form-data">
		<input id="inputFile" name="pictureFile" type="file"
			class="form-control" style="display: none;" onchange="picture_go();">
		<input id="oldFile" type="hidden" name="oldPicture" value="test" /> <input
			type="hidden" name="checkUpload" value="0" />
	</form>
	<script>
	function regist_go(){
		var uploadCheck = $('input[name="checkUpload"]').val();  	
		if(uploadCheck=='0'){
		    alert("사진업로드는 필수 입니다");      
		    return;
		$('form[role="form"]').submit();    		
	}
	window.onload=function(){
		summernote_go($('#content'),'<%=request.getContextPath()%>');
	}
	}
	
</script>



	<script>
function picture_go(){
	//alert("changee file");
	var form = $('form[role="imageForm"]');
	var picture = form.find('[name=pictureFile]')[0];
	
	var fileFormat = 
		picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
	//이미지 확장자 jpg 확인
	if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
		alert("이미지는 jpg 형식만 가능합니다.");
		return;
	} 
	//이미지 파일 용량 체크
	if(picture.files[0].size>1024*1024*1){
		alert("사진 용량은 1MB 이하만 가능합니다.");
		return;
	};
	
	if (picture.files && picture.files[0]) {
		var reader = new FileReader();
		
		reader.readAsDataURL(picture.files[0]);
		 
		reader.onload = function (e) {
			var pictureView = $('div#pictureView')[0];
			//이미지 미리보기	        	
		 	pictureView.style.backgroundImage = "url("+e.target.result+")";
		 	pictureView.style.backgroundPosition="center";
		 	pictureView.style.backgroundSize="cover";
		 	pictureView.style.backgroundRepeat="no-repeat";			
		}
	}
	
	form.find('[name="checkUpload"]').val(0);
	$('#inputFileName').val(picture.files[0].name);
}

function upload_go(){
	//alert("upload btn");
	if(!$('input[name="pictureFile"]').val()){
	    alert("사진을 선택하세요.");
	    $('input[name="pictureFile"]').click();
	    return;
	 }  
	
	if($('input[name="checkUpload"]').val()==1){
		alert("이미 업로드된 사진입니다.");
		return;
	}
	
	 var formData = new FormData($('form[role="imageForm"]')[0]);
	 
	 $.ajax({
			url:"picture.do",
			data:formData,
			type:"post",
		    processData:false,
	        contentType:false,
	        success:function(data){
	        	//업로드 확인변수 세팅
	            $('input[name="checkUpload"]').val(1);
	            //저장된 파일명 저장.
	            $('input#oldFile').val(data); // 변경시 삭제될 파일명	          
	            $('form[role="form"]  input[name="picture"]').val(data);	    	  
	      	 	alert("사진이 업로드 되었습니다.");
	        },
	        error:function(error){
	        	
	        }
	 });
			
}

</script>

	<script>

#("input[name='product_max']").attr('disabled',true);

</script>



</body>





