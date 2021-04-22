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
	},
}