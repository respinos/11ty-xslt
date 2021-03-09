#!/bin/bash

BINDIR=`dirname $0`
cd $BINDIR/..
ROOT=$PWD

if [ ! -d "qbat" ]
then
  mkdir qbat
fi

cd "./qui"
find . -type f | egrep "\.xml" | egrep "index.xml" | while read xmlfilename
do
  colldir=`dirname $xmlfilename`
  basename=`basename $xmlfilename .xml`

  cat <<EOF > /tmp/qbat.$basename.xsl
<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dlxs="http://dlxs.org" xmlns:qbat="http://dlxs.org/quombat" xmlns:qui="http://dlxs.org/quombat/ui" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">
  <xsl:import href="$ROOT/xsl/qbat.core.xsl" />
  <xsl:import href="$ROOT/xsl/qbat.$basename.xsl" />
</xsl:stylesheet>
EOF

  xsltproc /tmp/qbat.$basename.xsl $xmlfilename | \
    awk '$0 = NR == 1 ? "<!doctype html>" : $0' > $ROOT/qbat/$basename.html

done