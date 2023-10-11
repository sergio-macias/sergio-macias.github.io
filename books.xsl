<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/books">
    <html>
      <head>
        <title>Sergio Mac&#237;as</title>
        <script language="JavaScript"></script>
        <link rel="stylesheet" type="text/css" href="css/common.css" />

        <script type="text/x-mathjax-config">
         MathJax.Hub.Config({
           tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
         });
         </script>

         <script type="text/javascript" async="async"
           src="js/mathjax/MathJax.js?config=TeX-MML-AM_CHTML">
         </script>

         <script type='text/javascript' src='https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js'></script>
         <script async="async" src="https://badge.dimensions.ai/badge.js" charset="utf-8"></script>
      </head>
      <body>
        <div class="fondo">
          <div class="main">

                  <div class="header">
              <a href="http://www.matem.unam.mx/~sergiom/">Sergio Mac&#237;as</a>

              <!-- End #logo -->
              <span class="menu">
                    <a href="papers.xml">Research Papers</a>
                    <a href="books.xml" class="selected" >Books</a>
                    <a href="publications.xml" >Non-ResearchPapers</a>
                    <a href="genealogy.html" >Genealogy</a>
                    <a href="tree.html">Tree</a>
                    <a href="contact.html" >Contact</a>
              </span>
            </div>
            <div class="lista">
       <xsl:apply-templates select="book" />
            </div>
          </div>
        </div>
        <div id="footer">
          <p>Universidad Nacional Aut&#243;noma de M&#233;xico, Instituto de Matem&#225;ticas</p>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="book">
    <div class="entry">
      <div class="entry-btm">
        <table cellpadding="0" cellspacing="15">
          <tr>
            <!-- Celda 1 -->
            <td>
              <p>
                <a target="_blank" href="{image/@link}">
                  <img src="images/{image/@src}" />
                </a>
              </p>
            </td>
            <!-- Celda 2 -->
            <td>
              <p>
                <span class="papertitle">
                  <xsl:value-of select="title" />
                </span>
              </p>
              <p>
                <xsl:value-of select="subtitle" />
              </p>
              <p>
                <xsl:value-of select="author" />
              </p>
               <p>Editorial:
                <xsl:value-of select="editorial" />
              </p>


              <xsl:if test="editorial/@isbn-10 !='xxx'">
              <p>ISBN-10:
                <xsl:value-of select="editorial/@isbn-10" />
              </p>
              </xsl:if>


              <xsl:if test="editorial/@isbn-13 !='xxx'">
              <p>ISBN-13:
                <xsl:value-of select="editorial/@isbn-13" />
              </p>
              </xsl:if>

               <xsl:if test="editorial/@e-isbn !='xxx'">
              <p>ebook ISBN:
                <xsl:value-of select="editorial/@e-isbn" />
              </p>
              </xsl:if>


               <xsl:if test="editorial/@soft-isbn !='xxx'">
              <p>Softcover ISBN:
                <xsl:value-of select="editorial/@soft-isbn" />
              </p>
              </xsl:if>

              <xsl:if test="editorial/@hard-isbn !='xxx'">
              <p>Hardcover ISBN:
                <xsl:value-of select="editorial/@hard-isbn" />
              </p>
              </xsl:if>





              <p>
                <xsl:value-of select="description/@text1" />
              </p>
              <p>
                <xsl:value-of select="description/@text2" />
              </p>
              <p>
                <xsl:value-of select="description/@text3" />
              </p>
              <p>
                <xsl:value-of select="description/@text4" />
              </p>


              <xsl:if test="count(altmetric) &gt; 0">
              <p>
                <div class='altmetric-embed' data-badge-popover='bottom' data-link-target="_blank" data-doi='{link[@type="DOI"]/@code}'></div>
              </p>
              </xsl:if>


              <xsl:if test="count(dimensions) &gt; 0">
              <p>
                <span class="__dimensions_badge_embed__" data-hide-zero-citations="true" data-doi='{link[@type="DOI"]/@code}' data-style="small_rectangle"></span>
              </p>
              </xsl:if>
            </td>
          </tr>
        </table>
        <xsl:if test="count(link) &gt; 0">
          <p>
            <xsl:apply-templates select="link" />
            <xsl:if test="count(file) &gt; 0">
              <span class="files">
                <xsl:apply-templates select="file" />
              </span>
            </xsl:if>
          </p>
        </xsl:if>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="coauthors">
    <p>Coauthors:
    <xsl:value-of select="coauthor/@name" /></p>
  </xsl:template>
  <xsl:template match="link">
    <a class="{@type}" href="{.}" target="_blank">

    <xsl:value-of select="@code" />&#160;&#160;
    <xsl:value-of select="@ref" /></a>
  </xsl:template>
  <xsl:template match="file">
    <a class="{@free}" href="{.}" target="_blank">
      <img src="images/{@type}.gif" />
    </a>
  </xsl:template>
</xsl:stylesheet>
