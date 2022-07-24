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
%#   File: windows-vsprops.t
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
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%if-no(%is_name%,,%(%name%)%)%,%(%if-no(%is_name%,,%(windows)%)%)%)%)%,%
%Name,%(%else-then(%if-no(%is_name%,,%(%Name%)%)%,%(%if-no(%is_name%,,%(%name%)%)%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_name%,%(%tolower(%Name%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%Name%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%if-no(%is_file%,,%(%file%)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_file%,%(%tolower(%File%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%filebase(%File%)%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_extension,%(%else-then(%is_extension%,%(%is_Extension%)%)%)%,%
%extension,%(%else-then(%if-no(%is_extension%,,%(%extension%)%)%,%(%if-no(%is_extension%,,%(%else-then(%fileextension(%File%)%,%(vsprops)%)%)%)%)%)%)%,%
%Extension,%(%else-then(%if-no(%is_extension%,,%(%Extension%)%)%,%(%if-no(%is_extension%,,%(%extension%)%)%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_extension%,%(%tolower(%Extension%)%)%)%)%,%
%is_usermacro,%(%else-then(%is_usermacro%,%(%is_UserMacro%)%)%)%,%
%usermacro,%(%else-then(%if-no(%is_usermacro%,,%(%usermacro%)%)%,%(%if-no(%is_usermacro%,,%()%)%)%)%)%,%
%UserMacro,%(%else-then(%if-no(%is_usermacro%,,%(%UserMacro%)%)%,%(%if-no(%is_usermacro%,,%(%usermacro%)%)%)%)%)%,%
%USERMACRO,%(%else-then(%USERMACRO%,%(%toupper(%UserMacro%)%)%)%)%,%
%usermacro,%(%else-then(%_usermacro%,%(%tolower(%UserMacro%)%)%)%)%,%
%is_DEFINES,%(%else-then(%is_DEFINES%,%(%is_defines%)%)%)%,%
%DEFINES,%(%else-then(%if-no(%is_DEFINES%,,%(%DEFINES%)%)%,%(%if-no(%is_DEFINES%,,%
%%(WINSOCK_2;DEFAULT_LOGGING_LEVELS_ERROR;XOS_CONSOLE_MAIN_MAIN)%)%)%)%)%,%
%is_INCLUDE_DIRS,%(%else-then(%is_INCLUDE_DIRS%,%(%is_include_dirs%)%)%)%,%
%INCLUDE_DIRS,%(%else-then(%if-no(%is_INCLUDE_DIRS%,,%(%INCLUDE_DIRS%)%)%,%(%if-no(%is_INCLUDE_DIRS%,,%
%%($(NADIR_SOURCE_DIR)/thirdparty/gnu/getopt;$(ROSTRA_SOURCE_DIR)/xos/platform/microsoft/windows/posix)%)%)%)%)%,%
%is_LIB_DIRS,%(%else-then(%is_LIB_DIRS%,%(%is_lib_dirs%)%)%)%,%
%LIB_DIRS,%(%else-then(%if-no(%is_LIB_DIRS%,,%(%LIB_DIRS%)%)%,%(%if-no(%is_LIB_DIRS%,,%(%
%)%)%)%)%)%,%
%is_LIBS,%(%else-then(%is_LIBS%,%(%is_libs%)%)%)%,%
%LIBS,%(%else-then(%if-no(%is_LIBS%,,%(%LIBS%)%)%,%(%if-no(%is_LIBS%,,%(%
%Ws2_32.lib%
%)%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-vsprops.t)%%
%<VisualStudioPropertySheet
    ProjectType="Visual C++"
    Version="8.00"
    Name="%Name%">

%if-then(%then-if(%parse(%UserMacro%,;,,,,%(    <UserMacro
        Name="%else-then(%left(%UserMacro%,=)%,%(%UserMacro%)%)%"
        Value="%right-of-left(%UserMacro%,=)%"
    />
)%,UserMacro)%,%(%
%    <!--
    =====================================================================
    =====================================================================
    -->

)%)%,%(
)%)%%
%    <!--
    =====================================================================
    =====================================================================
    -->

    <UserMacro
        Name="%NAME%_DEFINES"
        Value="%DEFINES%"
    />
    <UserMacro
        Name="%NAME%_DEBUG_DEFINES"
        Value="DEBUG_BUILD;$(%NAME%_DEFINES)"
    />
    <UserMacro
        Name="%NAME%_RELEASE_DEFINES"
        Value="RELEASE_BUILD;$(%NAME%_DEFINES)"
    />

    <!--
    =====================================================================
    =====================================================================
    -->

    <UserMacro
        Name="%NAME%_INCLUDE_DIRS"
        Value="%INCLUDE_DIRS%"
    />
    <UserMacro
        Name="%NAME%_LIB_DIRS"
        Value="%LIB_DIRS%"
    />
    <UserMacro
        Name="%NAME%_LIBS"
        Value="%LIBS%"
    />

    <!--
    =====================================================================
    =====================================================================
    -->

</VisualStudioPropertySheet>
%
%)%)%