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
%#   File: hxx-hxx.t
%#
%# Author: $author$
%#   Date: 5/2/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%File_ifndef_begin,%(%else-then(%File_ifndef_begin%,%(#ifndef %File_ifndef_define%
#define %File_ifndef_define%
)%)%)%,%
%FILE_IFNDEF_BEGIN,%(%else-then(%FILE_IFNDEF_BEGIN%,%(%toupper(%File_ifndef_begin%)%)%)%)%,%
%file_ifndef_begin,%(%else-then(%_File_ifndef_begin%,%(%tolower(%File_ifndef_begin%)%)%)%)%,%
%File_ifndef_end,%(%else-then(%File_ifndef_end%,%(
#endif /// ndef %File_ifndef_define%
)%)%)%,%
%is_exported,%(%else-then(%is_exported%,%(%is_Exported%)%)%)%,%
%exported,%(%else-then(%if-no(%is_exported%,,%(%exported%)%)%,%(%if-no(%is_exported%,,%(%EXPORTED_PREFIX%EXPORTED%EXPORTED_SUFFIX%)%)%)%)%)%,%
%Exported,%(%else-then(%if-no(%is_exported%,,%(%Exported%)%)%,%(%exported%)%)%)%,%
%EXPORTED,%(%else-then(%EXPORTED%,%(%toupper(%Exported%)%)%)%)%,%
%exported,%(%else-then(%_exported%,%(%tolower(%Exported%)%)%)%)%,%
%%(%
%%File_ifndef_begin%%
%%then-if(%Includes%%Sys_includes%,
)%%
%%Namespace_begin%%
%%include(%include_path%/%Prefix%-hxx-hxx.t)%%
%%Namespace_end%%
%%File_ifndef_end%%
%)%)%