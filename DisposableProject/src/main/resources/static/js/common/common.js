var common = {
	serializeObject: function(formName) {
			var obj = null;
				try {
					if (formName[0].tagName && formName[0].tagName.toUpperCase() == "FORM") {
						var arr = formName.serializeArray();
						if (arr) {
							obj = {};
							jQuery.each(arr, function() {
								obj[this.name] = this.value;
							});
						}
					}
				} catch (e) {
					alert(e.message);
				} finally {
				
				}
				return obj;
	},findAddress: function(input) {
		new daum.Postcode({
			oncomplete: function(data) {
			input.val(data.address)
			}
		}).open();
	},progressOn: function(msg,progressName) {
		$("."+progressName+" h2").html(msg)
		$("."+progressName).show()
	},progressOff: function(progressName) {
		$("."+progressName).hide()
		$("."+progressName+" h2").html('')
	},format : function(price){
	if(!price) return 0;
   	 return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
	}
}