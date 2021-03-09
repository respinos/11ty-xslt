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

  cat <<EOF > /tmp/$basename.qbat.xsl
<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dlxs="http://dlxs.org" xmlns:qbat="http://dlxs.org/quombat" xmlns:qui="http://dlxs.org/quombat/ui" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">
  <xsl:import href="$ROOT/xsl/core.qbat.xsl" />
  <xsl:import href="$ROOT/xsl/$basename.qbat.xsl" />
</xsl:stylesheet>
EOF

  #Q xsltproc /tmp/$basename.qbat.xsl $xmlfilename | sed,'\<\!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"\>','\<\!doctype html\>', > $ROOT/qbat/$basename.html
  xsltproc /tmp/$basename.qbat.xsl $xmlfilename | \
    awk '$0 = NR == 1 ? "<!doctype html>" : $0' > $ROOT/qbat/$basename.html

done