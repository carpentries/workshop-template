<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:output method="html" encoding="utf-8" />
<xsl:template match="/rss">
	<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html &gt;</xsl:text>
	<html>
	<head>
		<xsl:text disable-output-escaping="yes"><![CDATA[
			<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>RSS Feed (Styled)</title>
	<link rel="stylesheet" type="text/css" href="http://swctasks.github.io/assets//assets/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="http://swctasks.github.io/assets//assets/css/swc.css" />
	<script src="http://swctasks.github.io/assets//assets/js/modernizr.min.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.5.18/webfont.js"></script>
  <script>
    WebFont.load({
      google: {
        families: [ 'Lato:400,700,400italic:latin', 'Volkhov::latin' ]
      }
    });
  </script>

  <noscript>
    <link href='http://fonts.googleapis.com/css?family=Lato:400,700,400italic|Volkhov' rel='stylesheet' type='text/css' />
  </noscript>

  
	
	<meta name="description" content="tests." />

	

	<!-- Favicon/touch icons -->
	<link rel="shortcut icon" href="/favicon.ico"> <!-- must remain in root directory -->
	<link rel="icon" type="image/png" href="http://swctasks.github.io/assets//assets/img/favicon-16x16.png" sizes="16x16">
	<link rel="icon" type="image/png" href="http://swctasks.github.io/assets//assets/img/favicon-32x32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="http://swctasks.github.io/assets//assets/img/favicon-96x96.png" sizes="96x96">
	<link rel="apple-touch-icon" sizes="57x57" href="http://swctasks.github.io/assets//assets/img/apple-touch-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="http://swctasks.github.io/assets//assets/img/apple-touch-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="http://swctasks.github.io/assets//assets/img/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="http://swctasks.github.io/assets//assets/img/apple-touch-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="http://swctasks.github.io/assets//assets/img/apple-touch-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="http://swctasks.github.io/assets//assets/img/apple-touch-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="http://swctasks.github.io/assets//assets/img/apple-touch-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="http://swctasks.github.io/assets//assets/img/apple-touch-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="http://swctasks.github.io/assets//assets/img/apple-touch-icon-180x180.png">
	<link rel="icon" type="image/png" href="http://swctasks.github.io/assets//assets/img/android-chrome-192x192.png" sizes="192x192">
	<link rel="manifest" href="http://swctasks.github.io/assets//assets/img/manifest.json">
	<link rel="mask-icon" href="http://swctasks.github.io/assets//assets/img/safari-pinned-tab.svg" color="#293c92">
	<meta name="msapplication-TileColor" content="#da532c">
	<meta name="msapplication-TileImage" content="/mstile-144x144.png">
	<meta name="msapplication-config" content="/browserconfig.xml">
	<meta name="theme-color" content="#ffffff">



		]]></xsl:text>
	</head>
	<body id="top-of-page">
		<xsl:text disable-output-escaping="yes"><![CDATA[
		
<div id="navigation" class="sticky">
  <nav class="top-bar" role="navigation" data-topbar>
    <ul class="title-area">
      <li class="name">
      <h1 class="show-for-small-only"><a href="http://swctasks.github.io/assets/"> test</a></h1>
    </li>
       <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
      <li class="toggle-topbar menu-icon"><a href="#"><span>Navigation</span></a></li>
    </ul>
    <section class="top-bar-section">

      <ul class="right">
        

              
                
              

          
          
        

              
                
              

          
          
        

              
                
              

          
          
        

              
                
              

          
          
        

              
                
              

          
          
        

              
                
              

          
          
        

              
                
              

          
          
        

              
                
              

          
          
            
            
              <li class="divider"></li>
              <li><a href="http://swctasks.github.io/assets//contact/">Contact</a></li>

            
            
          
        

              
                
              

          
          
            
            
              <li class="divider"></li>
              <li><a href="http://swctasks.github.io/assets//search/">Search</a></li>

            
            
          
        
        
      </ul>

      <ul class="left">
        

              
                
              

          
          

            
            
              <li><a href="http://swctasks.github.io/assets//">Home</a></li>
              <li class="divider"></li>

            
            
          
        

              
                
              

          
          

            
            

              <li class="has-dropdown">
                <a href="http://swctasks.github.io/assets//about/">About</a>

                  <ul class="dropdown">
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//about/">About Us</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//faq/">FAQ</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//conduct/">Code of Conduct</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//team/">Our Team</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//audience/">Our Audience</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//testimonials/">Testimonials</a></li>
                    
                  </ul>

              </li>
              <li class="divider"></li>
            
          
        

              
                
              

          
          

            
            

              <li class="has-dropdown">
                <a href="http://swctasks.github.io/assets//scf/">Foundation</a>

                  <ul class="dropdown">
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//scf/">Software Carpentry Foundation</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//scf/partners/">Our Partners</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//scf/join/">Become a Partner</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//scf/members/">Our Members</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//scf/history/">Our History</a></li>
                    
                  </ul>

              </li>
              <li class="divider"></li>
            
          
        

              
                
              

          
          

            
            

              <li class="has-dropdown">
                <a href="http://swctasks.github.io/assets//workshops/">Workshops</a>

                  <ul class="dropdown">
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//workshops/">Our Workshops</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//conduct/">Code of Conduct</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//workshops/pitch/">Pitching a Workshop</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//workshops/request/">Request a Workshop</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//workshops/operations/">Workshop Operations</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//workshops/past/">Past Workshops</a></li>
                    
                  </ul>

              </li>
              <li class="divider"></li>
            
          
        

              
                
              

          
          

            
            

              <li class="has-dropdown">
                <a href="http://swctasks.github.io/assets//lessons/">Lessons</a>

                  <ul class="dropdown">
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//lessons/">Our Lessons</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//license/">License</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//lessons/dashboard/">Development Dashboard</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//lessons/previous/">Previous Material</a></li>
                    
                  </ul>

              </li>
              <li class="divider"></li>
            
          
        

              
                
              

          
          

            
            

              <li class="has-dropdown">
                <a href="http://swctasks.github.io/assets//join/">Get Involved</a>

                  <ul class="dropdown">
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//join/">Join Us</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//join/donate/">Donate</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//join/projects/">Related Projects</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//join/help/">Help Wanted</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//reading/">Reading Material</a></li>
                    
                  </ul>

              </li>
              <li class="divider"></li>
            
          
        

              
                
              

          
          

            
            

              <li class="has-dropdown">
                <a href="http://swctasks.github.io/assets//blog/">Blog</a>

                  <ul class="dropdown">
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//blog/">Recent Posts</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//blog/archive/">Blog Archive</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//blog/categories/">Blog Posts by Category</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//blog/dates/">Blog Posts by Date</a></li>
                    

                      
                        
                      

                      <li><a href="http://swctasks.github.io/assets//commenting/">Commenting Policy</a></li>
                    
                  </ul>

              </li>
              <li class="divider"></li>
            
          
        

              
                
              

          
          
        

              
                
              

          
          
        
        
      </ul>
    </section>
  </nav>
</div><!-- /#navigation -->

		

<div id="masthead-no-image-header">
	<div class="row">
		<div class="small-6 columns">
			<a id="logo" href="http://swctasks.github.io/assets/" title="test – zzz">
				<img src="http://swctasks.github.io/assets//assets/img/swc-logo-white.svg" alt="test – zzz">
			</a>
		</div>
		<div class="small-6 columns">
			<h3 class="masthead">Teaching basic lab skills<br/>for research computing</h3>
		</div>
	</div><!-- /.row -->
</div><!-- /#masthead -->








		


<div class="alert-box warning radius text-center"><p>This <a href="https://en.wikipedia.org/wiki/RSS" target="_blank">RSS feed</a> is meant to be used by <a href="https://en.wikipedia.org/wiki/Template:Aggregators" target="_blank">RSS reader applications and websites</a>.</p>
</div>



		]]></xsl:text>
		<header class="t30 row">
	<p class="subheadline"><xsl:value-of select="channel/description" disable-output-escaping="yes" /></p>
	<h1>
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="channel/link" />
			</xsl:attribute>
			<xsl:value-of select="channel/title" disable-output-escaping="yes" />
		</xsl:element>
	</h1>
</header>
<ul class="accordion row" data-accordion="">
	<xsl:for-each select="channel/item">
		<li class="accordion-navigation">
			<xsl:variable name="slug-id">
				<xsl:call-template name="slugify">
					<xsl:with-param name="text" select="guid" />
				</xsl:call-template>
			</xsl:variable>
			<xsl:element name="a">
				<xsl:attribute name="href"><xsl:value-of select="concat('#', $slug-id)"/></xsl:attribute>
				<xsl:value-of select="title"/>
				<br/>
				<small><xsl:value-of select="pubDate"/></small>
			</xsl:element>
			<xsl:element name="div">
				<xsl:attribute name="id"><xsl:value-of select="$slug-id"/></xsl:attribute>
				<xsl:attribute name="class">content</xsl:attribute>
				<h1>
					<xsl:element name="a">
						<xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
						<xsl:value-of select="title"/>
					</xsl:element>
				</h1>
				<xsl:value-of select="description" disable-output-escaping="yes" />
			</xsl:element>
		</li>
	</xsl:for-each>
</ul>

		<xsl:text disable-output-escaping="yes"><![CDATA[
		    <div id="up-to-top" class="row">
      <div class="small-12 columns" style="text-align: right;">
        <a class="iconfont" href="#top-of-page">&#xf108;</a>
      </div><!-- /.small-12.columns -->
    </div><!-- /.row -->


    <footer id="footer-content" class="bg-grau">
      <div id="footer">
        <div class="row">
          <div class="medium-6 large-5 columns">
            <h5 class="shadow-black"></h5>

            <p class="shadow-black">
              tests.
              <a href="http://swctasks.github.io/assets//about/"></a>
            </p>
          </div><!-- /.large-6.columns -->


          <div class="medium-3 large-3 large-offset-1 columns">
            

              <ul class="no-bullet shadow-black">
              
              </ul>
          </div><!-- /.large-4.columns -->

        </div><!-- /.row -->

      </div><!-- /#footer -->


      <div id="footer">
        <nav class="row">
          <section id="footer-left" class="b30 small-6 medium-6 columns credits">
            <ul class="inline-list">
            <li>
                Site design: <a style="display: inline;" href="http://phlow.github.io/feeling-responsive/">Feeling&nbsp;Responsive</a>.
            </li>
            </ul>
          </section>

          <section id="footer-right" class="small-6 medium-3 columns social-icons">
            <ul class="inline-list">
            
            </ul>
          </section>
        </nav>
      </div><!-- /#footer -->
    </footer>

		<script src="http://swctasks.github.io/assets//assets/js/javascript.min.js"></script>
<script src="http://swctasks.github.io/assets//assets/js/bootstrap.tooltips.min.js"></script>

<!-- Only include mapping stuff if we're going to draw a map -->

<!-- page.map_url is "" -->
<!-- page.map_element is "" -->


<script>
  $('p[data-toggle="tooltip"]').tooltip({html: true, placement: "bottom"});
</script>












		]]></xsl:text>
	</body>
	</html>
</xsl:template>
<xsl:template name="slugify">
	<xsl:param name="text" select="''" />
	<xsl:variable name="dodgyChars" select="' ,.#_-!?*:;=+|&amp;/\\'" />
	<xsl:variable name="replacementChar" select="'-----------------'" />
	<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
	<xsl:variable name="lowercased"><xsl:value-of select="translate( $text, $uppercase, $lowercase )" /></xsl:variable>
	<xsl:variable name="escaped"><xsl:value-of select="translate( $lowercased, $dodgyChars, $replacementChar )" /></xsl:variable>
	<xsl:value-of select="$escaped" />
</xsl:template>
</xsl:stylesheet>
