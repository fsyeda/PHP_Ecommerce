<?php
		foreach($orders as $order)
		{
?>
		<tr>
			<td><a href="dashboard/user/<?= $order['user_id'] ?>"><?= $order['id'] ?> </a></td>
			<td><?= $order['first_name'] ; ?> </td>
			<td><?= $order['created_at'] ; ?> </td>
			<td><?= $order['user_address'] ; ?> </td>
			<td><?= $order['total_row'] ; ?> </td>
			<td><?= $order['status'] ; ?> </td>
			<td>		
			<form action="/dashboard/change_status/" method="post" class="status-change">
			<input type="hidden" name="order_id" class="order">	
			<input type="hidden" name="user_id" class="user" >
				<select class="form-control" name="status-change" id="status">
    					<option value="">Please select</option>
  						<option value="order-in-process">order in process</option>
  						<option value="shipped">shipped</option>
  						<option value="cancelled">cancelled</option>
				</select>
			</form>
			</td>
		</tr>
<?php
		}	
?>