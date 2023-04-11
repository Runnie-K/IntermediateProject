<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
	<!-- Add Bootstrap CSS -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- Add jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Add Bootstrap JS -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<div class="container">
		<h1>유저 네임의 장바구니</h1>
		<table class="table table-striped">
			<!--... existing table header and rows ...-->
			<tr>
				<th>상품명</th>
				<th>상품 가격</th>
				<th>상품 수량</th>
				<th>상품 총 가격</th>
				<th></th>
			</tr>
			<tr>
				<td><img src="http://image.nongshim.com/brand/info/1529458216978.jpg" alt="Product 1" width="50">
					새우깡</td>
				<td>₩2000</td>
				<td><input type="number" class="form-control" min="1" value="2"></td>
				<td class="total">₩1000</td>
				<td><button class="btn btn-danger"
						onclick="deleteProduct(this)">삭제</button></td>
			</tr>
			<tr>
				<td><img src="https://i.namu.wiki/i/CBGSquuDpVOV2g6_E-mNvNsuX3OGWu9fcVAYJ3bw0v1VXVYpAJ9eaJC8pX8s3LISXu-rteBuftUfNBEprAWJgVsVV08DbW89URas8KKHLkMEv_jH5aNcZ0iVKP9ZGdbrOTQpA74fJkuwpo-LYk1CNA.webp" alt="Product 1" width="50">
					감자깡</td>
				<td>₩1500</td>
				<td><input type="number" class="form-control" min="1" value="2"></td>
				<td class="total">₩1000</td>
				<td><button class="btn btn-danger"
						onclick="deleteProduct(this)">삭제</button></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>총 가격</td>
				<td class="total" id="totalPrice">1,000</td>
			</tr>
			<!--... other product rows ...-->
		</table>
		<div class="row">
		<div class="col-11"></div>
		<button class="btn btn-success" id="buyButton" sytle="text-align: right;">구매</button>
</div>
<br/>
	</div>
	</section>

	<script>
	function deleteProduct(button) {
		  var row = $(button).closest("tr");
		  row.remove();
		  updateTotalPrice();
		}

		$("input[type='number']").on("change", function() {
			updateTotalPrice($(this));
		});

		function updateTotalPrice(input) {
			var row = input.closest("tr");
			var price = parseFloat(row.find("td:nth-child(2)").text().substring(1));
			var quantity = parseInt(input.val());
			var total = price * quantity;
			row.find("td.total").text("₩" + total.toFixed(0));
			updateGrandTotal();
		}

		function updateGrandTotal() {
			var grandTotal = 0;

			$("td.total").each(function() {
				var rowTotal = parseFloat($(this).text().substring(1));
				grandTotal += rowTotal;
			});

			$(".total").last().text("₩" + grandTotal.toFixed(0));
		}

		$("#buyButton").on("click", function() {
			window.location.href = "payment.html"; // Replace "payment.html" with the URL of your payment screen
		});

		function updateTotalPrice() {
			  let totalPrice = 0;

			  // Loop through all product rows
			  $("table tr").each(function() {
			    let priceCell = $(this).find("td:nth-child(2)");
			    let quantityInput = $(this).find("td:nth-child(3) input");
			    let price = parseFloat(priceCell.text().substring(1)); // Remove the ₩ sign and parse to float
			    let quantity = parseInt(quantityInput.val());

			    if (!isNaN(price) && !isNaN(quantity)) {
			      totalPrice += price * quantity;
			    }
			  });

			  // Set the total price to 0 if it is negative
			  if (totalPrice < 0) {
			    totalPrice = 0;
			  }

			  // Update the total price cell
			  $("#totalPrice").text("₩" + totalPrice.toFixed(0));
			}


		// Call updateTotalPrice when the page loads
		$(document).ready(function() {
			updateTotalPrice();
		});

		// Call updateTotalPrice when any quantity input is changed
		$("table input[type='number']").on("change", function() {
			updateTotalPrice();
		});
		
		function calculateTotal(row) {
			  var price = parseFloat(row.querySelector('td:nth-child(2)').textContent.replace('₩',''));
			  var quantity = parseInt(row.querySelector('td:nth-child(3) input').value);
			  var total = price * quantity;
			  row.querySelector('td.total').textContent = '₩' + total.toFixed(2);
			}

			var rows = document.querySelectorAll('tr');
			for (var i = 1; i < rows.length; i++) {
			  calculateTotal(rows[i]);
			  rows[i].querySelector('td:nth-child(3) input').addEventListener('change', function() {
			    calculateTotal(this.parentNode.parentNode);
			  });
			}

	</script>

</body>


