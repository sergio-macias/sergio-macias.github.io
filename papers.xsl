<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/papers/research">
    <html>
      <head>
        <title>Sergio Mac&#237;as</title>
        <link rel="stylesheet" type="text/css" href="css/common.css" />
        <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
        <base target="_blank" />

        <script type="text/x-mathjax-config">
         MathJax.Hub.Config({
           tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
         });
         </script>

         <script type="text/javascript" async="async"
           src="js/mathjax/MathJax.js?config=TeX-MML-AM_CHTML">
         </script>

         <script async="async" src="https://badge.dimensions.ai/badge.js" charset="utf-8"></script>
      </head>
      <body>
        <div class="fondo">
          <div class="main">

                  <div class="header">
              <a href="http://www.matem.unam.mx/~sergiom/">Sergio Mac&#237;as</a>

              <!-- End #logo -->
              <span class="menu">
                    <a href="papers.xml" class="selected">Research Papers</a>
                    <a href="books.xml" >Books</a>
                    <a href="publications.xml" >Non-ResearchPapers</a>
                    <a href="genealogy.html" >Genealogy</a>
                    <a href="tree.html">Tree</a>
                    <a href="contact.html" >Contact</a>
              </span>
            </div>

            <a href="#bottom" >Last</a>

                <div class="lista">

                <xsl:for-each select="paper">

        <div class="entry">
      <div class="entry-btm">
        <p>
          <span class="papertitle">
            [<xsl:number value="position()-1" format="1" />] <xsl:value-of select="title" />
          </span>
          <xsl:if test="title/@eng !='xxx'"> (<xsl:value-of select="title/@eng" />)</xsl:if>
        </p>
        <p>
        <xsl:value-of select="magazine" />
        (ISSN <xsl:value-of select="magazine/@issn" />)
        <xsl:if test="magazine/@vol !='xxx'"> &#160; <xsl:value-of select="magazine/@vol" /></xsl:if>
        <xsl:if test="magazine/@year !='xxx'">, <xsl:value-of select="magazine/@year" /> </xsl:if>
        <xsl:if test="magazine/@note !='xxx'">, <xsl:value-of select="magazine/@note" /> </xsl:if>
        <xsl:if test="magazine/@begin-page !='xxx'"> (pages: <xsl:value-of select="magazine/@begin-page" />-</xsl:if>
        <xsl:if test="magazine/@end-page !='xxx'"> <xsl:value-of select="magazine/@end-page" />)</xsl:if>
        </p>

        <xsl:if test="count(coauthors/*) &gt; 0">
          <xsl:apply-templates select="coauthors" />
        </xsl:if>
        <xsl:if test="count(link) &gt; 0">
          <p>
            <xsl:apply-templates select="link" />

            <xsl:if test="count(openAccess) &gt; 0">
              <span class="openAccess">
                <img src="images/openAccess.gif" />
              </span>
            </xsl:if>

            <xsl:if test="count(file) &gt; 0">
              <span class="files">
                <xsl:apply-templates select="file" />
              </span>
            </xsl:if>
          </p>
        </xsl:if>
      </div>
    </div>
  </xsl:for-each>


                </div>

                <a name="bottom"></a>

            </div> <!-- end main -->

            <div id="footer">
            <p>Universidad Nacional Aut&#243;noma de M&#233;xico, Instituto de Matem&#225;ticas</p>
            </div>

        </div> <!--end fondo -->
    </body>
    </html>
  </xsl:template>
  <xsl:template match="coauthors">
    <p>Coauthors:
    <ul><xsl:apply-templates select="coauthor" /></ul> </p>
  </xsl:template>

  <xsl:template match="coauthor">
    <li><xsl:value-of select="@name" /></li>
  </xsl:template>

   <xsl:template match="link">
    <a class="{@type}" href="{.}" >

    <xsl:if test="@type ='MathSciNet'">
    <xsl:value-of select="@code" />
    </xsl:if>
    <xsl:if test="@type ='Zentralblatt'">
    <xsl:value-of select="@code" />
    </xsl:if>
    <xsl:if test="@type ='DOI'">DOI:
    <xsl:value-of select="@code" />
    </xsl:if>
    <xsl:if test="@type ='ResearchGate'">ResearchGate
    </xsl:if>
    <xsl:if test="@ref !='xxx'">
    -<xsl:value-of select="@ref" />
    </xsl:if>
    </a>
    <xsl:if test="@type ='DOI'">
    <span class="__dimensions_badge_embed__" data-hide-zero-citations="true" data-doi='{@code}' data-style="small_rectangle"></span>
    </xsl:if>
  </xsl:template>

  <xsl:template match="file">
    <a class="{@free}" href="{.}" >
      <img src="images/{@type}.gif" />
    </a>
  </xsl:template>

</xsl:stylesheet>
