#!/bin/bash

BINDIR=`dirname $0`
cd $BINDIR/..
ROOT=$PWD

if [ ! -d "qui" ]
then
  mkdir qui
fi

cd "./xml"
find . -type f | egrep "\.xml" | while read xmlfilename
do
  colldir=`dirname $xmlfilename`
  basename=`basename $xmlfilename .xml`

  cat <<EOF > /tmp/qui.$basename.xsl
<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dlxs="http://dlxs.org" xmlns:qbat="http://dlxs.org/quombat" xmlns:qui="http://dlxs.org/quombat/ui" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">
  <xsl:import href="$ROOT/xsl/qui.core.xsl" />
  <xsl:import href="$ROOT/xsl/qui._social-links.xsl" />
  <xsl:import href="$ROOT/xsl/qui.$basename.xsl" />
</xsl:stylesheet>
EOF

  xsltproc /tmp/qui.$basename.xsl $xmlfilename > $ROOT/qui/$basename.xml

done