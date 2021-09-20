<%@page import="java.util.Map"%>
<%@page import="board.boardService"%>
<%@page import="board.boardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header.jsp" %>
<%
String aid=(String)request.getParameter("aid");
System.out.print(aid);
boardService boardService=new boardService();
Map<String,Object>map=boardService.selectAritcle(Integer.parseInt(aid));
boardDto boardDto=new boardDto();
String email=(String)request.getSession().getAttribute("email");
if((boolean)map.get("flag")){
	boardDto=(boardDto)map.get("dto");
}else{
%>
<script>
location.href="index.jsp";
</script>
<%}
%>
<!DOCTYPE html>
<html>
<body>
<div class="layout-container">
            <div class="main ">
<div class="sidebar sidebar-category">
    <a href="javascript://" class="sidebar-header">
        <i class="fa fa-bars sidebar-header-icon"></i>
    </a>

    <h1><div class="logo"><a href="index.jsp"><img src="/assets/images/okjsp_logo.png" alt="OKKY" title="OKKY"></a></div></h1>

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

<div id="article" class="content" role="main">



				<div class="main-banner-wrapper">
                   <div class="main-banner">
                   	  <a href="/banner/stats/401" target="n"><img src="//file.okky.kr/banner/1631264081375.png"></a>
                   </div>
                </div>
	

    <div class="nav" role="navigation">
        <a class="create btn btn-success btn-wide pull-right" href="/articles/tech-qna/create"><i class="fa fa-pencil"></i> 새 글 쓰기</a>
        <h4>Tech Q&amp;A</h4>
    </div>

	

    <div class="panel panel-default clearfix fa-">
        <div class="panel-heading clearfix">

	
	

<div class="avatar clearfix avatar-medium pull-left">
		<a href="/user/info/126561" class="avatar-photo"><img src="https://ssl.pstatic.net/static/pwe/address/img_profile.png"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/126561" title="novb****"><%=boardDto.getEmail() %></a>
					<div class="activity"><span class="fa fa-flash"></span> 85</div>
					<div class="date-created"><span class="timeago" title="2021-09-06T14:18:07"><%=boardDto.getCreated() %></span> 작성
					</div>
		</div>
</div>

            <div class="content-identity pull-right">
                <div class="content-identity-count"><i class="fa fa-eye"></i> <%=boardDto.getHit() %></div>
            </div>
        </div>
        <div class="content-container clearfix">
            <div id="content-body" class="panel-body content-body pull-left">
                <div class="content-tags">
                    <span class="list-group-item-text article-id"><%=boardDto.getId() %></span>
	<a href="/articles/tech-qna" class="list-group-item-text item-tag label label-info"><i class="fa fa-database"></i> Tech Q&amp;A</a>

                </div>
                <h2 class="panel-title">
                    <%=boardDto.getTitle() %>
                </h2>
                <hr>
                <article class="content-text" itemprop="articleBody">
                    	<%=boardDto.getText() %>
                </article>

            </div>

            <div id="content-function" class="content-function pull-right text-center over">

                <div class="content-function-group article-scrap-wrapper">
                    <a href="javascript://" id="article-scrap-btn" data-type="scrap"><i class="fa fa-bookmark " data-toggle="tooltip" data-placement="left" title="" data-original-title="스크랩"></i></a>
                   
                </div>
            </div>
            <div class="content-function-cog share-btn-wrapper">
                <div class="dropdown">
                    <a href="http://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fokky.kr%2Farticle%2F1043629" class="btn-facebook-share"><i class="fa fa-facebook-square fa-fw" data-toggle="tooltip" data-placement="left" title="" data-original-title="페이스북 공유"></i></a>
                </div>

                <div class="dropdown">
                	<form action="/article/delete/1043629" method="post" name="article-delete-form" id="article-delete-form">
							<input type="hidden" name="_csrf" value="d6901329-40ab-4284-80fa-9068a185e77c">
               			<input type="hidden" name="_method" value="DELETE" id="_method">
                        <div class="dropdown">
                            <a href="javascript://" data-toggle="dropdown"><i class="fa fa-cog" data-toggle="tooltip" data-placement="left" title="" data-original-title="게시물 설정"></i></a>
                            <ul class="dropdown-menu" role="menu">
                            <%if(boardDto.getEmail().equals(email)){
                            	%>
                            	<li><a href="/article/edit/1043629" class="edit"><i class="fa fa-edit fa-fw"></i> 수정 </a></li>
                                    <li><a href="javascript://" id="article-delete-btn"><i class="fa fa-trash-o fa-fw"></i> 삭제 </a></li>   
                            <% }%>
                                
                            </ul>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


				<div class="main-banner-wrapper">
		            <script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		            <!-- 728-90_Ressponsive -->
	            <ins class="adsbygoogle" style="display:inline-block;width:728px;height:90px" data-ad-client="ca-pub-8103607814406874" data-ad-slot="8622179990" data-adsbygoogle-status="done" data-ad-status="filled"><ins id="aswift_0_expand" tabindex="0" title="Advertisement" aria-label="Advertisement" style="border: none; height: 90px; width: 728px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: inline-table;"><ins id="aswift_0_anchor" style="border: none; height: 90px; width: 728px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: block;"><iframe id="aswift_0" name="aswift_0" style="left:0;position:absolute;top:0;border:0;width:728px;height:90px;" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="728" height="90" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-8103607814406874&amp;output=html&amp;h=90&amp;slotname=8622179990&amp;adk=3431456933&amp;adf=1152904402&amp;pi=t.ma~as.8622179990&amp;w=728&amp;lmt=1632135139&amp;psa=1&amp;format=728x90&amp;url=https%3A%2F%2Fokky.kr%2Farticle%2F1043629&amp;flash=0&amp;wgl=1&amp;uach=WyJXaW5kb3dzIiwiMTAuMCIsIng4NiIsIiIsIjIuMTAuMTI0LjI2IixbXSxudWxsLG51bGwsbnVsbF0.&amp;dt=1632135139737&amp;bpp=2&amp;bdt=103&amp;idt=15&amp;shv=r20210915&amp;mjsv=m202109170101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D87f0c8ac366fe46a-22ebca1cabcb0029%3AT%3D1631884643%3ART%3D1631884643%3AS%3DALNI_Mbz7xjtdDurSVEGRRSmXFgPTQ2CbA&amp;correlator=2493249386280&amp;frm=20&amp;pv=2&amp;ga_vid=1639673595.1631884643&amp;ga_sid=1632135140&amp;ga_hid=210917142&amp;ga_fc=1&amp;u_tz=540&amp;u_his=5&amp;u_java=0&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=14&amp;adx=279&amp;ady=1014&amp;biw=1088&amp;bih=935&amp;scr_x=0&amp;scr_y=541&amp;eid=44748552%2C44750533&amp;oid=3&amp;pvsid=1646876341316031&amp;pem=987&amp;eae=0&amp;fc=640&amp;brdim=0%2C0%2C0%2C0%2C1920%2C0%2C1920%2C1040%2C1088%2C935&amp;vis=1&amp;rsz=%7C%7CeE%7C&amp;abl=CS&amp;pfx=0&amp;fu=1024&amp;bc=31&amp;ifi=1&amp;uci=a!1&amp;fsb=1&amp;xpc=49QwcP6Z2m&amp;p=https%3A//okky.kr&amp;dtd=29" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!1" data-google-query-id="CKCNkpexjfMCFVnAlgodA6wBEg" data-load-complete="true"></iframe></ins></ins></ins>
	            <script>
	                 (adsbygoogle = window.adsbygoogle || []).push({});
	            </script>
	            </div>
	
    <div class="panel panel-default clearfix">
    
    
        <!-- List group -->
        <ul class="list-group">
            <li class="list-group-item note-form clearfix">
	            		<form action="/article/addNote/1043629" method="post" class="note-create-form">
								<input type="hidden" name="_csrf" value="d6901329-40ab-4284-80fa-9068a185e77c">
	            			<div class="content-body panel-body pull-left">
	                            <div style="margin-left: 5px;">
	                

	
	

<div class="avatar clearfix avatar-medium ">
		<a href="/user/info/126561" class="avatar-photo"><img src="https://ssl.pstatic.net/static/pwe/address/img_profile.png"></a>
		<div class="avatar-info">
				<a class="nickname" href="/user/info/126561" title="novb****"><%=boardDto.getEmail() %></a>
					<div class="activity block"><span class="fa fa-flash"></span> 85</div>
		</div>
</div>
	                            </div>
	                            <fieldset class="form">
	                                <input type="hidden" name="textType" value="HTML" id="note.textType">
	                                <textarea name="note.text" id="note-create" placeholder="댓글 쓰기" class="form-control"></textarea>
	                            </fieldset>
	                        </div>
	                        <div class="content-function-cog note-submit-buttons clearfix">
	                            <p><a href="javascript://" id="note-create-cancel-btn" class="btn btn-default btn-wide" style="display: none;">취소</a></p>
	                            <input type="submit" name="create" id="btn-create-btn" class="btn btn-success btn-wide" value="등록" disabled="disabled">
	                        </div>
	                    </form>
            </li>
        </ul>
    </div>
</div>

<form action="/article/dissent/1043629" method="post" name="note-dissent-form" id="note-dissent-form">
	<input type="hidden" name="_method" value="PUT" id="_method">
</form>
<form action="/article/assent/1043629" method="post" name="note-assent-form" id="note-assent-form">
	<input type="hidden" name="_method" value="PUT" id="_method">
</form>
<form action="/article/unvote/1043629" method="post" name="note-unvote-form" id="note-unvote-form">
	<input type="hidden" name="_method" value="PUT" id="_method">
</form>
<form action="/article/selectNote/1043629" method="post" name="note-select-form" id="note-select-form">
	<input type="hidden" name="_method" value="PUT" id="_method">
</form>
<form action="/article/deselectNote/1043629" method="post" name="note-deselect-form" id="note-deselect-form">
	<input type="hidden" name="_method" value="PUT" id="_method">
</form>
<form action="/article/scrap/1043629" method="post" name="article-scrap-form" id="article-scrap-form">
</form>
                <div class="right-banner-wrapper">




	       		<div class="google-ad">
	                   <script async="" src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	                   <!-- okjspad_160x500 -->
	                   <ins class="adsbygoogle" style="display: inline-block; width: 8px; height: 500px;" data-ad-client="ca-pub-8103607814406874" data-ad-slot="6573675943" data-adsbygoogle-status="done"></ins>
	                   <script>
	                        (adsbygoogle = window.adsbygoogle || []).push({});
	                   </script>
	               </div>
                </div>
                <div id="footer" class="footer" role="contentinfo">

<%@ include file="footer.jsp" %>
</body>
</html>