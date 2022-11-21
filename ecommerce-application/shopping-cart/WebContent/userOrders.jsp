<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.digitalvision.beans.*,com.digitalvision.dao.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Orders</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {
		response.sendRedirect("loginFirst.jsp");
	}
	%>

	<%@ include file="userHeader.jsp"%>

	<div class="products" style="background-color: #E6F9E6;">

		<table class="table table-hover">
			<thead
				style="background-color: red; color: white; font-size: 20px; font-weight: bold;">
				<tr>
					<th>Order Id</th>
					<th>Ordered By</th>
					<th>Ordered Date</th>
					<th>Total Amount</th>
					<th>Shipped Address</th>
					<th>Order Status</th>
					<th></th>
				</tr>
			</thead>
			<tbody
				style="background-color: white; font-size: 20px; font-weight: bold;">

				<%
				TransDaoImpl orderdao = new TransDaoImpl();

				List<TransactionBean> orders = new ArrayList<TransactionBean>();
				orders = orderdao.getAllTransactionByUserId(userName);

				for (TransactionBean order : orders) {
					String transId = order.getTransactionId();
					String userId = order.getUserName();
					Date time = order.getTransDateTime();
					double amount = order.getTransAmount();
					String shippingAddress = order.getShippingAddress();
					String status = order.getStatus();
				%>

				<tr>
					<td><%=transId%></td>
					<td><%=userId%></td>
					<td><%=time%></td>
					<td><%=amount%></td>
					<td><%=shippingAddress%></td>
					<td><%=status%></td>
					<td><a href="userOrders.jsp?id=<%=transId%>">View Order</a></td>

				</tr>

				<%
				}
				%>

			</tbody>
		</table>
	</div>

	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Order Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<thead
							style="background-color: red; color: white; font-size: 20px; font-weight: bold;">
							<tr>
								<th>Product Name</th>
								<th>Quantity</th>
							</tr>
						</thead>
						<tbody
							style="background-color: white; font-size: 20px; font-weight: bold;">

							<%
							String tansactionId = request.getParameter("id");
							
							if(tansactionId != null)
							{
								OrderDaoImpl orderDao = new OrderDaoImpl();

								List<OrderBean> ordersList = new ArrayList<OrderBean>();
								ordersList = orderDao.getAllOrders(tansactionId);

								for (OrderBean order : ordersList) {
									String transId = order.getTransactionId();
									String prodId = order.getProductId();
									int quantity = order.getQuantity();

									ProductDaoImpl productDao = new ProductDaoImpl();
									ProductBean product = new ProductBean();
									product = productDao.getProductDetails(prodId);
									String productName = product.getProdName();
								%>

								<tr>
									<td><%=productName%></td>
									<td><%=quantity%></td>

								</tr>

								<%
								}
							}
							
							%>

						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer.html"%>

	<script type="text/javascript">
		$(window).on('load', function() {
			var url = new URL(window.location.href);
			var id = url.searchParams.get("id");
			if (id != null) {
				$('#staticBackdrop').modal('show');
				console.log(c);
			}

		});
	</script>

</body>
</html>