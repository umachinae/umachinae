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
%#   File: windows-props.t
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
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(windows)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%if-no(%is_name%,,%(%name%)%)%,%(%if-no(%is_name%,,%(%Base%)%)%)%)%)%,%
%Name,%(%else-then(%if-no(%is_name%,,%(%Name%)%)%,%(%if-no(%is_name%,,%(%name%)%)%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_name%,%(%tolower(%Name%)%)%)%)%,%
%is_defines,%(%else-then(%is_defines%,%(%is_Defines%)%)%)%,%
%defines,%(%else-then(%if-no(%is_defines%,,%(%defines%)%)%,%(%if-no(%is_defines%,,%(%
%WINSOCK_2;DEFAULT_LOGGING_LEVELS_ERROR;XOS_CONSOLE_MAIN_MAIN%
%)%)%)%)%)%,%
%Defines,%(%else-then(%if-no(%is_defines%,,%(%Defines%)%)%,%(%if-no(%is_defines%,,%(%defines%)%)%)%)%)%,%
%DEFINES,%(%else-then(%DEFINES%,%(%toupper(%Defines%)%)%)%)%,%
%defines,%(%else-then(%_defines%,%(%tolower(%Defines%)%)%)%)%,%
%is_include_dirs,%(%else-then(%is_include_dirs%,%(%is_Include_dirs%)%)%)%,%
%include_dirs,%(%else-then(%if-no(%is_include_dirs%,,%(%include_dirs%)%)%,%(%if-no(%is_include_dirs%,,%(%
%$(NADIR_SOURCE_DIR)/thirdparty/gnu/getopt;$(ROSTRA_SOURCE_DIR)/xos/platform/microsoft/windows/posix%
%)%)%)%)%)%,%
%Include_dirs,%(%else-then(%if-no(%is_include_dirs%,,%(%Include_dirs%)%)%,%(%if-no(%is_include_dirs%,,%(%include_dirs%)%)%)%)%)%,%
%INCLUDE_DIRS,%(%else-then(%INCLUDE_DIRS%,%(%toupper(%Include_dirs%)%)%)%)%,%
%include_dirs,%(%else-then(%_include_dirs%,%(%tolower(%Include_dirs%)%)%)%)%,%
%is_lib_dirs,%(%else-then(%is_lib_dirs%,%(%is_Lib_dirs%)%)%)%,%
%lib_dirs,%(%else-then(%if-no(%is_lib_dirs%,,%(%lib_dirs%)%)%,%(%if-no(%is_lib_dirs%,,%(%
%)%)%)%)%)%,%
%Lib_dirs,%(%else-then(%if-no(%is_lib_dirs%,,%(%Lib_dirs%)%)%,%(%if-no(%is_lib_dirs%,,%(%lib_dirs%)%)%)%)%)%,%
%LIB_DIRS,%(%else-then(%LIB_DIRS%,%(%toupper(%Lib_dirs%)%)%)%)%,%
%lib_dirs,%(%else-then(%_lib_dirs%,%(%tolower(%Lib_dirs%)%)%)%)%,%
%is_libs,%(%else-then(%is_libs%,%(%is_Libs%)%)%)%,%
%libs,%(%else-then(%if-no(%is_libs%,,%(%libs%)%)%,%(%if-no(%is_libs%,,%(%
%Ws2_32.lib%
%)%)%)%)%)%,%
%Libs,%(%else-then(%if-no(%is_libs%,,%(%Libs%)%)%,%(%if-no(%is_libs%,,%(%libs%)%)%)%)%)%,%
%LIBS,%(%else-then(%LIBS%,%(%toupper(%Libs%)%)%)%)%,%
%libs,%(%else-then(%_libs%,%(%tolower(%Libs%)%)%)%)%,%
%is_buildmacros,%(%else-then(%is_buildmacros%,%(%is_BuildMacros%)%)%)%,%
%buildmacros,%(%else-then(%if-no(%is_buildmacros%,,%(%buildmacros%)%)%,%(%if-no(%is_buildmacros%,,%(BuildMacros)%)%)%)%)%,%
%BuildMacros,%(%else-then(%if-no(%is_buildmacros%,,%(%BuildMacros%)%)%,%(%if-no(%is_buildmacros%,,%(%buildmacros%)%)%)%)%)%,%
%BUILDMACROS,%(%else-then(%BUILDMACROS%,%(%toupper(%BuildMacros%)%)%)%)%,%
%buildmacros,%(%else-then(%_buildmacros%,%(%tolower(%BuildMacros%)%)%)%)%,%
%%(%
%%include(%Include_path%/props.t)%%
%)%)%