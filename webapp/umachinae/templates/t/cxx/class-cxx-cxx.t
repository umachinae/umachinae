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
%#   File: class-cxx-cxx.t
%#
%# Author: $author$
%#   Date: 5/2/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_file_ifndef_instance_if_defined_instance,%(%else-then(%is_file_ifndef_instance_if_defined_instance%,%(%is_File_ifndef_instance_if_defined_instance%)%)%)%,%
%file_ifndef_instance_if_defined_instance,%(%else-then(%if-no(%is_file_ifndef_instance_if_defined_instance%,,%(%file_ifndef_instance_if_defined_instance%)%)%,%(%if-no(%is_file_ifndef_instance_if_defined_instance%,,%(%
%%if-then(%then-if(%File_ifndef_instance_defined%,#if )%,%(
static %Class% the_%Class%;
)%)%%if-then(%then-if(%File_ifndef_instance_defined%,#endif /// )%,%(
)%)%%
%)%)%)%)%)%,%
%File_ifndef_instance_if_defined_instance,%(%else-then(%if-no(%is_file_ifndef_instance_if_defined_instance%,,%(%File_ifndef_instance_if_defined_instance%)%)%,%(%if-no(%is_file_ifndef_instance_if_defined_instance%,,%(%file_ifndef_instance_if_defined_instance%)%)%)%)%)%,%
%FILE_IFNDEF_INSTANCE_IF_DEFINED_INSTANCE,%(%else-then(%FILE_IFNDEF_INSTANCE_IF_DEFINED_INSTANCE%,%(%toupper(%File_ifndef_instance_if_defined_instance%)%)%)%)%,%
%file_ifndef_instance_if_defined_instance,%(%else-then(%_file_ifndef_instance_if_defined_instance%,%(%tolower(%File_ifndef_instance_if_defined_instance%)%)%)%)%,%
%%(
%if(%Class%,%(%Separator_begin%///  Class: %ClassT%
%Separator_end%%File_ifndef_instance_if_defined_instance%
)%)%)%)%