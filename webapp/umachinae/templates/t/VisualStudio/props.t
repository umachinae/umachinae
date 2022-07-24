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
%#   File: props.t
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
%%(%
%%include(%Include_path%/file-props.t)%%
%<Project
  ToolsVersion="4.0"
  xmlns="http://schemas.microsoft.com/developer/msbuild/2003">

  <!--===============================================-->

  <PropertyGroup Label="UserMacros">%
%%parse(%BuildMacros%,;,,,,%(%
%%with(%
%is_buildmacro_name,%(%else-then(%is_buildmacro_name%,%(%is_BuildMacro_name%)%)%)%,%
%buildmacro_name,%(%else-then(%if-no(%is_buildmacro_name%,,%(%buildmacro_name%)%)%,%(%if-no(%is_buildmacro_name%,,%(%left(%BuildMacro%,=)%)%)%)%)%)%,%
%BuildMacro_name,%(%else-then(%if-no(%is_buildmacro_name%,,%(%BuildMacro_name%)%)%,%(%if-no(%is_buildmacro_name%,,%(%buildmacro_name%)%)%)%)%)%,%
%BUILDMACRO_NAME,%(%else-then(%BUILDMACRO_NAME%,%(%toupper(%BuildMacro_name%)%)%)%)%,%
%buildmacro_name,%(%else-then(%_buildmacro_name%,%(%tolower(%BuildMacro_name%)%)%)%)%,%
%is_buildmacro_value,%(%else-then(%is_buildmacro_value%,%(%is_BuildMacro_value%)%)%)%,%
%buildmacro_value,%(%else-then(%if-no(%is_buildmacro_value%,,%(%buildmacro_value%)%)%,%(%if-no(%is_buildmacro_value%,,%(%right(%BuildMacro%,=)%)%)%)%)%)%,%
%BuildMacro_value,%(%else-then(%if-no(%is_buildmacro_value%,,%(%BuildMacro_value%)%)%,%(%if-no(%is_buildmacro_value%,,%(%buildmacro_value%)%)%)%)%)%,%
%BUILDMACRO_VALUE,%(%else-then(%BUILDMACRO_VALUE%,%(%toupper(%BuildMacro_value%)%)%)%)%,%
%buildmacro_value,%(%else-then(%_buildmacro_value%,%(%tolower(%BuildMacro_value%)%)%)%)%,%
%%(
      <%BuildMacro_name%>%BuildMacro_value%</%BuildMacro_name%>)%)%%
%)%,BuildMacro)%
  </PropertyGroup>

  <!--===============================================-->

  <ItemGroup>%
%%parse(%BuildMacros%,;,,,,%(%
%%with(%
%is_buildmacro_name,%(%else-then(%is_buildmacro_name%,%(%is_BuildMacro_name%)%)%)%,%
%buildmacro_name,%(%else-then(%if-no(%is_buildmacro_name%,,%(%buildmacro_name%)%)%,%(%if-no(%is_buildmacro_name%,,%(%left(%BuildMacro%,=)%)%)%)%)%)%,%
%BuildMacro_name,%(%else-then(%if-no(%is_buildmacro_name%,,%(%BuildMacro_name%)%)%,%(%if-no(%is_buildmacro_name%,,%(%buildmacro_name%)%)%)%)%)%,%
%BUILDMACRO_NAME,%(%else-then(%BUILDMACRO_NAME%,%(%toupper(%BuildMacro_name%)%)%)%)%,%
%buildmacro_name,%(%else-then(%_buildmacro_name%,%(%tolower(%BuildMacro_name%)%)%)%)%,%
%is_buildmacro_value,%(%else-then(%is_buildmacro_value%,%(%is_BuildMacro_value%)%)%)%,%
%buildmacro_value,%(%else-then(%if-no(%is_buildmacro_value%,,%(%buildmacro_value%)%)%,%(%if-no(%is_buildmacro_value%,,%(%right(%BuildMacro%,=)%)%)%)%)%)%,%
%BuildMacro_value,%(%else-then(%if-no(%is_buildmacro_value%,,%(%BuildMacro_value%)%)%,%(%if-no(%is_buildmacro_value%,,%(%buildmacro_value%)%)%)%)%)%,%
%BUILDMACRO_VALUE,%(%else-then(%BUILDMACRO_VALUE%,%(%toupper(%BuildMacro_value%)%)%)%)%,%
%buildmacro_value,%(%else-then(%_buildmacro_value%,%(%tolower(%BuildMacro_value%)%)%)%)%,%
%%(
      <BuildMacro Include="%BuildMacro_name%">
          <Value>$(%BuildMacro_name%)</Value>
      </BuildMacro>)%)%%
%)%,BuildMacro)%
  </ItemGroup>

  <!--===============================================-->

</Project>
%
%)%)%