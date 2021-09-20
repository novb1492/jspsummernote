<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
</head>
<body>
<div class="main ">
<div class="sidebar sidebar-category">
    <a href="javascript://" class="sidebar-header">
        <i class="fa fa-bars sidebar-header-icon"></i>
    </a>

    <h1><div class="logo"><a href="/"><img src="/assets/images/okjsp_logo.png" alt="OKKY" title="OKKY"></a></div></h1>

    <ul id="search-google-icon" class="nav nav-sidebar nav-sidebar-search-wrapper">
        <li class="nav-sidebar-search"><a href="javascript://" class="link" id="search-google" data-toggle="popover" data-trigger="click" data-original-title="" title=""><i class="fa fa-search"></i></a></li>
    </ul>

    <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="https://www.google.com/search">
        <div class="input-group">
            <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색">
            <input type="hidden" name="q">
            <span class="input-group-btn">
                <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>
            </span>
        </div>
    </form>

    <div class="nav-user nav-sidebar">

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/126561" class="avatar-photo"><img src="https://ssl.pstatic.net/static/pwe/address/img_profile.png"></a>
</div>
            <div class="nav-user-action">
                <div class="nav-user-func">
                    <a href="javascript://" id="user-func" data-toggle="popover" data-trigger="click" tabindex="0" data-original-title="" title="">
                        <i id="user-func-icon" class="fa fa-cog"></i>
                    </a>
                </div>
                <div class="nav-user-func">
                    <a href="javascript://" id="user-notification" data-toggle="popover" data-trigger="click" tabindex="0" data-original-title="" title="">
                        <i id="user-notification-icon" class="fa fa-bell"></i>
                        <span id="user-notification-count" class="badge notification" style="display:none;">1</span>
                    </a>
                </div>
            </div>
            <form action="/logout" method="post" style="display:none;"><input type="submit" name="logoutButton" value="logoutButton" id="logoutButton"></form>

            <script id="setting-template" type="text/template">
                <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
                    <h3 class="popover-title"></h3>
                    <div class="popover-footer clearfix" id="user-func-popover">
                        <label href="" for="logoutButton" class="popover-btn"><i class="fa fa-sign-out"></i> 로그아웃</label>
                        <a href="/user/edit" class="popover-btn"><i class="fa fa-user"></i> 정보수정</a>
                    </div>
                </div>
            </script>

            <script id="notification-template" type="text/template">
                <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
                    <h3 class="popover-title"></h3>
                    <div class="popover-content" id="notification-popover"></div>
                </div>
            </script>

            <script id="search-google-template" type="text/template">
                <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
                    <h3 class="popover-title">Google 검색</h3>
                    <div class="popover-content" id="search-google-popover">
                        <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="https://www.google.com/search" onsubmit="searchMain.q.value='site:okky.kr '+searchMain.qt.value;">
                            <div class="input-group">
                                <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색" />
                                <input type="hidden" name="q" />
                                <span class="input-group-btn">
                                    <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </script>
    </div>

    <ul class="nav nav-sidebar nav-main">
    	
    		<li class="active" data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="Q&amp;A"><a href="/articles/questions" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&amp;A</span></a></li>
    		<li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="Tech"><a href="/articles/tech" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>
    		<li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="커뮤니티"><a href="/articles/community" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>
    		<li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="칼럼"><a href="/articles/columns" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>
    		<li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="Jobs"><a href="/articles/recruit?filter.jobType=CONTRACT" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>
    </ul>

    <ul class="nav nav-sidebar nav-bottom">
        <li data-toggle="tooltip" data-placement="right" data-container="body" title="" data-original-title="Github Issues"><a href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
    </ul>
</div>
<div class="sidebar-category-nav">
    <h3 class="sub-title">Q&amp;A</h3>
    <ul class="nav">
            <li><a href="/articles/questions" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                    <li><a href="/articles/tech-qna" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">Tech Q&amp;A</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
                    <li><a href="/articles/blockchain-qna" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">Blockchain Q&amp;A</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
    </ul>
    <div class="special-nav">
    </div>
</div>

<div id="article-create" class="content" role="main">
	<div class="content-header">
	    <h3>새 글 쓰기</h3>
	</div>
	
	
	<div class="panel panel-default clearfix">
	    <div class="panel-heading clearfix">

	
	

<div class="avatar clearfix avatar-medium pull-left">
		<a href="/user/info/126561" class="avatar-photo"><img src="https://ssl.pstatic.net/static/pwe/address/img_profile.png"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/126561" title="novb****">novb****</a>
					<div class="activity block"><span class="fa fa-flash"></span> 85</div>
		</div>
</div>
	   </div>
	   <div class="panel-body">
	   		<form action="/articles/tech-qna/save" method="post" id="article-form" class="article-form" role="form" onsubmit="return postForm()">
	           <fieldset class="form">
	<input type="hidden" name="_csrf" value="416b65c4-81e6-4f70-832a-72d0d0443cd8">
        <div class="form-group has-feedback">
            <div>
                <select id="category" name="categoryCode" class="form-control" required="">
                    <option value="">게시판을 선택해 주세요.</option>
                        <option value="tech-qna" selected="selected" data-external="false" data-anonymity="false">
Tech Q&amp;A                        </option>
                        <option value="blockchain-qna" data-external="false" data-anonymity="false">
Blockchain Q&amp;A                        </option>
                </select>
            </div>
        </div>

<div class="form-group has-feedback">
    <div>
    	<input type="text" name="title" required="" value="" placeholder="제목을 입력해 주세요." class="form-control" id="title">
    </div>
</div>

<div class="form-group has-feedback">
    <div>
    	<input type="text" name="tagString" value="" placeholder="Tags," class="form-control" id="tagString" style="display: none;"><div class="bootstrap-tagsinput"><span class="twitter-typeahead" style="position: relative; display: inline-block;"><input type="text" class="tt-hint" readonly="" autocomplete="off" spellcheck="false" tabindex="-1" dir="ltr" style="position: absolute; top: 0px; left: 0px; border-color: transparent; box-shadow: none; opacity: 1; background: none 0% 0% / auto repeat scroll padding-box border-box rgba(0, 0, 0, 0);"><input type="text" placeholder="Tags," class="tt-input" autocomplete="off" spellcheck="false" dir="auto" style="position: relative; vertical-align: top; background-color: transparent;"><pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre><div class="tt-menu" style="position: absolute; top: 100%; left: 0px; z-index: 100; display: none;"><div class="tt-dataset tt-dataset-0"></div></div></span></div>
    </div>
</div>

<div class="form-group has-feedback">
   		<textarea name="text" id="summernote" rows="20" class="form-control input-block-level" style="display: none;">
   		</textarea>
</div>
<input type="hidden" name="textType" value="HTML" id="textType">
	
	               <div class="nav" role="navigation">
	                   <fieldset class="buttons">
	                       <a href="/articles/tech-qna" class="btn btn-default btn-wide" onclick="return confirm('정말로 취소하시겠습니까?')">취소</a>
	                       <input type="submit" name="create" class="create btn btn-success btn-wide pull-right" action="create" value="등록" id="create">
	                    </fieldset>
	                </div>
	            </fieldset>
	        </form>
	    </div>
	</div>
</div>
                <div class="right-banner-wrapper">




	       		<div class="google-ad">
	                   <script async="" src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	                   <!-- okjspad_160x500 -->
	                   <ins class="adsbygoogle" style="display:inline-block;width:160px;height:500px" data-ad-client="ca-pub-8103607814406874" data-ad-slot="6573675943" data-adsbygoogle-status="done" data-ad-status="filled"><ins id="aswift_0_expand" tabindex="0" title="Advertisement" aria-label="Advertisement" style="border: none; height: 500px; width: 160px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: inline-table;"><ins id="aswift_0_anchor" style="border: none; height: 500px; width: 160px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: block;"><iframe id="aswift_0" name="aswift_0" style="left:0;position:absolute;top:0;border:0;width:160px;height:500px;" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="160" height="500" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-8103607814406874&amp;output=html&amp;h=500&amp;slotname=6573675943&amp;adk=4104151020&amp;adf=3198278716&amp;pi=t.ma~as.6573675943&amp;w=160&amp;lmt=1632106123&amp;psa=1&amp;format=160x500&amp;url=https%3A%2F%2Fokky.kr%2Farticles%2Ftech-qna%2Fcreate&amp;flash=0&amp;wgl=1&amp;uach=WyJXaW5kb3dzIiwiMTAuMCIsIng4NiIsIiIsIjIuMTAuMTI0LjI2IixbXSxudWxsLG51bGwsbnVsbF0.&amp;dt=1632106123099&amp;bpp=2&amp;bdt=86&amp;idt=32&amp;shv=r20210915&amp;mjsv=m202109170101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D87f0c8ac366fe46a-22ebca1cabcb0029%3AT%3D1631884643%3ART%3D1631884643%3AS%3DALNI_Mbz7xjtdDurSVEGRRSmXFgPTQ2CbA&amp;correlator=6847107982502&amp;frm=20&amp;pv=2&amp;ga_vid=1639673595.1631884643&amp;ga_sid=1632106123&amp;ga_hid=484291667&amp;ga_fc=0&amp;u_tz=540&amp;u_his=3&amp;u_java=0&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=14&amp;adx=1080&amp;ady=65&amp;biw=1870&amp;bih=935&amp;scr_x=0&amp;scr_y=0&amp;eid=42530529%2C31062525&amp;oid=3&amp;pvsid=4182733622353685&amp;pem=987&amp;ref=https%3A%2F%2Fokky.kr%2Farticle%2F1043629&amp;eae=0&amp;fc=896&amp;brdim=0%2C0%2C0%2C0%2C1920%2C0%2C1920%2C1040%2C1870%2C935&amp;vis=1&amp;rsz=%7C%7CfeE%7C&amp;abl=CF&amp;pfx=0&amp;fu=0&amp;bc=31&amp;ifi=1&amp;uci=a!1&amp;fsb=1&amp;xpc=krb1kiD2WI&amp;p=https%3A//okky.kr&amp;dtd=38" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!1" data-google-query-id="CMLPkIvFjPMCFUfRlgodaWEJlg" data-load-complete="true"></iframe></ins></ins></ins>
	                   <script>
	                        (adsbygoogle = window.adsbygoogle || []).push({});
	                   </script>
	               </div>
                </div>
<%@ include file="footer.jsp" %>
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