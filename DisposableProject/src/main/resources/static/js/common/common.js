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
	},findAddress: function(input,latitude,longitude) {
		new daum.Postcode({
        oncomplete: function(data) {
            Promise.resolve(data).then(o => {
            	input.val(data.address)
                const { address } = data;

                return new Promise((resolve, reject) => {
                    const geocoder = new daum.maps.services.Geocoder();

                    geocoder.addressSearch(address, (result, status) =>{
                        if(status === daum.maps.services.Status.OK){
                            const { x, y } = result[0];

                            resolve({ lat: y, lon: x })
                        }else{
                            reject();
                        }
                    });
                })
            }).then(result => {
              latitude.val(result.lat)
              longitude.val(result.lon)
            });
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