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
%#   File: vstudio-vcxproj.t
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
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%Project%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_xml_namespace,%(%else-then(%is_xml_namespace%,%(%is_Xml_namespace%)%)%)%,%
%xml_namespace,%(%else-then(%if-no(%is_xml_namespace%,,%(%xml_namespace%)%)%,%(%if-no(%is_xml_namespace%,,%(http://schemas.microsoft.com/developer/msbuild/2003)%)%)%)%)%,%
%Xml_namespace,%(%else-then(%if-no(%is_xml_namespace%,,%(%Xml_namespace%)%)%,%(%if-no(%is_xml_namespace%,,%(%xml_namespace%)%)%)%)%)%,%
%XML_NAMESPACE,%(%else-then(%XML_NAMESPACE%,%(%toupper(%Xml_namespace%)%)%)%)%,%
%xml_namespace,%(%else-then(%_xml_namespace%,%(%tolower(%Xml_namespace%)%)%)%)%,%
%is_toolsversion,%(%else-then(%is_toolsversion%,%(%is_ToolsVersion%)%)%)%,%
%toolsversion,%(%else-then(%if-no(%is_toolsversion%,,%(%toolsversion%)%)%,%(%if-no(%is_toolsversion%,,%(4.0)%)%)%)%)%,%
%ToolsVersion,%(%else-then(%if-no(%is_toolsversion%,,%(%ToolsVersion%)%)%,%(%if-no(%is_toolsversion%,,%(%toolsversion%)%)%)%)%)%,%
%TOOLSVERSION,%(%else-then(%TOOLSVERSION%,%(%toupper(%ToolsVersion%)%)%)%)%,%
%toolsversion,%(%else-then(%_toolsversion%,%(%tolower(%ToolsVersion%)%)%)%)%,%
%is_defaulttargets,%(%else-then(%is_defaulttargets%,%(%is_DefaultTargets%)%)%)%,%
%defaulttargets,%(%else-then(%if-no(%is_defaulttargets%,,%(%defaulttargets%)%)%,%(%if-no(%is_defaulttargets%,,%(Build)%)%)%)%)%,%
%DefaultTargets,%(%else-then(%if-no(%is_defaulttargets%,,%(%DefaultTargets%)%)%,%(%if-no(%is_defaulttargets%,,%(%defaulttargets%)%)%)%)%)%,%
%DEFAULTTARGETS,%(%else-then(%DEFAULTTARGETS%,%(%toupper(%DefaultTargets%)%)%)%)%,%
%defaulttargets,%(%else-then(%_defaulttargets%,%(%tolower(%DefaultTargets%)%)%)%)%,%
%is_projectguid,%(%else-then(%is_projectguid%,%(%is_ProjectGuid%)%)%)%,%
%projectguid,%(%else-then(%if-no(%is_projectguid%,,%(%projectguid%)%)%,%(%if-no(%is_projectguid%,,%(%uuid()%)%)%)%)%)%,%
%ProjectGuid,%(%else-then(%if-no(%is_projectguid%,,%(%ProjectGuid%)%)%,%(%if-no(%is_projectguid%,,%(%projectguid%)%)%)%)%)%,%
%PROJECTGUID,%(%else-then(%PROJECTGUID%,%(%toupper(%ProjectGuid%)%)%)%)%,%
%projectguid,%(%else-then(%_projectguid%,%(%tolower(%ProjectGuid%)%)%)%)%,%
%is_rootnamespace,%(%else-then(%is_rootnamespace%,%(%is_RootNamespace%)%)%)%,%
%rootnamespace,%(%else-then(%if-no(%is_rootnamespace%,,%(%rootnamespace%)%)%,%(%if-no(%is_rootnamespace%,,%(%Project%)%)%)%)%)%,%
%RootNamespace,%(%else-then(%if-no(%is_rootnamespace%,,%(%RootNamespace%)%)%,%(%if-no(%is_rootnamespace%,,%(%rootnamespace%)%)%)%)%)%,%
%ROOTNAMESPACE,%(%else-then(%ROOTNAMESPACE%,%(%toupper(%RootNamespace%)%)%)%)%,%
%rootnamespace,%(%else-then(%_rootnamespace%,%(%tolower(%RootNamespace%)%)%)%)%,%
%is_projectconfigurations,%(%else-then(%is_projectconfigurations%,%(%is_ProjectConfigurations%)%)%)%,%
%projectconfigurations,%(%else-then(%if-no(%is_projectconfigurations%,,%(%projectconfigurations%)%)%,%(%if-no(%is_projectconfigurations%,,%(%
%Debug|Win32;Debug|x64;Release|Win32;Release|x64%
%)%)%)%)%)%,%
%ProjectConfigurations,%(%else-then(%if-no(%is_projectconfigurations%,,%(%ProjectConfigurations%)%)%,%(%if-no(%is_projectconfigurations%,,%(%projectconfigurations%)%)%)%)%)%,%
%PROJECTCONFIGURATIONS,%(%else-then(%PROJECTCONFIGURATIONS%,%(%toupper(%ProjectConfigurations%)%)%)%)%,%
%projectconfigurations,%(%else-then(%_projectconfigurations%,%(%tolower(%ProjectConfigurations%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-vcxproj.t)%%
%<Project DefaultTargets="%DefaultTargets%" ToolsVersion="%ToolsVersion%" xmlns="%Xml_namespace%">

  <ItemGroup Label="ProjectConfigurations">%
%%parse(%ProjectConfigurations%,;,,,%(%
%%with(%
%is_configuration_build,%(%else-then(%is_configuration_build%,%(%is_Configuration_build%)%)%)%,%
%configuration_build,%(%else-then(%if-no(%is_configuration_build%,,%(%configuration_build%)%)%,%(%if-no(%is_configuration_build%,,%(%left(%Configuration%,|)%)%)%)%)%)%,%
%Configuration_build,%(%else-then(%if-no(%is_configuration_build%,,%(%Configuration_build%)%)%,%(%if-no(%is_configuration_build%,,%(%configuration_build%)%)%)%)%)%,%
%CONFIGURATION_BUILD,%(%else-then(%CONFIGURATION_BUILD%,%(%toupper(%Configuration_build%)%)%)%)%,%
%configuration_build,%(%else-then(%_configuration_build%,%(%tolower(%Configuration_build%)%)%)%)%,%
%is_configuration_platform,%(%else-then(%is_configuration_platform%,%(%is_Configuration_platform%)%)%)%,%
%configuration_platform,%(%else-then(%if-no(%is_configuration_platform%,,%(%configuration_platform%)%)%,%(%if-no(%is_configuration_platform%,,%(%right(%Configuration%,|)%)%)%)%)%)%,%
%Configuration_platform,%(%else-then(%if-no(%is_configuration_platform%,,%(%Configuration_platform%)%)%,%(%if-no(%is_configuration_platform%,,%(%configuration_platform%)%)%)%)%)%,%
%CONFIGURATION_PLATFORM,%(%else-then(%CONFIGURATION_PLATFORM%,%(%toupper(%Configuration_platform%)%)%)%)%,%
%configuration_platform,%(%else-then(%_configuration_platform%,%(%tolower(%Configuration_platform%)%)%)%)%,%
%%(
    <ProjectConfiguration Include="%Configuration%">
      <Configuration>%Configuration_build%</Configuration>
      <Platform>%Configuration_platform%</Platform>
    </ProjectConfiguration>)%)%%
%)%,Configuration)%
  </ItemGroup>

  <PropertyGroup Label="Globals">
    <ProjectGuid>{%ProjectGuid%}</ProjectGuid>
    <RootNamespace>%RootNamespace%</RootNamespace>
    <Keyword>Win32Proj</Keyword>
  </PropertyGroup>

  <Import Project="$(VCTargetsPath)\Microsoft.Cpp.Default.props" />
  <!--
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="Configuration">
    <ConfigurationType>Application</ConfigurationType>
    <CharacterSet>Unicode</CharacterSet>
    <WholeProgramOptimization>true</WholeProgramOptimization>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'" Label="Configuration">
    <ConfigurationType>Application</ConfigurationType>
    <CharacterSet>Unicode</CharacterSet>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Release|x64'" Label="Configuration">
    <ConfigurationType>Application</ConfigurationType>
    <CharacterSet>Unicode</CharacterSet>
    <WholeProgramOptimization>true</WholeProgramOptimization>
  </PropertyGroup>
  <PropertyGroup Condition="'$(Configuration)|$(Platform)'=='Debug|x64'" Label="Configuration">
    <ConfigurationType>Application</ConfigurationType>
    <CharacterSet>Unicode</CharacterSet>
  </PropertyGroup>
  -->
  <Import Project="$(VCTargetsPath)\Microsoft.Cpp.props" />
  <ImportGroup Label="ExtensionSettings">
  </ImportGroup>
  <!--
  <ImportGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'" Label="PropertySheets">
    <Import Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" />
    <Import Project="..\coral-vcversion.props" />
  </ImportGroup>
  <ImportGroup Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'" Label="PropertySheets">
    <Import Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" />
    <Import Project="..\coral-vcversion.props" />
    <Import Project="..\..\coral-nadir.props" />
    <Import Project="..\..\coral-medusa.props" />
    <Import Project="..\..\coral.props" />
  </ImportGroup>
  <ImportGroup Condition="'$(Configuration)|$(Platform)'=='Release|x64'" Label="PropertySheets">
    <Import Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" />
    <Import Project="..\coral-vcversion.props" />
  </ImportGroup>
  <ImportGroup Condition="'$(Configuration)|$(Platform)'=='Debug|x64'" Label="PropertySheets">
    <Import Project="$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props" Condition="exists('$(UserRootDir)\Microsoft.Cpp.$(Platform).user.props')" Label="LocalAppDataPlatform" />
    <Import Project="..\coral-vcversion.props" />
  </ImportGroup>
  -->
  <!--
  <PropertyGroup Label="UserMacros" />
  <PropertyGroup>
    <_ProjectFileVersion>10.0.40219.1</_ProjectFileVersion>
    <OutDir Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">$(CORAL_BIN)\</OutDir>
    <IntDir Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">$(CORAL_OBJ)\</IntDir>
    <LinkIncremental Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">true</LinkIncremental>
    <OutDir Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">$(CORAL_BIN)\</OutDir>
    <IntDir Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">$(CORAL_OBJ)\</IntDir>
    <LinkIncremental Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">true</LinkIncremental>
    <OutDir Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">$(CORAL_BIN)\</OutDir>
    <IntDir Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">$(CORAL_OBJ)\</IntDir>
    <LinkIncremental Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">false</LinkIncremental>
    <OutDir Condition="'$(Configuration)|$(Platform)'=='Release|x64'">$(CORAL_BIN)\</OutDir>
    <IntDir Condition="'$(Configuration)|$(Platform)'=='Release|x64'">$(CORAL_OBJ)\</IntDir>
    <LinkIncremental Condition="'$(Configuration)|$(Platform)'=='Release|x64'">false</LinkIncremental>
  </PropertyGroup>

  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Debug|Win32'">
    <ClCompile>
      <Optimization>Disabled</Optimization>
      <AdditionalIncludeDirectories>$(MEDUSA_INCLUDE_DIRS);$(CORAL_INCLUDE_DIRS);%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <PreprocessorDefinitions>$(CORAL_DEFINES);WIN32;_DEBUG;_CONSOLE;%(PreprocessorDefinitions)</PreprocessorDefinitions>
      <MinimalRebuild>true</MinimalRebuild>
      <BasicRuntimeChecks>EnableFastChecks</BasicRuntimeChecks>
      <RuntimeLibrary>MultiThreadedDebug</RuntimeLibrary>
      <PrecompiledHeader>
      </PrecompiledHeader>
      <WarningLevel>Level3</WarningLevel>
      <DebugInformationFormat>EditAndContinue</DebugInformationFormat>
    </ClCompile>
    <Link>
      <AdditionalDependencies>$(CORAL_LIBS);%(AdditionalDependencies)</AdditionalDependencies>
      <AdditionalLibraryDirectories>$(CORAL_LIB_DIRS);%(AdditionalLibraryDirectories)</AdditionalLibraryDirectories>
      <GenerateDebugInformation>true</GenerateDebugInformation>
      <SubSystem>Console</SubSystem>
      <TargetMachine>MachineX86</TargetMachine>
    </Link>
  </ItemDefinitionGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Debug|x64'">
    <Midl>
      <TargetEnvironment>X64</TargetEnvironment>
    </Midl>
    <ClCompile>
      <Optimization>Disabled</Optimization>
      <AdditionalIncludeDirectories>$(MEDUSA_INCLUDE_DIRS);$(CORAL_INCLUDE_DIRS);%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <PreprocessorDefinitions>$(CORAL_DEFINES);WIN32;_DEBUG;_CONSOLE;%(PreprocessorDefinitions)</PreprocessorDefinitions>
      <MinimalRebuild>true</MinimalRebuild>
      <BasicRuntimeChecks>EnableFastChecks</BasicRuntimeChecks>
      <RuntimeLibrary>MultiThreadedDebug</RuntimeLibrary>
      <PrecompiledHeader>
      </PrecompiledHeader>
      <WarningLevel>Level3</WarningLevel>
      <DebugInformationFormat>ProgramDatabase</DebugInformationFormat>
    </ClCompile>
    <Link>
      <AdditionalDependencies>$(CORAL_LIBS);%(AdditionalDependencies)</AdditionalDependencies>
      <AdditionalLibraryDirectories>$(CORAL_LIB_DIRS);%(AdditionalLibraryDirectories)</AdditionalLibraryDirectories>
      <GenerateDebugInformation>true</GenerateDebugInformation>
      <SubSystem>Console</SubSystem>
      <TargetMachine>MachineX64</TargetMachine>
    </Link>
  </ItemDefinitionGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Release|Win32'">
    <ClCompile>
      <Optimization>MaxSpeed</Optimization>
      <IntrinsicFunctions>true</IntrinsicFunctions>
      <AdditionalIncludeDirectories>$(MEDUSA_INCLUDE_DIRS);$(CORAL_INCLUDE_DIRS);%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <PreprocessorDefinitions>$(CORAL_DEFINES);WIN32;NDEBUG;_CONSOLE;%(PreprocessorDefinitions)</PreprocessorDefinitions>
      <RuntimeLibrary>MultiThreaded</RuntimeLibrary>
      <FunctionLevelLinking>true</FunctionLevelLinking>
      <PrecompiledHeader>
      </PrecompiledHeader>
      <WarningLevel>Level3</WarningLevel>
      <DebugInformationFormat>ProgramDatabase</DebugInformationFormat>
    </ClCompile>
    <Link>
      <AdditionalDependencies>$(CORAL_LIBS);%(AdditionalDependencies)</AdditionalDependencies>
      <AdditionalLibraryDirectories>$(CORAL_LIB_DIRS);%(AdditionalLibraryDirectories)</AdditionalLibraryDirectories>
      <GenerateDebugInformation>true</GenerateDebugInformation>
      <SubSystem>Console</SubSystem>
      <OptimizeReferences>true</OptimizeReferences>
      <EnableCOMDATFolding>true</EnableCOMDATFolding>
      <TargetMachine>MachineX86</TargetMachine>
    </Link>
  </ItemDefinitionGroup>
  <ItemDefinitionGroup Condition="'$(Configuration)|$(Platform)'=='Release|x64'">
    <Midl>
      <TargetEnvironment>X64</TargetEnvironment>
    </Midl>
    <ClCompile>
      <Optimization>MaxSpeed</Optimization>
      <IntrinsicFunctions>true</IntrinsicFunctions>
      <AdditionalIncludeDirectories>$(MEDUSA_INCLUDE_DIRS);$(CORAL_INCLUDE_DIRS);%(AdditionalIncludeDirectories)</AdditionalIncludeDirectories>
      <PreprocessorDefinitions>$(CORAL_DEFINES);WIN32;NDEBUG;_CONSOLE;%(PreprocessorDefinitions)</PreprocessorDefinitions>
      <RuntimeLibrary>MultiThreaded</RuntimeLibrary>
      <FunctionLevelLinking>true</FunctionLevelLinking>
      <PrecompiledHeader>
      </PrecompiledHeader>
      <WarningLevel>Level3</WarningLevel>
      <DebugInformationFormat>ProgramDatabase</DebugInformationFormat>
    </ClCompile>
    <Link>
      <AdditionalDependencies>$(CORAL_LIBS);%(AdditionalDependencies)</AdditionalDependencies>
      <AdditionalLibraryDirectories>$(CORAL_LIB_DIRS);%(AdditionalLibraryDirectories)</AdditionalLibraryDirectories>
      <GenerateDebugInformation>true</GenerateDebugInformation>
      <SubSystem>Console</SubSystem>
      <OptimizeReferences>true</OptimizeReferences>
      <EnableCOMDATFolding>true</EnableCOMDATFolding>
      <TargetMachine>MachineX64</TargetMachine>
    </Link>
  </ItemDefinitionGroup>

  <ItemGroup>
    <ClCompile Include="..\..\..\..\..\src\coral\app\cgi\main.cpp" />
    <ClCompile Include="..\..\..\..\..\src\coral\console\main_main.cpp" />
    <ClCompile Include="..\..\..\..\..\src\coral\console\main_opt.cpp" />
  </ItemGroup>

  <ItemGroup>
    <ClInclude Include="..\..\..\..\..\src\coral\app\cgi\main.hpp" />
  </ItemGroup>

  <Import Project="$(VCTargetsPath)\Microsoft.Cpp.targets" />
  <ImportGroup Label="ExtensionTargets">
  </ImportGroup>
  -->
</Project>
%
%)%)%