function doInsert() {
	let title=document.getElementById('title').value.length;
	let text=document.getElementById('summernote').value.length;
	console.log(text.length);
	if(title>0&&text>0){
		document.getElementById('article-form').submit();
	}else if(title<=0){
		alert('제목이 공백입니다');
	}else if(text<=0){
		alert('내용이 공백입니다');
	}
	
}
function doInsertComent() {
	let coment=document.getElementById('note-create').value.length;
	if(coment>0){
		document.getElementsByClassName('note-create-form')[0].submit();
	}else{
		alert('입력한 댓글이 없습니다');
	}
}
