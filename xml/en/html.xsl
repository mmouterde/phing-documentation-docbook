<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:fo="http://www.w3.org/1999/XSL/Format"   
				version="1.0">

<xsl:import href="##DOCBOOK_XSL##"/>
<xsl:param name="use.extensions">0</xsl:param>
<xsl:param name="use.id.as.filename">1</xsl:param>
<xsl:param name="base.dir">./</xsl:param>

<!-- Must be 0 for next/prev to be present in header/footer -->
<xsl:param name="chunk.fast">0</xsl:param>
    
<xsl:param name="make.valid.html">1</xsl:param>
<xsl:param name="section.autolabel">1</xsl:param>
<xsl:param name="generate.index">0</xsl:param>
<xsl:param name="section.label.includes.component.label">1</xsl:param>
<xsl:param name="chunker.output.indent">yes</xsl:param>
<xsl:param name="chunker.output.encoding">UTF-8</xsl:param>
<xsl:param name="chunk.section.depth">0</xsl:param>
<xsl:param name="chunk.tocs.and.lots">0</xsl:param>
<xsl:param name="html.extra.head.links">1</xsl:param>
<xsl:param name="generate.manifest">0</xsl:param>
<xsl:param name="admon.graphics">1</xsl:param>
<xsl:param name="admon.graphics.path">images/docbook/</xsl:param>
<xsl:param name="admon.style"></xsl:param>
<xsl:param name="html.stylesheet">docbook.html.css</xsl:param>

<xsl:param name="navig.showtitles">1</xsl:param>

<xsl:param name="suppress.navigation">0</xsl:param>
<xsl:param name="suppress.header.navigation">0</xsl:param>
<xsl:param name="suppress.footer.navigation">0</xsl:param>

<xsl:param name="header.rule">0</xsl:param>
<xsl:param name="footer.rule">0</xsl:param>


<!-- we redefine the TOC, so list of tables is not generated -->
<xsl:param name="generate.toc">
<!-- see http://www.sagehill.net/docbookxsl/TOCcontrol.html#TOCcomponents -->
appendix  toc,title
article/appendix  nop
article   toc,title
book      toc,title,figure,example,equation
chapter   toc,title
part      toc,title
preface   toc,title
qandadiv  toc
qandaset  toc
reference toc,title
sect1     toc
sect2     toc
sect3     toc
sect4     toc
sect5     toc
section   toc
set       toc,title
</xsl:param>

<xsl:template match="programlisting[@language]" mode="class.value">programlisting <xsl:value-of select="@language"/></xsl:template>

<!-- refsect1 elements have 'role' attribute ; which is used to style the HTML with CSS => 'role' must be transformed to 'class' -->
<xsl:template match="refsect1[@role]" mode="class.value"><xsl:value-of select="@role"/></xsl:template>


</xsl:stylesheet>