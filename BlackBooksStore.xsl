<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
                <table id="listTable" class="indent">
                    <thead>
                        <tr>
                            <th colspan="6" align="left">BlackBooks BookStore</th>
                        </tr>
                        <tr>
                            <th>Select</th>
                            <th>Title</th>
                            <th>Price (€)</th>
                            <th>Author</th>
                            <th>Genre</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/catalog/theme">
                            <tr>
                                <td colspan="3">
                                    <xsl:value-of select="@name" />
                                </td>
                            </tr>
                            <xsl:for-each select="book">
                                <tr>
                                    <xsl:attribute name="kindle">
                                        <xsl:value-of select="boolean(./@kindle)" />
                                    </xsl:attribute>
                                    <td align="center">
                                        <input name="item0" type="checkbox" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="title" />
                                    </td>
                                    <td align="center">
                                        <xsl:value-of select="price" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="author" />
                                    </td>
                                    <td align="right">
                                        <xsl:value-of select="genre" />
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </tbody>
                </table><br/>
    </xsl:template>
</xsl:stylesheet>