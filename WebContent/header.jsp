<%@page import="java.util.Collections"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<div class="javascript">
	This website works best when JavaScript is enabled.
</div>
<div class="header">
	<div class="container">
		<div class="group">
			<div class="social-links">
				<a class="social" href="https://www.facebook.com/pages/Chernobyl-Children-Cancer-Care-Cardiff-The-5Cs/134001776683923" target="_blank"><img src="/5Cs/Images/FB-blue.png" alt="Facebook" /></a>
				<a class="social" href="https://twitter.com/FiveCsCardiff" target="_blank"><img src="/5Cs/Images/Twitter-blue.png" alt="Twitter" /></a>
				<a class="social" href="https://instagram.com/The_five_cs" target="_blank"><img src="/5Cs/Images/Instagram.png" alt="Instagram" /></a>
				<a class="social" href="https://www.youtube.com/channel/UCQBUkVah9dWqd0q7wO2jeUQ/videos" target="_blank"><img src="/5Cs/Images/YouTube-small.png" alt="YouTube" /></a>
				<form class="donate" action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
					<input type="hidden" name="cmd" value="_s-xclick">
					<input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----">
					<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" name="submit" alt="PayPal - The safer, easier way to pay online!">
				</form>
			</div>
			<div class="menuImg"><a class="logo" href="/5Cs/"><img src="/5Cs/Images/logo140.gif" alt="Five Cs Logo" /></a></div>
			
			<div class="titleName"><a href="/5Cs/"><span></span></a></div>
<!-- 			<p class="name"><strong>C</strong>hernobyl <span class="red"><strong>C</strong>hildren </span><strong>C</strong>ancer <strong>C</strong>are <strong>C</strong>ardiff</p> -->
			
			<nav class="navbar navbar-default" role="navigation">
				<div class="container-fluid">
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="menu-btn"><a href="#"><span>MENU</span></a></li>
							<li class="<%= isActive("home", request) %>"><a href="/5Cs/">Home</a></li>
							<li class="dropdown <%= isActive("about-us", request) %>">
								<a href="/5Cs/about-us/what-we-do/" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">About Us <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/5Cs/about-us/what-we-do/">What We Do</a></li>
									<li><a href="/5Cs/about-us/the-hospice/">The Hospice</a></li>
									<li><a href="/5Cs/about-us/chernobyl/">Chernobyl</a></li>
									<li><a href="/5Cs/about-us/about-the-camp/">About The Camp</a></li>
								</ul>
							</li>
							<li class="dropdown <%= isActive("news", request) %>">
								<a href="/5Cs/news/upcoming/" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">News <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/5Cs/news/upcoming/">Upcoming</a></li>
									<% String directory = application.getRealPath("/news");
									File rootFolder = new File(directory);
									if (rootFolder != null) {
										String[] files = rootFolder.list();
										Arrays.sort(files, Collections.reverseOrder());
										for (int i = 0; i < files.length; i++) {
											String name = files[i];
											if ("upcoming".equals(name)) {
												continue;
											} %>
											<li class="dropdown-submenu">
												<a href="/5Cs/news/<%= name %>/events/"><%= name %><span class="caret"></span></a>
												<ul class="dropdown-menu" role="menu">
													<li><a href="/5Cs/news/<%= name %>/events/">Events</a></li>
													<li class="dropdown-submenu sub-sub-menu">
														<a href="/5Cs/news/<%= name %>/newsletters/">Newsletters<span class="caret"></span></a>
														<ul class="dropdown-menu">
															<%  String path = application.getRealPath("/news/" + name + "/newsletters");
																File yearDirectory = new File(path);
																String[] newsletters = yearDirectory.list();
																for (int j = 0; j < newsletters.length; j++) {
																	if (!"index.jsp".equals(newsletters[j])) { 
																		String[] parts = newsletters[j].split("\\."); %>
																		<li><a href="/5Cs/news/<%= name %>/newsletters/<%= newsletters[j] %>" target="_blank"><%= parts[1] %></a></li>
															 	<%  } %>
															<%  } %>
														</ul>
													</li>
												</ul>
											</li>
										<% } %>
									<% } %>
								</ul>
							</li>
							<li class="dropdown <%= isActive("gallery", request) %>">
								<a href="/5Cs/gallery/photos/" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Gallery <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/5Cs/gallery/photos/">Photos</a></li>
									<li><a href="/5Cs/gallery/videos/">Videos</a></li>
								</ul>
							</li>
							<li class="dropdown <%= isActive("donate", request) %>">
								<a href="/5Cs/donate/how-can-i-help/" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Donate <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/5Cs/donate/how-can-i-help/">How Can I Help?</a></li>
									<li><a href="/5Cs/donate/events/">Events</a></li>
								</ul>
							</li>
							<li class="dropdown <%= isActive("support", request) %>">
								<a href="/5Cs/support/gwirvol/" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Support <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/5Cs/support/gwirvol/">GwirVol</a></li>
									<li><a href="/5Cs/support/friends-of-the-bch/">Friends of the BCH</a></li>
									<li><a href="/5Cs/support/rotary-club-of-cardiff-breakfast/">Rotary Club of Cardiff Breakfast</a></li>
									<li><a href="/5Cs/support/interact-clubs/">Interact Clubs</a></li>
								</ul>
							</li>
							<li class="<%= isActive("contact-us", request) %>"><a href="/5Cs/contact-us/">Contact Us</a></li>
							<li class="<%= isActive("log-book", request) %>"><a href="/5Cs/log-book/">Log Book</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
</div>

<%!

private String isActive(String page, HttpServletRequest req) {
	String url = req.getRequestURI();
	
	if ("home".equals(page) && "/5Cs/".equals(url)) {
		return "active";
	}
	
	if (url.contains(page)) {
		return "active";
	}
	
	return "";
}

%>