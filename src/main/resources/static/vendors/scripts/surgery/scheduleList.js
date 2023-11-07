$('.surgery-schedule-delete-btn').click(function(){
	var check = confirm('해딩 수술실 예약을 취소 하시겠습니까?')
	
	if(check){
		let schCd = $(this).parent().parent().attr('value');
	
		$.ajax({
		  	type : 'post',
		    url : '/surgery/scheduleDelete',
		    async: false,
		    data : {
				schCd : schCd,
			},
		    success : function(result) {
		    	console.log(result)
		    	location.reload();
			}
	 	})
	}
})

$('.surgery-schedule-update-btn').click(function(){
	var check = confirm('해당 수술실 예약 수정 페이지로 이동 하시겠습니까?')
	
	if(check){
		let schCd = $(this).parent().parent().attr('value');

		$.ajax({
		  	type : 'post',
		    url : '/surgery/scheduleUpdate',
		    async: false,
		    data : {
				schCd : schCd,
			},
		    success : function(result) {
		    	console.log(result);
			}
	 	})
	}
})