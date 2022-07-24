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
%#   File: vsprops-vsprops.t
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
%is_framework,%(%else-then(%is_framework%,%(%is_Framework%)%)%)%,%
%framework,%(%else-then(%if-no(%is_framework%,,%(%framework%)%)%,%(%if-no(%is_framework%,,%(Framework)%)%)%)%)%,%
%Framework,%(%else-then(%if-no(%is_framework%,,%(%Framework%)%)%,%(%if-no(%is_framework%,,%(%framework%)%)%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_depends,%(%else-then(%is_depends%,%(%is_Depends%)%)%)%,%
%depends,%(%else-then(%if-no(%is_depends%,,%(%depends%)%)%,%(%if-no(%is_depends%,,%()%)%)%)%)%,%
%Depends,%(%else-then(%if-no(%is_depends%,,%(%Depends%)%)%,%(%if-no(%is_depends%,,%(%depends%)%)%)%)%)%,%
%DEPENDS,%(%else-then(%DEPENDS%,%(%toupper(%Depends%)%)%)%)%,%
%depends,%(%else-then(%_depends%,%(%tolower(%Depends%)%)%)%)%,%
%is_depend,%(%else-then(%is_depend%,%(%is_Depend%)%)%)%,%
%depend,%(%else-then(%if-no(%is_depend%,,%(%depend%)%)%,%(%if-no(%is_depend%,,%(%else-then(%Depend%,%(%Depends%)%)%)%)%)%)%)%,%
%Depend,%(%else-then(%if-no(%is_depend%,,%(%Depend%)%)%,%(%if-no(%is_depend%,,%(%depend%)%)%)%)%)%,%
%DEPEND,%(%else-then(%DEPEND%,%(%toupper(%Depend%)%)%)%)%,%
%depend,%(%else-then(%_depend%,%(%tolower(%Depend%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%if-no(%is_name%,,%(%name%)%)%,%(%if-no(%is_name%,,%(%Framework%)%)%)%)%)%,%
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
%is_source,%(%else-then(%is_source%,%(%is_Source%)%)%)%,%
%source,%(%else-then(%if-no(%is_source%,,%(%source%)%)%,%(%if-no(%is_source%,,%(source)%)%)%)%)%,%
%Source,%(%else-then(%if-no(%is_source%,,%(%Source%)%)%,%(%if-no(%is_source%,,%(%source%)%)%)%)%)%,%
%SOURCE,%(%else-then(%SOURCE%,%(%toupper(%Source%)%)%)%)%,%
%source,%(%else-then(%_source%,%(%tolower(%Source%)%)%)%)%,%
%is_build,%(%else-then(%is_build%,%(%is_Build%)%)%)%,%
%build,%(%else-then(%if-no(%is_build%,,%(%build%)%)%,%(%if-no(%is_build%,,%(build)%)%)%)%)%,%
%Build,%(%else-then(%if-no(%is_build%,,%(%Build%)%)%,%(%if-no(%is_build%,,%(%build%)%)%)%)%)%,%
%BUILD,%(%else-then(%BUILD%,%(%toupper(%Build%)%)%)%)%,%
%build,%(%else-then(%_build%,%(%tolower(%Build%)%)%)%)%,%
%is_usermacro,%(%else-then(%is_usermacro%,%(%is_UserMacro%)%)%)%,%
%usermacro,%(%else-then(%if-no(%is_usermacro%,,%(%usermacro%)%)%,%(%if-no(%is_usermacro%,,%()%)%)%)%)%,%
%UserMacro,%(%else-then(%if-no(%is_usermacro%,,%(%UserMacro%)%)%,%(%if-no(%is_usermacro%,,%(%usermacro%)%)%)%)%)%,%
%USERMACRO,%(%else-then(%USERMACRO%,%(%toupper(%UserMacro%)%)%)%)%,%
%usermacro,%(%else-then(%_usermacro%,%(%tolower(%UserMacro%)%)%)%)%,%
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
    %if-then(%then-if(%Depends%,%(Depends: )%)%,%(
    )%)%=====================================================================
    -->

    <UserMacro
        Name="%NAME%_GROUP"
        Value="%if-then(%Group%,/)%"
    />
    <UserMacro
        Name="%NAME%_NAME"
        Value="%Name%"
    />
    <UserMacro
        Name="%NAME%_VERSION"
        Value="%then-if(%Version%,-)%"
    />

    <!--
    =====================================================================
    =====================================================================
    -->

    <UserMacro
        Name="%NAME%_DIR"
        Value="$(%NAME%_GROUP)$(%NAME%_NAME)$(%NAME%_VERSION)"
    />
    <UserMacro
        Name="%NAME%_SOURCE_DIR"
        Value="$(SOURCE_ROOT_DIR)/$(%NAME%_DIR%())%%then-if(%Source%,/)%"
    />
    <UserMacro
        Name="%NAME%_BUILD_DIR"
        Value="$(SOURCE_BUILD_DIR)/$(%NAME%_DIR%())%%then-if(%Build%,/)%"
    />

    <!--
    =====================================================================
    =====================================================================
    -->

    <UserMacro
        Name="%NAME%_BUILD"
        Value="$(%NAME%_BUILD_DIR)/$(PlatformName)/$(VCVersion)/$(ConfigurationName)"
    />
    <UserMacro
        Name="%NAME%_OBJ"
        Value="$(%NAME%_BUILD)/obj/$(ProjectName)"
    />
    <UserMacro
        Name="%NAME%_LIB"
        Value="$(%NAME%_BUILD)/lib"
    />
    <UserMacro
        Name="%NAME%_BIN"
        Value="$(%NAME%_BUILD)/bin"
    />

    <!--
    =====================================================================
    =====================================================================
    -->

    <UserMacro
        Name="%NAME%_DEFINES"
        Value="XOS_LIB_%NAME%_VERSION_BUILD_DATE=%date()%"
    />
    <UserMacro
        Name="%NAME%_DEBUG_DEFINES"
        Value="%if-then(%parse(%DEPEND%,;,,,,%($%(()%%DEPEND%_DEBUG_DEFINES%())%;)%,DEPEND)%,%($%(()%WINDOWS_DEBUG_DEFINES%())%;)%)%$(%NAME%_DEFINES)"
    />
    <UserMacro
        Name="%NAME%_RELEASE_DEFINES"
        Value="%if-then(%parse(%DEPEND%,;,,,,%($%(()%%DEPEND%_RELEASE_DEFINES%())%;)%,DEPEND)%,%($%(()%WINDOWS_RELEASE_DEFINES%())%;)%)%$(%NAME%_DEFINES)"
    />

    <!--
    =====================================================================
    =====================================================================
    -->
  
    <UserMacro
        Name="%NAME%_INCLUDE_DIRS"
        Value="$(%NAME%_SOURCE_DIR%())%%if-then(%reverse-parse(%DEPEND%,;,,,,%(;$%(()%%DEPEND%_SOURCE_DIR%())%)%,DEPEND)%,%(;$%(()%WINDOWS_INCLUDE_DIRS%())%)%)%"
    />
    <UserMacro
        Name="%NAME%_LIB_DIRS"
        Value="$(%NAME%_LIB%())%%if-then(%reverse-parse(%DEPEND%,;,,,,%(;$%(()%%DEPEND%_LIB%())%)%,DEPEND)%,,%(;$%(()%WINDOWS_LIB_DIRS%())%)%)%"
    />
    <UserMacro
        Name="%NAME%_LIBS"
        Value="lib%Name%.lib%if-then(%reverse-parse(%Depend%,;,,,,%( lib%Depend%.lib)%,Depend)%,%( $%(()%WINDOWS_LIBS%())%)%)%"
    />
%
%%parse(%Apps%,;,,,,%(%
%%with(%
%APP,%(%else-then(%APP%,%(%toupper(%App%)%)%)%)%,%
%app,%(%else-then(%_app%,%(%tolower(%App%)%)%)%)%,%
%%(
    <!--
    =====================================================================
    =====================================================================
    -->

    <UserMacro
        Name="%NAME%_%APP%_DEFINES"
        Value=""
    />
    <UserMacro
        Name="%NAME%_%APP%_DEBUG_DEFINES"
        Value="$(%NAME%_%APP%_DEFINES);$(%NAME%_DEBUG_DEFINES)"
    />
    <UserMacro
        Name="%NAME%_%APP%_RELEASE_DEFINES"
        Value="$(%NAME%_%APP%_DEFINES);$(%NAME%_RELEASE_DEFINES)"
    />%
)%)%%
%)%,App)%

    <!--
    =====================================================================
    =====================================================================
    -->

</VisualStudioPropertySheet>
<!--
=====================================================================
$(%NAME%_BIN)
$(%NAME%_LIB)
$(%NAME%_OBJ)
..\vcversion.vsprops;..\..\vcproj.vsprops%parse(%depends%,;,,,,%(;..\..\%depend%.vsprops)%,depend)%;..\..\windows.vsprops;..\..\%name%.vsprops
$(%NAME%_INCLUDE_DIRS)
$(%NAME%_LIB_DIRS)
$(%NAME%_LIBS)
$(%NAME%_DEBUG_DEFINES)
$(%NAME%_RELEASE_DEFINES)
$(%NAME%_EXE_DEBUG_DEFINES)
$(%NAME%_EXE_RELEASE_DEFINES)
=====================================================================
-->
%
%)%)%