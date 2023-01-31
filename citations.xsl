<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:template match="/papers/research">

 <html>
  <head>

  <style type="text/css">

tr:nth-child(even) {
  background-color: #d2d2d2;
}
/*

#mitabla td:nth-child(3)  {
   display: none;
}

#mitabla td:nth-child(4)  {
   display: none;
}
*/

  </style>
  </head>

 <body>
 <table border="1" cellpadding="5" cellspacing="0" id="mitabla">

 <tr>
 <td>Numero</td>
 <td>Titulo</td>
 <td>DOI</td>
 <td>Referencia Google Scholar</td>
 <td>Link Google Scholar</td>
 <td>Numero citas</td>
 </tr>

    <xsl:for-each select="paper">
    <tr>
        <td><xsl:number value="position()-1" format="1" /> </td>
        <td><xsl:apply-templates select="titlt" /></td>
        <td><xsl:apply-templates select="link" /> </td>
        <xsl:apply-templates select="gs_cites" />
        <xsl:apply-templates select="num_cites" />
    </tr>
    </xsl:for-each>

  </table>

 </body>
 </html>
  </xsl:template>

<xsl:template match="titlt">

    <td>
     <a  href="https://scholar.google.com/scholar?hl=en&amp;as_sdt=0%2C5&amp;q=%22{.}%22&amp;scisbd=0,5" target="_blank">
    <xsl:value-of select="." />
    </a>
    </td>
  </xsl:template>



   <xsl:template match="link">

   <xsl:if test="@type ='DOI'">

    <a href="http://dx.doi.org/{@code}" target="_blank" >http://dx.doi.org/<xsl:value-of select="@code" /></a>
    </xsl:if>
  </xsl:template>



  <xsl:template match="gs_cites">
    <td>
    <xsl:value-of select="." />
    </td>
    <td>
     <a  href="https://scholar.google.com/scholar?as_sdt=2005&amp;sciodt=0,5&amp;hl=en&amp;cites={.}" target="_blank">
    <xsl:value-of select="." />
    </a>
    </td>
  </xsl:template>

  <xsl:template match="num_cites">
    <td>
    <xsl:value-of select="." />
    </td>

  </xsl:template>


</xsl:stylesheet>
