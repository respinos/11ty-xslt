<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dlxs="http://dlxs.org">
  <xsl:template name="component-author">
    <xsl:text> by </xsl:text>
    <xsl:value-of select="//author/surname" />
    <xsl:text>, </xsl:text>
    <xsl:value-of select="//author/givenname" />
  </xsl:template>
</xsl:stylesheet>
