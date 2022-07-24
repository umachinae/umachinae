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
%#   File: cxx-cxx.t
%#
%# Author: $author$
%#   Date: 5/2/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_file_ifndef_instance,%(%else-then(%is_file_ifndef_instance%,%(%is_File_ifndef_instance%)%)%)%,%
%file_ifndef_instance,%(%else-then(%if-no(%is_file_ifndef_instance%,,%(%file_ifndef_instance%)%)%,%(%if-no(%is_file_ifndef_instance%,,%(%left-of-right(%File_ifndef_define%,_)%_instance)%)%)%)%)%,%
%File_ifndef_instance,%(%else-then(%if-no(%is_file_ifndef_instance%,,%(%File_ifndef_instance%)%)%,%(%if-no(%is_file_ifndef_instance%,,%(%file_ifndef_instance%)%)%)%)%)%,%
%FILE_IFNDEF_INSTANCE,%(%else-then(%FILE_IFNDEF_INSTANCE%,%(%toupper(%File_ifndef_instance%)%)%)%)%,%
%file_ifndef_instance,%(%else-then(%_file_ifndef_instance%,%(%tolower(%File_ifndef_instance%)%)%)%)%,%
%is_file_ifndef_instance_define,%(%else-then(%is_file_ifndef_instance_define%,%(%is_File_ifndef_instance_define%)%)%)%,%
%file_ifndef_instance_define,%(%else-then(%if-no(%is_file_ifndef_instance_define%,,%(%file_ifndef_instance_define%)%)%,%(%if-no(%is_file_ifndef_instance_define%,,%(%then-if(%FILE_IFNDEF_INSTANCE%,///#define )%)%)%)%)%)%,%
%File_ifndef_instance_define,%(%else-then(%if-no(%is_file_ifndef_instance_define%,,%(%File_ifndef_instance_define%)%)%,%(%if-no(%is_file_ifndef_instance_define%,,%(%file_ifndef_instance_define%)%)%)%)%)%,%
%FILE_IFNDEF_INSTANCE_DEFINE,%(%else-then(%FILE_IFNDEF_INSTANCE_DEFINE%,%(%toupper(%File_ifndef_instance_define%)%)%)%)%,%
%file_ifndef_instance_define,%(%else-then(%_file_ifndef_instance_define%,%(%tolower(%File_ifndef_instance_define%)%)%)%)%,%
%is_file_ifndef_instance_defined,%(%else-then(%is_file_ifndef_instance_defined%,%(%is_File_ifndef_instance_defined%)%)%)%,%
%file_ifndef_instance_defined,%(%else-then(%if-no(%is_file_ifndef_instance_defined%,,%(%file_ifndef_instance_defined%)%)%,%(%if-no(%is_file_ifndef_instance_defined%,,%(defined(%FILE_IFNDEF_INSTANCE%))%)%)%)%)%,%
%File_ifndef_instance_defined,%(%else-then(%if-no(%is_file_ifndef_instance_defined%,,%(%File_ifndef_instance_defined%)%)%,%(%if-no(%is_file_ifndef_instance_defined%,,%(%file_ifndef_instance_defined%)%)%)%)%)%,%
%FILE_IFNDEF_INSTANCE_DEFINED,%(%else-then(%FILE_IFNDEF_INSTANCE_DEFINED%,%(%toupper(%File_ifndef_instance_defined%)%)%)%)%,%
%file_ifndef_instance_defined,%(%else-then(%_file_ifndef_instance_defined%,%(%tolower(%File_ifndef_instance_defined%)%)%)%)%,%
%is_file_ifndef_instance_if_defined,%(%else-then(%is_file_ifndef_instance_if_defined%,%(%is_File_ifndef_instance_if_defined%)%)%)%,%
%file_ifndef_instance_if_defined,%(%else-then(%if-no(%is_file_ifndef_instance_if_defined%,,%(%file_ifndef_instance_if_defined%)%)%,%(%if-no(%is_file_ifndef_instance_if_defined%,,%(%
%%if-then(%then-if(%File_ifndef_instance_defined%,#if !)%,%(
%File_ifndef_instance_define%
)%)%%if-then(%then-if(%File_ifndef_instance_defined%,#endif /// !)%,%(
)%)%%
%)%)%)%)%)%,%
%File_ifndef_instance_if_defined,%(%else-then(%if-no(%is_file_ifndef_instance_if_defined%,,%(%File_ifndef_instance_if_defined%)%)%,%(%if-no(%is_file_ifndef_instance_if_defined%,,%(%file_ifndef_instance_if_defined%)%)%)%)%)%,%
%FILE_IFNDEF_INSTANCE_IF_DEFINED,%(%else-then(%FILE_IFNDEF_INSTANCE_IF_DEFINED%,%(%toupper(%File_ifndef_instance_if_defined%)%)%)%)%,%
%file_ifndef_instance_if_defined,%(%else-then(%_file_ifndef_instance_if_defined%,%(%tolower(%File_ifndef_instance_if_defined%)%)%)%)%,%
%%(#include "%if-then(%File_directory%,/)%%Name%.%Header%"
%
%%then-if(%if(%Class%,%(%File_ifndef_instance_if_defined%)%)%,%(
)%)%%
%%Namespace_begin%%
%%include(%include_path%/%Prefix%-cxx-cxx.t)%%
%%Namespace_end%%
%)%)%