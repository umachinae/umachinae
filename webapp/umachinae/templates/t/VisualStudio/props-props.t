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
%#   File: props-props.t
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
%framework,%(%else-then(%if-no(%is_framework%,,%(%framework%)%)%,%(%if-no(%is_framework%,,%(framework)%)%)%)%)%,%
%Framework,%(%else-then(%if-no(%is_framework%,,%(%Framework%)%)%,%(%if-no(%is_framework%,,%(%framework%)%)%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_project,%(%else-then(%is_project%,%(%is_Project%)%)%)%,%
%project,%(%else-then(%if-no(%is_project%,,%(%project%)%)%,%(%if-no(%is_project%,,%(%Framework%)%)%)%)%)%,%
%Project,%(%else-then(%if-no(%is_project%,,%(%Project%)%)%,%(%if-no(%is_project%,,%(%project%)%)%)%)%)%,%
%PROJECT,%(%else-then(%PROJECT%,%(%toupper(%Project%)%)%)%)%,%
%project,%(%else-then(%_project%,%(%tolower(%Project%)%)%)%)%,%
%is_name,%(%else-then(%is_name%,%(%is_Name%)%)%)%,%
%name,%(%else-then(%if-no(%is_name%,,%(%name%)%)%,%(%if-no(%is_name%,,%(%Project%)%)%)%)%)%,%
%Name,%(%else-then(%if-no(%is_name%,,%(%Name%)%)%,%(%if-no(%is_name%,,%(%name%)%)%)%)%)%,%
%NAME,%(%else-then(%NAME%,%(%toupper(%Name%)%)%)%)%,%
%name,%(%else-then(%_name%,%(%tolower(%Name%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%Name%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-props.t)%%
%<Project
  ToolsVersion="4.0"
  xmlns="http://schemas.microsoft.com/developer/msbuild/2003">

  <!--===============================================-->

  <PropertyGroup Label="UserMacros">
      <%NAME%_GROUP>%if-then(%Group%,/)%</%NAME%_GROUP>
      <%NAME%_NAME>%Name%</%NAME%_NAME>
      <%NAME%_VERSION>%then-if(%Version%,-)%</%NAME%_VERSION>

      <%NAME%_DIR>$(%NAME%_GROUP)$(%NAME%_NAME)$(%NAME%_VERSION)</%NAME%_DIR>
      <%NAME%_SOURCE_DIR>$(SOURCE_ROOT_DIR)/$(%NAME%_DIR)/src</%NAME%_SOURCE_DIR>
      <%NAME%_BUILD_DIR>$(SOURCE_BUILD_DIR)/$(%NAME%_DIR)/build</%NAME%_BUILD_DIR>
      <%NAME%_BUILD>$(%NAME%_BUILD_DIR)/$(PlatformName)/$(VCVersion)/$(Configuration)</%NAME%_BUILD>
      <%NAME%_OBJ>$(%NAME%_BUILD)/obj/$(ProjectName)</%NAME%_OBJ>
      <%NAME%_LIB>$(%NAME%_BUILD)/lib</%NAME%_LIB>
      <%NAME%_BIN>$(%NAME%_BUILD)/bin</%NAME%_BIN>

      <%NAME%_DEFINES></%NAME%_DEFINES>
      <%NAME%_DEBUG_DEFINES>$(%NAME%_DEFINES);$(%DEPENDS%_DEBUG_DEFINES)</%NAME%_DEBUG_DEFINES>
      <%NAME%_RELEASE_DEFINES>$(%NAME%_DEFINES);$(%DEPENDS%_RELEASE_DEFINES)</%NAME%_RELEASE_DEFINES>
      <%NAME%_INCLUDE_DIRS>$(%NAME%_SOURCE_DIR)</%NAME%_INCLUDE_DIRS>
      <VC10_%NAME%_INCLUDE_DIRS>$(%NAME%_INCLUDE_DIRS);$(VC10_%DEPENDS%_INCLUDE_DIRS)</VC10_%NAME%_INCLUDE_DIRS>
      <VC14_%NAME%_INCLUDE_DIRS>$(%NAME%_INCLUDE_DIRS);$(VC14_%DEPENDS%_INCLUDE_DIRS)</VC14_%NAME%_INCLUDE_DIRS>
      <%NAME%_LIB_DIRS>$(%NAME%_LIB);$(%DEPENDS%_LIB_DIRS)</%NAME%_LIB_DIRS>
      <%NAME%_LIBS>lib%Name%.lib;$(%DEPENDS%_LIBS)</%NAME%_LIBS>
  </PropertyGroup>

  <!--===============================================-->

  <ItemGroup>
      <BuildMacro Include="%NAME%_GROUP">
          <Value>$(%NAME%_GROUP)</Value>
      </BuildMacro>
      <BuildMacro Include="%NAME%_NAME">
          <Value>$(%NAME%_NAME)</Value>
      </BuildMacro>
      <BuildMacro Include="%NAME%_VERSION">
          <Value>$(%NAME%_VERSION)</Value>
      </BuildMacro>
      
      <BuildMacro Include="%NAME%_DIR">
          <Value>$(%NAME%_DIR)</Value>
      </BuildMacro>
      <BuildMacro Include="%NAME%_SOURCE_DIR">
          <Value>$(%NAME%_SOURCE_DIR)</Value>
      </BuildMacro>
      <BuildMacro Include="%NAME%_BUILD_DIR">
          <Value>$(%NAME%_BUILD_DIR)</Value>
      </BuildMacro>
      <BuildMacro Include="%NAME%_BUILD">
          <Value>$(%NAME%_BUILD)</Value>
      </BuildMacro>
      <BuildMacro Include="%NAME%_OBJ">
          <Value>$(%NAME%_OBJ)</Value>
      </BuildMacro>
      <BuildMacro Include="%NAME%_LIB">
          <Value>$(%NAME%_LIB)</Value>
      </BuildMacro>
      <BuildMacro Include="%NAME%_BIN">
          <Value>$(%NAME%_BIN)</Value>
      </BuildMacro>
      
      <BuildMacro Include="%NAME%_DEFINES">
          <Value>$(%NAME%_DEFINES)</Value>
      </BuildMacro>
      <BuildMacro Include="%NAME%_DEBUG_DEFINES">
          <Value>$(%NAME%_DEBUG_DEFINES)</Value>
      </BuildMacro>
      <BuildMacro Include="%NAME%_RELEASE_DEFINES">
          <Value>$(%NAME%_RELEASE_DEFINES)</Value>
      </BuildMacro>
      <BuildMacro Include="%NAME%_INCLUDE_DIRS">
          <Value>$(%NAME%_INCLUDE_DIRS)</Value>
      </BuildMacro>
      <BuildMacro Include="VC10_%NAME%_INCLUDE_DIRS">
          <Value>$(VC10_%NAME%_INCLUDE_DIRS)</Value>
      </BuildMacro>
      <BuildMacro Include="VC14_%NAME%_INCLUDE_DIRS">
          <Value>$(VC14_%NAME%_INCLUDE_DIRS)</Value>
      </BuildMacro>
      <BuildMacro Include="%NAME%_LIB_DIRS">
          <Value>$(%NAME%_LIB_DIRS)</Value>
      </BuildMacro>
      <BuildMacro Include="%NAME%_LIBS">
          <Value>$(%NAME%_LIBS)</Value>
      </BuildMacro>
  </ItemGroup>

  <!--===============================================-->

</Project>
%
%)%)%