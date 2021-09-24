<%@page import="board.boardService"%>
<%@page import="board.boardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="header.jsp" %>
   <%
   int nowPage=1;
   String requestPage=request.getParameter("requestPage");
	if(requestPage!=null){
		nowPage=Integer.parseInt(requestPage);
	}
	System.out.print(nowPage+" 요청페이지");
   boardService boardService=new boardService();
   List<boardDto>array=boardService.selectAllByPage(nowPage,request);
   int totalPage=(int)httpSession.getAttribute("totalPage");
   int minus=nowPage-1;
   int plus=nowPage+1;
   %>
<!DOCTYPE html>
<html>
</head>
<body>
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

<div id="list-article" class="content scaffold-list tech-qna-list" role="main">
	<div class="nav" role="navigation">
	    <a  class="create btn btn-success btn-wide pull-right" href="writePage.jsp"><i class="fa fa-pencil"></i> 새 글 쓰기</a>
	    
	    <h4>Tech Q&amp;A</h4>
	    <form id="category-filter-form" name="category-filter-form" method="get" action="/articles/tech-qna">
		    <div class="category-filter-wrapper">
	            <div class="category-filter-query pull-right">
	                <div class="input-group input-group-sm">
	                    <input type="search" name="query" id="search-field" class="form-control" placeholder="검색어" value="">
	                    <span class="input-group-btn">
	                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
	                    </span>
	                </div>
	            </div>
	            <ul class="list-sort pull-left">
	            	<li><a href="/articles/tech-qna?query=&amp;sort=id&amp;order=desc" data-sort="id" data-order="desc" class="category-sort-link active">최신순</a></li>
	            </ul>
	            <input type="hidden" name="sort" id="category-sort-input" value="id">
	            <input type="hidden" name="order" id="category-order-input" value="desc">
		    </div>
		</form>
	</div>

	<div class="okkys-choice">
	    <div class="panel panel-default">
	        <!-- Table -->
	        <ul class="list-group">


    <div class="list-group-item-author clearfix">

	
	

    </div>
</li>
            </ul>
        </div>
	</div>
	
	
	


				<div class="main-banner-wrapper">
                   <div class="main-banner">
                   	  <a href="/banner/stats/401" target="n"><img src="//file.okky.kr/banner/1631264081375.png"></a>
                   </div>
                </div>
	
	<div class="panel panel-default tech-qna-panel">
	    <ul class="list-group ">
<%for(boardDto b:array){
%>
<li class="list-group-item list-group-item-question list-group-no-note clearfix">
<div class="list-title-wrapper clearfix">
        <div class="list-tag clearfix">
            <span class="list-group-item-text article-id"> <%=b.getId() %></span>
	<a href="/articles/tech-qna" class="list-group-item-text item-tag label label-info"><i class="fa fa-database"></i> Tech Q&amp;A</a>
        </div>

        <h5 class="list-group-item-heading list-group-item-evaluate">
            <a href="articlePage.jsp?aid=<%=b.getId() %>">
                <%=b.getTitle() %>
       			</a>
        </h5>
    </div>
    <div class="list-group-item-author clearfix">

<div class="avatar clearfix avatar-list ">
		<a href="/user/info/117503" class="avatar-photo"><img src="//www.gravatar.com/avatar/c8f9b00d52ddf005bb6240d6cbb49aea?d=identicon&amp;s=30"></a>
		<div class="avatar-info">
				<a class="nickname" title="bnm"><%=b.getEmail()%></a>
					<div class="activity"><span class="fa fa-flash"></span> <%=b.getHit()%></div>
					<div class="date-created"><span class="timeago" title="2021-09-20T12:37:37"><%=b.getCreated()%></span></div>
		</div>
</div>
    </div>
</li>
<%}%>

	    </ul>
	</div>
	<div class="text-center">

	<ul class="pagination pagination-sm">
			<li class="prev disabled">
			
			<%if(nowPage>1){
			%>	
			<span>
		<a href="index.jsp?requestPage=<%=minus%>">«</a>
		</span>
			<%}%>
				
			
				
			</li>
		
			  	<li class="active">
			  		<span><%=nowPage %>/<%=totalPage %></span>
			  	</li>
			<%if(nowPage<totalPage){
			%>	
			<li class="next">
				<a href="index.jsp?requestPage=<%=plus%>">»</a>
			</li>
			<%}%>
			
			
		
	</ul>
    </div>
</div>
                <div class="right-banner-wrapper">




	       		<div class="google-ad">
	                   <script async="" src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	                   <!-- okjspad_160x500 -->
	                   <ins class="adsbygoogle" style="display:inline-block;width:160px;height:500px" data-ad-client="ca-pub-8103607814406874" data-ad-slot="6573675943" data-adsbygoogle-status="done" data-ad-status="filled"><ins id="aswift_0_expand" tabindex="0" title="Advertisement" aria-label="Advertisement" style="border: none; height: 500px; width: 160px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: inline-table;"><ins id="aswift_0_anchor" style="border: none; height: 500px; width: 160px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: block;"><iframe id="aswift_0" name="aswift_0" style="left:0;position:absolute;top:0;border:0;width:160px;height:500px;" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="160" height="500" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-8103607814406874&amp;output=html&amp;h=500&amp;slotname=6573675943&amp;adk=4104151020&amp;adf=3198278716&amp;pi=t.ma~as.6573675943&amp;w=160&amp;lmt=1632107188&amp;psa=1&amp;format=160x500&amp;url=https%3A%2F%2Fokky.kr%2Farticles%2Ftech-qna&amp;flash=0&amp;wgl=1&amp;uach=WyJXaW5kb3dzIiwiMTAuMCIsIng4NiIsIiIsIjIuMTAuMTI0LjI2IixbXSxudWxsLG51bGwsbnVsbF0.&amp;dt=1632107188867&amp;bpp=5&amp;bdt=178&amp;idt=34&amp;shv=r20210915&amp;mjsv=m202109170101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D87f0c8ac366fe46a-22ebca1cabcb0029%3AT%3D1631884643%3ART%3D1631884643%3AS%3DALNI_Mbz7xjtdDurSVEGRRSmXFgPTQ2CbA&amp;correlator=5262991676023&amp;frm=20&amp;pv=2&amp;ga_vid=1639673595.1631884643&amp;ga_sid=1632107189&amp;ga_hid=1788176205&amp;ga_fc=1&amp;u_tz=540&amp;u_his=4&amp;u_java=0&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=14&amp;adx=1080&amp;ady=65&amp;biw=1629&amp;bih=935&amp;scr_x=0&amp;scr_y=0&amp;eid=44747620%2C44748552&amp;oid=3&amp;pvsid=2713287998108637&amp;pem=987&amp;ref=https%3A%2F%2Fokky.kr%2Farticles%2Ftech-qna%2Fcreate&amp;eae=0&amp;fc=896&amp;brdim=0%2C0%2C0%2C0%2C1920%2C0%2C1920%2C1040%2C1629%2C935&amp;vis=1&amp;rsz=%7C%7CfeE%7C&amp;abl=CF&amp;pfx=0&amp;fu=0&amp;bc=31&amp;ifi=1&amp;uci=a!1&amp;fsb=1&amp;xpc=hsLYtTeioY&amp;p=https%3A//okky.kr&amp;dtd=48" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!1" data-google-query-id="CNu3qYfJjPMCFVgmvQodHLcLtA" data-load-complete="true"></iframe></ins></ins></ins>
	                   <script>
	                        (adsbygoogle = window.adsbygoogle || []).push({});
	                   </script>
	               </div>
                </div>
                <div id="footer" class="footer" role="contentinfo">

                </div>
            </div>
<%@ include file="footer.jsp" %>
</body>
</html>
