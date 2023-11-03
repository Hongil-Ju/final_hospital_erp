$('.surgery-update-btn').click(function(){
	var result = confirm('수정 하시겠습니까?')
	
	if(result){
		let emptyCheck = $(this).parent().prev().children().next().val()
		let surgeryToUpdate = Number($(this).parent().prev().children().next().val());
		let check = surgeryToUpdate + 1;
		let codeToUpdate = Number($(this).parent().prev().children().val());
		
		if(emptyCheck.length != 0){
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
			    	if(result == 1){
						alert('수정 되었습니다.')
						location.reload();
					}
					alert('수술실 호수는 중복될 수 없습니다.')
				}
		 		})
			}
		}else{
			alert('수정할 수술실 호수를 입력해주세요.');
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
		let emptyCheck = $(this).parent().prev().children().val()
		let surgeryToInsert = Number($(this).parent().prev().children().val());
		let check = surgeryToInsert + 1;
		
		if(emptyCheck.length != 0){
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
						if(result == 1){
							alert('등록 되었습니다.')
							location.reload();
						}
				    	alert('수술실 호수는 중복될 수 없습니다.')
					}
		 		})
			}
		}else{
			alert('등록할 수술실 호수를 입력해주세요.');
		}
	}
});