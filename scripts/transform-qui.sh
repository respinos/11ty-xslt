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

  cat <<EOF > /tmp/$basename.qui.xsl
<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dlxs="http://dlxs.org" xmlns:qbat="http://dlxs.org/quombat" xmlns:qui="http://dlxs.org/quombat/ui" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">
  <xsl:import href="$ROOT/xsl/core.qui.xsl" />
  <xsl:import href="$ROOT/xsl/social-links.qui.xsl" />
  <xsl:import href="$ROOT/xsl/$basename.qui.xsl" />
</xsl:stylesheet>
EOF

  xsltproc /tmp/$basename.qui.xsl $xmlfilename > $ROOT/qui/$basename.xml

done