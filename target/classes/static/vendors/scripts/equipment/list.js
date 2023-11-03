$('.category-update-btn').click(function(){
	var check = confirm('수정 하시겠습니까?')
	
	if(check){
		let categoryToUpdate = $(this).parent().prev().children().val();
		let codeToUpdate = Number($(this).parent().prev().prev().attr('value'));
		
		if(categoryToUpdate.length != 0){
			$.ajax({
			  	type : 'post',
			    url : '/equipment/codeUpdate',
			    async: false,
			    data : {
					codeName : categoryToUpdate,
					codeCd : codeToUpdate
				},
			    success : function(result) {
			    	window.location.replace(result)
				}
	 		})
		}else{
			alert('변경할 항목의 이름을 작성해주세요.')
		}
	}
});

$('.category-insert-btn').click(function(){
	var check = confirm('등록 하시겠습니까?')
	
	if(check){
		let categoryToInsert = $(this).parent().prev().children().val();
		
		if(categoryToInsert.length != 0){
			$.ajax({
			  	type : 'post',
			    url : '/equipment/codeInsert',
			    async: false,
			    data : {
					codeName : categoryToInsert
				},
			    success : function(result) {
			    	window.location.replace(result)
				}
	 		})
		}else{
			alert('등록할 항목의 이름을 작성해주세요.');
		}
	}
});

$('.category-delete-btn').click(function(){
	var check = confirm('삭제 하시겠습니까?')
	
	if(check){
		let categoryToDelete = $(this).parent().prev().children().val();
		let codeToDelete = Number($(this).parent().prev().prev().attr('value'));
		
	    $.ajax({
		  	type : 'post',
		    url : '/equipment/codeDelete',
		    async: false,
		    data : {
				codeName : categoryToDelete,
				codeCd : codeToDelete
			},
		    success : function(result) {
				if(result == 1){
					alert('삭제 되었습니다')
		    		location.reload();
				}else{
					alert('해당 카테고리에 해당하는 비품이 있기 때문에 삭제할 수 없습니다.')
				}
			}
	 	})
	}
});

$('.category-filter-btn').click(function(){
	let categorySelected = $(this).val();

	window.location.replace('/equipment/list?codeName='+categorySelected)
});

$('.equipment-insert-btn').click(function(){
	var check = confirm('등록 하시겠습니까?')
	
	if(check){
		let categoryToEquipmentInsert = $(this).parent().parent().prev().prev().children().next().children().val();
		let serialNum = $(this).parent().parent().prev().prev().prev().children().next().children().val();
		let pDate = $(this).parent().parent().prev().children().next().children().val();
		
		let check1 = false;
		let check2 = false;
		let check3 = false;
		
		if(categoryToEquipmentInsert != 'choose category'){
			check1 = true;
		}
		if(serialNum.length != 0){
			check2 = true;
		}
		if(pDate.length != 0){
			var now = new Date();
			let daten = Date.parse(pDate)
			if(daten < now){
				check3 = true;
			}	
		}
		if(check1 && check2 && check3){
			$.ajax({
		  	type : 'post',
		    url : '/equipment/insert',
		    async: false,
		    data : {
				codeName : categoryToEquipmentInsert,
				equSnum : serialNum,
				date : pDate
			},
		    success : function(result) {
		    	// window.location.replace(result)
			    	console.log(result)
			    	location.reload();
			}
	 		})
		}else{
			alert('모든 항목은 필수 항목 입니다. 혹은 등록하신 날짜가 현재 시간 이전이 맞는지 확인해주세요.')
		}
	}
	
});
