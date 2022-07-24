%########################################################################
%# Copyright (c) 1988-2022 $organization$
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
%#   File: file-vcxproj.t
%#
%# Author: $author$
%#   Date: 6/9/2022
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_xml_version,%(%else-then(%is_xml_version%,%(%is_Xml_version%)%)%)%,%
%xml_version,%(%else-then(%if-no(%is_xml_version%,,%(%xml_version%)%)%,%(%if-no(%is_xml_version%,,%(1.0)%)%)%)%)%,%
%Xml_version,%(%else-then(%if-no(%is_xml_version%,,%(%Xml_version%)%)%,%(%if-no(%is_xml_version%,,%(%xml_version%)%)%)%)%)%,%
%XML_VERSION,%(%else-then(%XML_VERSION%,%(%toupper(%Xml_version%)%)%)%)%,%
%xml_version,%(%else-then(%_xml_version%,%(%tolower(%Xml_version%)%)%)%)%,%
%is_xml_encoding,%(%else-then(%is_xml_encoding%,%(%is_Xml_encoding%)%)%)%,%
%xml_encoding,%(%else-then(%if-no(%is_xml_encoding%,,%(%xml_encoding%)%)%,%(%if-no(%is_xml_encoding%,,%(utf-8)%)%)%)%)%,%
%Xml_encoding,%(%else-then(%if-no(%is_xml_encoding%,,%(%Xml_encoding%)%)%,%(%if-no(%is_xml_encoding%,,%(%xml_encoding%)%)%)%)%)%,%
%XML_ENCODING,%(%else-then(%XML_ENCODING%,%(%toupper(%Xml_encoding%)%)%)%)%,%
%xml_encoding,%(%else-then(%_xml_encoding%,%(%tolower(%Xml_encoding%)%)%)%)%,%
%is_typeextension,%(%else-then(%is_typeextension%,%(%is_TypeExtension%)%)%)%,%
%typeextension,%(%else-then(%if-no(%is_typeextension%,,%(%typeextension%)%)%,%(%if-no(%is_typeextension%,,%(vcxproj)%)%)%)%)%,%
%TypeExtension,%(%else-then(%if-no(%is_typeextension%,,%(%TypeExtension%)%)%,%(%if-no(%is_typeextension%,,%(%typeextension%)%)%)%)%)%,%
%TYPEEXTENSION,%(%else-then(%TYPEEXTENSION%,%(%toupper(%TypeExtension%)%)%)%)%,%
%typeextension,%(%else-then(%_typeextension%,%(%tolower(%TypeExtension%)%)%)%)%,%
%%(%
%%include(%Include_path%/vstudio-file.t)%%
%)%)%