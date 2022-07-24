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
%#   File: h-h.t
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
#endif /*/ %File_ifndef_define% /*/
)%)%)%,%
%FILE_IFNDEF_END,%(%else-then(%FILE_IFNDEF_END%,%(%toupper(%File_ifndef_end%)%)%)%)%,%
%file_ifndef_end,%(%else-then(%_File_ifndef_end%,%(%tolower(%File_ifndef_end%)%)%)%)%,%
%%(%
%%File_ifndef_begin%%
%%then-if(%Includes%%Sys_includes%,
)%%
%
#if defined(__cplusplus)
extern "C" {
#endif /*/ defined(__cplusplus) /*/

#if defined(__cplusplus)
} /*/ extern "C" /*/
#endif /*/ defined(__cplusplus) /*/
%
%%File_ifndef_end%%
%)%)%