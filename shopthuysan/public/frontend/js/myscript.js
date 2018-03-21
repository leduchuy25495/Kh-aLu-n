$(document).ready(function () {
	$(".updatecart").click(function () {
		var rowid = $(this).attr('id');
		var qty = parseInt($("input[name=qty]").val());
		var slt = parseInt($("input[name=slt]").val());
		var token = $("input[name='_token']").val();
		console.log(qty,slt);
		if (qty > slt) {
			alert("Vượt quá số lượng tồn kho : ("+ slt +")");
			window.close();
		} else {
			$.ajax({
				url: 'cap-nhat-san-pham/' + rowid + '/' + qty,
				type: 'GET',
				cache: false,
				data: {
					"_token": token,
					"id": rowid,
					"qty": qty
				},
				success: function (data) {
					if (data == "oke") {
						window.location = "gio-hang";
					} else {
						alert("Error!");
					}
				}
			});
		}
	});
});