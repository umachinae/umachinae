%########################################################################
%# Copyright (c) 1988-2019 $organization$
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
%#   File: hxx-cxx.t
%#
%# Author: $author$
%#   Date: 5/2/2019, 7/1/2021
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%Header,%(%else-then(%Header%,%(%if(%equal(c,%Extension%)%,h,%if(%equal(cpp,%Extension%)%,hpp,%if(%equal(cxx,%Extension%)%,hxx,%else-then(%Extension%,hxx)%)%)%)%)%)%)%,%
%HEADER,%(%else-then(%HEADER%,%(%toupper(%Header%)%)%)%)%,%
%header,%(%else-then(%_Header%,%(%tolower(%Header%)%)%)%)%,%
%Body,%(%else-then(%Body%,%(%if(%equal(h,%Header%)%,c,%(%if(%equal(hpp,%Header%)%,cpp,cxx)%)%)%)%)%)%,%
%BODY,%(%else-then(%BODY%,%(%toupper(%Body%)%)%)%)%,%
%body,%(%else-then(%_Body%,%(%tolower(%Body%)%)%)%)%,%
%is_framework,%(%else-then(%is_framework%,%(%is_Framework%)%)%)%,%
%framework,%(%else-then(%if-no(%is_framework%,,%(%framework%)%)%,%(%if-no(%is_framework%,,%(xos)%)%)%)%)%,%
%Framework,%(%else-then(%if-no(%is_framework%,,%(%Framework%)%)%,%(%if-no(%is_framework%,,%(%framework%)%)%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(base)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%File,%(%else-then(%File%,%(%else-then(%Class%,%(file)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_File%,%(%tolower(%File%)%)%)%)%,%
%Name,%(%else-then(%Name%,%(%else-then(%filebase(%File%)%,%File%)%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_Name%,%(%tolower(%Name%)%)%)%)%,%
%Extension,%(%else-then(%if-no(%is_Extension%,,%Extension%)%,%(%else-then(%fileextension(%File%)%,%Header%)%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%Headers,%(%else-then(%Headers%,%(hpp;hxx;h)%)%)%,%
%HEADERS,%(%else-then(%HEADERS%,%(%toupper(%Headers%)%)%)%)%,%
%headers,%(%else-then(%_Headers%,%(%tolower(%Headers%)%)%)%)%,%
%Header_or_Body,%(%else-then(%Header_or_Body%,%(%if(%parse(%Headers%,;,,,,%(%equal(%Header%,%Extension%)%)%,Header)%,%Header%,%Body%)%)%)%)%,%
%HEADER_OR_BODY,%(%else-then(%HEADER_OR_BODY%,%(%toupper(%Header_or_Body%)%)%)%)%,%
%header_or_body,%(%else-then(%_Header_or_Body%,%(%tolower(%Header_or_Body%)%)%)%)%,%
%Namespace,%(%else-then(%if-no(%is_Namespace%,,%Namespace%)%,%(%if-no(%is_Namespace%,,%Framework%)%)%)%)%,%
%NAMESPACE,%(%else-then(%NAMESPACE%,%(%toupper(%Namespace%)%)%)%)%,%
%namespace,%(%else-then(%_Namespace%,%(%tolower(%Namespace%)%)%)%)%,%
%Namespace_begin,%(%
%%then-if(%parse(%Namespace%,/,,,,%(namespace %ns% {
)%,ns)%,%(
)%)%%
%)%,%
%NAMESPACE_BEGIN,%(%else-then(%NAMESPACE_BEGIN%,%(%toupper(%Namespace_begin%)%)%)%)%,%
%namespace_begin,%(%else-then(%_Namespace_begin%,%(%tolower(%Namespace_begin%)%)%)%)%,%
%Namespace_end,%(%
%%then-if(%reverse-parse(%Namespace%,/,,,,%(} /// namespace %ns%
)%,ns)%,%(
)%)%%
%)%,%
%NAMESPACE_END,%(%else-then(%NAMESPACE_END%,%(%toupper(%Namespace_end%)%)%)%)%,%
%namespace_end,%(%else-then(%_Namespace_end%,%(%tolower(%Namespace_end%)%)%)%)%,%
%File_ifndef,%(%else-then(%if-no(%is_File_ifndef%,,%File_ifndef%)%,%(%if-no(%is_File_ifndef%,,%else-then(%Namespace%,%(xos/base)%)%)%)%)%)%,%
%FILE_IFNDEF,%(%else-then(%FILE_IFNDEF%,%(%toupper(%File_ifndef%)%)%)%)%,%
%file_ifndef,%(%else-then(%_File_ifndef%,%(%tolower(%File_ifndef%)%)%)%)%,%
%File_ifndef_define_prefix,%(%else-then(%File_ifndef_define_prefix%,%()%)%)%,%
%FILE_IFNDEF_DEFINE_PREFIX,%(%else-then(%FILE_IFNDEF_DEFINE_PREFIX%,%(%toupper(%File_ifndef_define_prefix%)%)%)%)%,%
%file_ifndef_define_prefix,%(%else-then(%_File_ifndef_define_prefix%,%(%tolower(%File_ifndef_define_prefix%)%)%)%)%,%
%File_ifndef_define_suffix,%(%else-then(%File_ifndef_define_suffix%,%()%)%)%,%
%FILE_IFNDEF_DEFINE_SUFFIX,%(%else-then(%FILE_IFNDEF_DEFINE_SUFFIX%,%(%toupper(%File_ifndef_define_suffix%)%)%)%)%,%
%file_ifndef_define_suffix,%(%else-then(%_File_ifndef_define_suffix%,%(%tolower(%File_ifndef_define_suffix%)%)%)%)%,%
%File_ifndef_define,%(%else-then(%File_ifndef_define%,%(%File_ifndef_define_prefix%%parse(%FILE_IFNDEF%,/,,_,,%(%IFNDEF%)%,IFNDEF)%_%NAME%_%EXTENSION%%File_ifndef_define_suffix%)%)%)%,%
%FILE_IFNDEF_DEFINE,%(%else-then(%FILE_IFNDEF_DEFINE%,%(%toupper(%File_ifndef_define%)%)%)%)%,%
%file_ifndef_define,%(%else-then(%_File_ifndef_define%,%(%tolower(%File_ifndef_define%)%)%)%)%,%
%File_directory,%(%else-then(%if-no(%is_File_directory%,,%File_directory%)%,%(%if-no(%is_File_directory%,,%parse(%File_ifndef%,_,,/)%)%)%)%)%,%
%FILE_DIRECTORY,%(%else-then(%FILE_DIRECTORY%,%(%toupper(%File_directory%)%)%)%)%,%
%file_directory,%(%else-then(%_File_directory%,%(%tolower(%File_directory%)%)%)%)%,%
%Include,%(%else-then(%if-no(%is_Include%,,%Include%)%,%(%if-no(%is_Include%,,xos/base/%Base%.%Header%)%)%)%)%,%
%INCLUDE,%(%else-then(%INCLUDE%,%(%toupper(%Include%)%)%)%)%,%
%include,%(%else-then(%_Include%,%(%tolower(%Include%)%)%)%)%,%
%Sys_header,%(%else-then(%Sys_header%,%(%if(%equal(%Header%,h)%,.h)%)%)%)%,%
%SYS_HEADER,%(%else-then(%SYS_HEADER%,%(%toupper(%Sys_header%)%)%)%)%,%
%sys_header,%(%else-then(%_Sys_header%,%(%tolower(%Sys_header%)%)%)%)%,%
%Sys_include,%(%else-then(%if-no(%is_Sys_include%,,%Sys_include%)%,%(%if-no(%is_Sys_include%,,string%Sys_header%)%)%)%)%,%
%SYS_INCLUDE,%(%else-then(%SYS_INCLUDE%,%(%toupper(%Sys_include%)%)%)%)%,%
%sys_include,%(%else-then(%_Sys_include%,%(%tolower(%Sys_include%)%)%)%)%,%
%Includes,%(%else-then(%Includes%,%(%parse(%Include%,;,,,%(#include "%Include%"
)%,Include)%)%)%)%,%
%INCLUDES,%(%else-then(%INCLUDES%,%(%toupper(%Includes%)%)%)%)%,%
%includes,%(%else-then(%_Includes%,%(%tolower(%Includes%)%)%)%)%,%
%Sys_includes,%(%else-then(%Sys_includes%,%(%parse(%Sys_include%,;,,,%(#include <%Include%>
)%,Include)%)%)%)%,%
%SYS_INCLUDES,%(%else-then(%SYS_INCLUDES%,%(%toupper(%Sys_includes%)%)%)%)%,%
%sys_includes,%(%else-then(%_Sys_includes%,%(%tolower(%Sys_includes%)%)%)%)%,%
%FILE_IFNDEF_END,%(%else-then(%FILE_IFNDEF_END%,%(%toupper(%File_ifndef_end%)%)%)%)%,%
%file_ifndef_end,%(%else-then(%_File_ifndef_end%,%(%tolower(%File_ifndef_end%)%)%)%)%,%
%is_exported_prefix,%(%else-then(%is_exported_prefix%,%(%is_Exported_prefix%)%)%)%,%
%exported_prefix,%(%else-then(%if-no(%is_exported_prefix%,,%(%exported_prefix%)%)%,%(%if-no(%is_exported_prefix%,,%(%FILE_IFNDEF_DEFINE_PREFIX%)%)%)%)%)%,%
%Exported_prefix,%(%else-then(%if-no(%is_exported_prefix%,,%(%Exported_prefix%)%)%,%(%exported_prefix%)%)%)%,%
%EXPORTED_PREFIX,%(%else-then(%EXPORTED_PREFIX%,%(%toupper(%Exported_prefix%)%)%)%)%,%
%exported_prefix,%(%else-then(%_exported_prefix%,%(%tolower(%Exported_prefix%)%)%)%)%,%
%is_exported_suffix,%(%else-then(%is_exported_suffix%,%(%is_Exported_suffix%)%)%)%,%
%exported_suffix,%(%else-then(%if-no(%is_exported_suffix%,,%(%exported_suffix%)%)%,%(%if-no(%is_exported_suffix%,,%(%FILE_IFNDEF_DEFINE_SUFFIX%)%)%)%)%)%,%
%Exported_suffix,%(%else-then(%if-no(%is_exported_suffix%,,%(%Exported_suffix%)%)%,%(%exported_suffix%)%)%)%,%
%EXPORTED_SUFFIX,%(%else-then(%EXPORTED_SUFFIX%,%(%toupper(%Exported_suffix%)%)%)%)%,%
%exported_suffix,%(%else-then(%_exported_suffix%,%(%tolower(%Exported_suffix%)%)%)%)%,%
%is_separator,%(%else-then(%is_separator%,%(%is_Separator%)%)%)%,%
%separator,%(%else-then(%if-no(%is_separator%,,%(%separator%)%)%,%(%if-no(%is_separator%,,%(%if(%equal(hxx,%Extension%)%,///////////////////////////////////////////////////////////////////////)%)%)%)%)%)%,%
%Separator,%(%else-then(%if-no(%is_separator%,,%(%Separator%)%)%,%(%if-no(%is_separator%,,%(%separator%)%)%)%)%)%,%
%SEPARATOR,%(%else-then(%SEPARATOR%,%(%toupper(%Separator%)%)%)%)%,%
%separator,%(%else-then(%_separator%,%(%tolower(%Separator%)%)%)%)%,%
%is_separator_begin,%(%else-then(%is_separator_begin%,%(%is_Separator_begin%)%)%)%,%
%separator_begin,%(%else-then(%if-no(%is_separator_begin%,,%(%separator_begin%)%)%,%(%if-no(%is_separator_begin%,,%(%if-then(%Separator%,
)%)%)%)%)%)%,%
%Separator_begin,%(%else-then(%if-no(%is_separator_begin%,,%(%Separator_begin%)%)%,%(%if-no(%is_separator_begin%,,%(%separator_begin%)%)%)%)%)%,%
%SEPARATOR_BEGIN,%(%else-then(%SEPARATOR_BEGIN%,%(%toupper(%Separator_begin%)%)%)%)%,%
%separator_begin,%(%else-then(%_separator_begin%,%(%tolower(%Separator_begin%)%)%)%)%,%
%is_separator_end,%(%else-then(%is_separator_end%,%(%is_Separator_end%)%)%)%,%
%separator_end,%(%else-then(%if-no(%is_separator_end%,,%(%separator_end%)%)%,%(%if-no(%is_separator_end%,,%(%if-then(%Separator%,
)%)%)%)%)%)%,%
%Separator_end,%(%else-then(%if-no(%is_separator_end%,,%(%Separator_end%)%)%,%(%if-no(%is_separator_end%,,%(%separator_end%)%)%)%)%)%,%
%SEPARATOR_END,%(%else-then(%SEPARATOR_END%,%(%toupper(%Separator_end%)%)%)%)%,%
%separator_end,%(%else-then(%_separator_end%,%(%tolower(%Separator_end%)%)%)%)%,%
%%(%
%%include(%include_path%/file-%Header%-%Body%.t)%%
%%include(%include_path%/%Header_or_Body%-%Header_or_Body%.t)%%
%)%)%