<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
<body>
    제목:<input type="text" id="title" placeholder="제목을 적어주세요">
    <div id="showEmail"></div>
    <textarea id="summernote" name="editordata"></textarea>
    <input type="button" value="제출" onclick="insertArticle()">
   
<script>
var requestUrl;
var result;

$(document).ready(function() {
  $('#summernote').summernote();
});
$('#summernote').summernote({
				height: 300,                 // 에디터 높이
				minHeight: null,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				lang: "ko-KR",					// 한글 설정
				placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
				callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
                        for (var i = files.length - 1; i >= 0; i--) {
                            uploadSummernoteImageFile(files[i],this);
            		    }
					},
					onPaste: function (e) {
						var clipboardData = e.originalEvent.clipboardData;
						if (clipboardData && clipboardData.items && clipboardData.items.length) {
							var item = clipboardData.items[0];
							if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
								e.preventDefault();
							}
						}
					}
				}
	});
    function uploadSummernoteImageFile(file, editor) {
        requestUrl='saveimage.jsp';
		var data = new FormData();
		data.append("file", file);
         $.ajax({
            data : data,
            type : "POST",
            url : requestUrl,
            contentType : false,
            processData : false,
            async: false,
            xhrFields: {withCredentials: true},
            success : function(response) {
            	console.log(response.url+' 젤위'+response.test)
                $(editor).summernote('insertImage', response.url,response.filename);
            }
        });
      
	}
   
    </script>
</body>
</html>