%########################################################################
%# Copyright (c) 1988-2021 $organization$
%#
%# This software is provided by the author and contributors ``as is'' 
%# and any express or implied warranties, including, but not limited to, 
%# the implied warranties of merchantability and fitness for a particular 
%# purpose are disclaimed. In no event shall the author or contributors 
%# be liable for any direct, indirect, incidental, special, exemplary, 
%# or consequential damages (including, but not limited to, procurement 
%# of substitute goods or services; loss of use, data, or profits; or 
%# business interruption) however caused and on any theory of liability, 
%# whether in contract, strict liability, or tort (including negligence 
%# or otherwise) arising in any way out of the use of this software, 
%# even if advised of the possibility of such damage.
%#
%#   File: transform-xslt.t
%#
%# Author: $author$
%#   Date: 12/7/2021
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_xsl_version,%(%else-then(%is_xsl_version%,%(%is_Xsl_version%)%)%)%,%
%xsl_version,%(%else-then(%if-no(%is_xsl_version%,,%(%xsl_version%)%)%,%(%if-no(%is_xsl_version%,,%(1.0)%)%)%)%)%,%
%Xsl_version,%(%else-then(%if-no(%is_xsl_version%,,%(%Xsl_version%)%)%,%(%if-no(%is_xsl_version%,,%(%xsl_version%)%)%)%)%)%,%
%XSL_VERSION,%(%else-then(%XSL_VERSION%,%(%toupper(%Xsl_version%)%)%)%)%,%
%xsl_version,%(%else-then(%_xsl_version%,%(%tolower(%Xsl_version%)%)%)%)%,%
%%(%
%%include(%Include_path%/xslt.t)%%
%
<!--
=====================================================================
=== transform
=====================================================================
-->
<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:exsl="http://exslt.org/common"
 xmlns:xalan="http://xml.apache.org/xalan"
 xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="xsl exsl xalan msxsl"
 version="%Xsl_version%">

    <!--
    =====================================================================
    === output
    =====================================================================
    -->
    <xsl:output
     method="html"
     indent="yes"
     version="yes"/>

    <!--
    =====================================================================
    === includes
    =====================================================================
    -->

    <!--
    =====================================================================
    === parameters
    =====================================================================
    -->

    <!--
    =====================================================================
    === variables
    =====================================================================
    -->

    <!--
    =====================================================================
    === templates
    =====================================================================
    -->

    <!--
    =====================================================================
    === template match "*"
    =====================================================================
    -->
    <xsl:template match="*">
        <!--
        =====================================================================
        === parameters
        =====================================================================
        -->

        <!--
        =====================================================================
        === variables
        =====================================================================
        -->

        <!--
        =====================================================================
        === body
        =====================================================================
        -->
        <b>Unexpected document type "</b>
        <xsl:value-of select="name()"/>
        <b>"</b>
    </xsl:template>
</xsl:transform>
%
%)%)%