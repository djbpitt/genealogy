<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="title"/>
                </title>
                <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
                <link href="../css/ocs.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <xsl:apply-templates/>
                <hr/>
                <h2>Notes</h2>
                <xsl:apply-templates select="//fn" mode="fn"/>
                <hr/>
                <p>
                    <a href="http://localhost:8080/exist/genealogy/genealogy-form.xql">Return to
                        search page</a> | <a
                        href="http://localhost:8080/exist/genealogy/sources.xql">Sources</a> | <a
                        href="http://localhost:8080/exist/genealogy/data/about.html">About this
                        site</a>
                </p>

            </body>
        </html>
    </xsl:template>
    <xsl:template match="title">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="bookTitle">
        <cite>
            <xsl:apply-templates/>
        </cite>
    </xsl:template>
    <xsl:template match="articleTitle"> “<xsl:apply-templates/>” </xsl:template>
    <xsl:template match="fn">
        <xsl:variable name="fn_count">
            <xsl:number level="any"/>
        </xsl:variable>
        <sup>
            <a href="#fn{$fn_count}" name="fnref{$fn_count}">
                <xsl:value-of select="$fn_count"/>
            </a>
        </sup>
    </xsl:template>
    <xsl:template mode="fn" match="fn">
        <xsl:param name="fn_number">
            <xsl:number level="any"/>
        </xsl:param>
        <xsl:apply-templates>
            <xsl:with-param name="fn_number" select="$fn_number"/>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="fn_p">
        <xsl:param name="fn_number"/>
        <p>
            <xsl:if test="not(preceding-sibling::fn_p)">
                <sup>
                    <a href="#fnref{$fn_number}" name="fn{$fn_number}">
                        <xsl:value-of select="$fn_number"/>
                    </a>
                </sup>
            </xsl:if>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="link">
        <a href="http://localhost:8080/exist/genealogy/genealogy.xql?target={@target}">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
</xsl:stylesheet>
