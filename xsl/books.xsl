<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dlxs="http://dlxs.org">

  <xsl:import href="../xsl/component-author.xsl" />

  <xsl:template match="/">
    <p>
      <em><xsl:value-of select="//title" /></em>
      <xsl:call-template name="component-author" />
    </p>
  </xsl:template>
</xsl:stylesheet>