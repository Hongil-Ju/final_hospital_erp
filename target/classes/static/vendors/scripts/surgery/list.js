$('.surgery-update-btn').click(function(){
	var result = confirm('수정 하시겠습니까?')
	
	if(result){
		let surgeryToUpdate = Number($(this).parent().prev().children().next().val());
		let check = surgeryToUpdate + 1;
		let codeToUpdate = Number($(this).parent().prev().children().val());
		
		if(isNaN(check)){
			alert('수술실 호수는 숫자만 등록 가능합니다.')
		}else{
			$.ajax({
		  	type : 'post',
		    url : '/surgery/update',
		    async: false,
		    data : {
				surNum : surgeryToUpdate,
				surCd : codeToUpdate
			},
		    success : function(result) {
		    	window.location.replace(result)
			}
	 		})
		}
	}
});

$('.surgery-delete-btn').click(function(){
	var result = confirm('삭제 하시겠습니까?')
	
	if(result){
		let surgeryToDelete = Number($(this).parent().prev().children().next().val());
		let codeToDelete = Number($(this).parent().prev().children().val());
		
		$.ajax({
		  	type : 'post',
		    url : '/surgery/delete',
		    async: false,
		    data : {
				surNum : surgeryToDelete,
				surCd : codeToDelete
			},
		    success : function(result) {
		    	window.location.replace(result)
			}
	 	})
	}
});

$('.surgery-insert-btn').click(function(){
	var result = confirm('등록 하시겠습니까?')
	
	if(result){
		let surgeryToInsert = Number($(this).parent().prev().children().val());
		let check = surgeryToInsert + 1;
		
		if(isNaN(check)){
			alert('수술실 호수는 숫자만 등록 가능합니다.')
		}else{
				$.ajax({
		  	type : 'post',
		    url : '/surgery/insert',
		    async: false,
		    data : {
				surNum : surgeryToInsert
			},
		    success : function(result) {
		    	window.location.replace(result)
			}
	 	})
	}
	}
});