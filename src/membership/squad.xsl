<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- TODO: TBD: could add other bits in, such as Discord, etc -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="text()"><xsl:value-of select="." /></xsl:template>
    <xsl:template match="*"><xsl:apply-templates /></xsl:template>
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="/squad/title"/></title>
                <link REL="stylesheet" TYPE="text/css" HREF="squad.css"></link>
            </head>
            <!--
             XSL template for "squad.xml", used in "Armed Assault" (Ref: "http://www.armedassault.com") and "{{arma2}}" (Ref: "http://www.arma2.com")
             See also the Arma-Wiki page: "http://community.bistudio.com/wiki/squad.xml"
             Created by Maj M. W. Powell, 2020-04-16 10:25:30 PM
             License: Creative Common
             To have a squad logo in the HTML output, just put a "sqd_logo.png" in the same folder...
            -->
            <body>
                <!-- Main Table -->
                <table class="main">
                    <tr>
                        <td class="left_row" valign="top">
                            <!-- Squad Info Table -->
                            <table class="sqd_info">
                                <tr height="30">
                                    <td class="one">
                                        <div class="sqd_name">
                                            <!-- TODO: TBD: may look into elaborating this section with more interesting bits... -->
                                            <xsl:value-of select="/squad/name"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr height="30">
                                    <td class="two">
                                        <div class="sqd_title"><xsl:value-of select="/squad/title"/></div>
                                    </td>
                                </tr>
                                <tr height="100%">
                                    <td width="100%" height="100%" valign="top">
                                        <div class="sqd_logo">
                                            <tr height="100%">
                                                <td width="100%" height="100%" valign="top">
                                                    <div class="sqd_logo">
                                                        <img alt="Picture: Squad Logo">
                                                            <xsl:attribute name="src">
                                                                <xsl:value-of select="concat(substring-before(/squad/picture_large,'.paa'),'.png')"/>
                                                            </xsl:attribute>
                                                        </img>
                                                    </div>
                                                </td>
                                            </tr>
                                        </div>
                                    </td>
                                </tr>
                                <tr height="10">
                                    <td class="sqd_website">
                                        Web site: <a>
                                            <xsl:attribute name="href"><xsl:value-of select="/squad/web"/></xsl:attribute>
                                            <xsl:value-of select="/squad/web"/>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="sqd_email">
                                        e-mail: <a>
                                            <xsl:attribute name="href">mailto:<xsl:value-of select="/squad/email"/></xsl:attribute>
                                            <xsl:value-of select="/squad/email"/>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                            <!-- Squad Info Table -->
                        </td>
                        <td class="right_row" valign="top">
                            <!-- Member-Info Table -->
                            <table class="member_info">
                                <tr>
                                    <th>Members</th>
                                    <th>E-mail</th>
                                    <th>ICQ</th>
                                    <th>Discord</th>
                                </tr>
                                <xsl:for-each select="/squad/member">
                                    <tr>
                                        <xsl:attribute name="class">
                                            <xsl:choose>
                                                <xsl:when test="position() mod 2 = 0">one</xsl:when>
                                                <xsl:otherwise>two</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:attribute>
                                        <td class="member_name" rowspan="2">
                                            <xsl:value-of select="name"/>
                                        </td>
                                        <td class="member_email">
                                            <a>
                                                <xsl:attribute name="href">mailto:<xsl:value-of select="email"/></xsl:attribute>
                                                <xsl:value-of select="email"/>
                                            </a>
                                        </td>
                                        <td class="member_icq">
                                            <xsl:value-of select="icq"/>
                                        </td>
                                        <td class="member_discord">
                                            <xsl:value-of select="discord"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <xsl:attribute name="class">
                                            <xsl:choose>
                                                <xsl:when test="position() mod 2 = 0">one</xsl:when>
                                                <xsl:otherwise>two</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:attribute>
                                        <td class="member_remark" colspan="3" valign="top">
                                            <xsl:value-of select="remark"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </table>
                            <!-- Member Info Table -->
                        </td>
                    </tr>
                </table>
                <!-- Main Table -->
                <p style="font-family:verdana;font-size:7pt;color:darkgrey;text-align:center;padding:10px;">
                    "squad.xsl" by <strong>Maj M. W. Powell</strong>, last change: 2020-04-16 10:25:00 PM
                </p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>