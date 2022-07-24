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
%#   File: class-hxx-cxx.t
%#
%# Author: $author$
%#   Date: 5/2/2019, 7/1/2021
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_prefix,%(%else-then(%is_prefix%,%(%is_Prefix%)%)%)%,%
%prefix,%(%else-then(%if-no(%is_prefix%,,%(%prefix%)%)%,%(%if-no(%is_prefix%,,%(class)%)%)%)%)%,%
%Prefix,%(%else-then(%if-no(%is_prefix%,,%(%Prefix%)%)%,%(%if-no(%is_prefix%,,%(%prefix%)%)%)%)%)%,%
%PREFIX,%(%else-then(%PREFIX%,%(%toupper(%Prefix%)%)%)%)%,%
%prefix,%(%else-then(%_prefix%,%(%tolower(%Prefix%)%)%)%)%,%
%is_derived,%(%else-then(%is_derived%,%(%is_Derived%)%)%)%,%
%derived,%(%else-then(%if-no(%is_derived%,,%(%derived%)%)%,%(%if-no(%is_derived%,,%(derived)%)%)%)%)%,%
%Derived,%(%else-then(%if-no(%is_derived%,,%(%Derived%)%)%,%(%if-no(%is_derived%,,%(%derived%)%)%)%)%)%,%
%DERIVED,%(%else-then(%DERIVED%,%(%toupper(%Derived%)%)%)%)%,%
%derived,%(%else-then(%_derived%,%(%tolower(%Derived%)%)%)%)%,%
%is_implement,%(%else-then(%is_implement%,%(%is_Implement%)%)%)%,%
%implement,%(%else-then(%if-no(%is_implement%,,%(%implement%)%)%,%(%if-no(%is_implement%,,%(implement)%)%)%)%)%,%
%Implement,%(%else-then(%if-no(%is_implement%,,%(%Implement%)%)%,%(%if-no(%is_implement%,,%(%implement%)%)%)%)%)%,%
%IMPLEMENT,%(%else-then(%IMPLEMENT%,%(%toupper(%Implement%)%)%)%)%,%
%implement,%(%else-then(%_implement%,%(%tolower(%Implement%)%)%)%)%,%
%is_extend,%(%else-then(%is_extend%,%(%is_Extend%)%)%)%,%
%extend,%(%else-then(%if-no(%is_extend%,,%(%extend%)%)%,%(%if-no(%is_extend%,,%(extend)%)%)%)%)%,%
%Extend,%(%else-then(%if-no(%is_extend%,,%(%Extend%)%)%,%(%if-no(%is_extend%,,%(%extend%)%)%)%)%)%,%
%EXTEND,%(%else-then(%EXTEND%,%(%toupper(%Extend%)%)%)%)%,%
%extend,%(%else-then(%_extend%,%(%tolower(%Extend%)%)%)%)%,%
%is_class,%(%else-then(%is_class%,%(%is_Class%)%)%)%,%
%class,%(%else-then(%if-no(%is_class%,,%(%class%)%)%,%(%if-no(%is_class%,,%(%Derived%)%)%)%)%)%,%
%Class,%(%else-then(%if-no(%is_class%,,%(%Class%)%)%,%(%if-no(%is_class%,,%(%class%)%)%)%)%)%,%
%CLASS,%(%else-then(%CLASS%,%(%toupper(%Class%)%)%)%)%,%
%class,%(%else-then(%_class%,%(%tolower(%Class%)%)%)%)%,%
%is_implements,%(%else-then(%is_implements%,%(%is_Implements%)%)%)%,%
%implements,%(%else-then(%if-no(%is_implements%,,%(%implements%)%)%,%(%if-no(%is_implements%,,%(%Implement%)%)%)%)%)%,%
%Implements,%(%else-then(%if-no(%is_implements%,,%(%Implements%)%)%,%(%if-no(%is_implements%,,%(%implements%)%)%)%)%)%,%
%IMPLEMENTS,%(%else-then(%IMPLEMENTS%,%(%toupper(%Implements%)%)%)%)%,%
%implements,%(%else-then(%_implements%,%(%tolower(%Implements%)%)%)%)%,%
%is_extends,%(%else-then(%is_extends%,%(%is_Extends%)%)%)%,%
%extends,%(%else-then(%if-no(%is_extends%,,%(%extends%)%)%,%(%if-no(%is_extends%,,%(%Extend%)%)%)%)%)%,%
%Extends,%(%else-then(%if-no(%is_extends%,,%(%Extends%)%)%,%(%if-no(%is_extends%,,%(%extends%)%)%)%)%)%,%
%EXTENDS,%(%else-then(%EXTENDS%,%(%toupper(%Extends%)%)%)%)%,%
%extends,%(%else-then(%_extends%,%(%tolower(%Extends%)%)%)%)%,%
%is_templatet,%(%else-then(%is_templatet%,%(%is_TemplateT%)%)%)%,%
%templatet,%(%else-then(%if-no(%is_templatet%,,%(%templatet%)%)%,%(%if-no(%is_templatet%,,%(T)%)%)%)%)%,%
%TemplateT,%(%else-then(%if-no(%is_templatet%,,%(%TemplateT%)%)%,%(%if-no(%is_templatet%,,%(%templatet%)%)%)%)%)%,%
%TEMPLATET,%(%else-then(%TEMPLATET%,%(%toupper(%TemplateT%)%)%)%)%,%
%templatet,%(%else-then(%_templatet%,%(%tolower(%TemplateT%)%)%)%)%,%
%is_classt,%(%else-then(%is_classt%,%(%is_ClassT%)%)%)%,%
%classt,%(%else-then(%if-no(%is_classt%,,%(%classt%)%)%,%(%if-no(%is_classt%,,%(%Class%%if-no(%is_Template%,,%TemplateT%)%)%)%)%)%)%,%
%ClassT,%(%else-then(%if-no(%is_classt%,,%(%ClassT%)%)%,%(%if-no(%is_classt%,,%(%classt%)%)%)%)%)%,%
%CLASST,%(%else-then(%CLASST%,%(%toupper(%ClassT%)%)%)%)%,%
%classt,%(%else-then(%_classt%,%(%tolower(%ClassT%)%)%)%)%,%
%is_classtimplements,%(%else-then(%is_classtimplements%,%(%else-then(%is_ClassTImplements%,%is_implements%)%)%)%)%,%
%classtimplements,%(%else-then(%if-no(%is_classtimplements%,,%(%classtimplements%)%)%,%(%if-no(%is_classtimplements%,,%(%if-no(%is_Template%,%ClassT%,T)%Implements)%)%)%)%)%,%
%ClassTImplements,%(%else-then(%if-no(%is_classtimplements%,,%(%ClassTImplements%)%)%,%(%if-no(%is_classtimplements%,,%(%classtimplements%)%)%)%)%)%,%
%CLASSTIMPLEMENTS,%(%else-then(%CLASSTIMPLEMENTS%,%(%toupper(%ClassTImplements%)%)%)%)%,%
%classtimplements,%(%else-then(%_classtimplements%,%(%tolower(%ClassTImplements%)%)%)%)%,%
%is_classtextends,%(%else-then(%is_classtextends%,%(%else-then(%is_ClassTExtends%,%is_extends%)%)%)%)%,%
%classtextends,%(%else-then(%if-no(%is_classtextends%,,%(%classtextends%)%)%,%(%if-no(%is_classtextends%,,%(%if-no(%is_Template%,%ClassT%,T)%Extends)%)%)%)%)%,%
%ClassTExtends,%(%else-then(%if-no(%is_classtextends%,,%(%ClassTExtends%)%)%,%(%if-no(%is_classtextends%,,%(%classtextends%)%)%)%)%)%,%
%CLASSTEXTENDS,%(%else-then(%CLASSTEXTENDS%,%(%toupper(%ClassTExtends%)%)%)%)%,%
%classtextends,%(%else-then(%_classtextends%,%(%tolower(%ClassTExtends%)%)%)%)%,%
%is_timplements,%(%else-then(%is_timplements%,%(%is_TImplements%)%)%)%,%
%timplements,%(%else-then(%if-no(%is_timplements%,,%(%timplements%)%)%,%(%if-no(%is_timplements%,,%(%if-no(%is_Template%,%Class%TImplements,%Implements%)%)%)%)%)%)%,%
%TImplements,%(%else-then(%if-no(%is_timplements%,,%(%TImplements%)%)%,%(%if-no(%is_timplements%,,%(%timplements%)%)%)%)%)%,%
%TIMPLEMENTS,%(%else-then(%TIMPLEMENTS%,%(%toupper(%TImplements%)%)%)%)%,%
%timplements,%(%else-then(%_timplements%,%(%tolower(%TImplements%)%)%)%)%,%
%is_textends,%(%else-then(%is_textends%,%(%is_TExtends%)%)%)%,%
%textends,%(%else-then(%if-no(%is_textends%,,%(%textends%)%)%,%(%if-no(%is_textends%,,%(%if-no(%is_Template%,%Class%TExtends,%Extends%)%)%)%)%)%)%,%
%TExtends,%(%else-then(%if-no(%is_textends%,,%(%TExtends%)%)%,%(%if-no(%is_textends%,,%(%textends%)%)%)%)%)%,%
%TEXTENDS,%(%else-then(%TEXTENDS%,%(%toupper(%TExtends%)%)%)%)%,%
%textends,%(%else-then(%_textends%,%(%tolower(%TExtends%)%)%)%)%,%
%is_template_derive,%(%else-then(%is_template_derive%,%(%is_Template_derive%)%)%)%,%
%template_derive,%(%else-then(%if-no(%is_template_derive%,,%(%template_derive%)%)%,%(%if-no(%is_template_derive%,,%(%
%%if-no(%is_Extends%,,class TExtends = %TExtends%)%%
%%if-no(%is_Implements%,,%if-no(%is_Extends%,,%(, )%)%)%%
%%if-no(%is_Implements%,,class TImplements = %TImplements%)%%
%)%)%)%)%)%,%
%Template_derive,%(%else-then(%if-no(%is_template_derive%,,%(%Template_derive%)%)%,%(%if-no(%is_template_derive%,,%(%template_derive%)%)%)%)%)%,%
%TEMPLATE_DERIVE,%(%else-then(%TEMPLATE_DERIVE%,%(%toupper(%Template_derive%)%)%)%)%,%
%template_derive,%(%else-then(%_template_derive%,%(%tolower(%Template_derive%)%)%)%)%,%
%is_template,%(%else-then(%is_template%,%(%is_Template%)%)%)%,%
%template,%(%else-then(%if-no(%is_template%,,%(%
%%if-then(%template%,%(%then-if(%Template_derive%,%(, )%)%)%)%%
%)%)%,%(%if-no(%is_template%,,%(%
%%Template_derive%%
%)%)%)%)%)%,%
%Template,%(%else-then(%if-no(%is_template%,,%(%
%%if-then(%Template%,%(%then-if(%Template_derive%,%(, )%)%)%)%%
%)%)%,%(%if-no(%is_template%,,%(%template%)%)%)%)%)%,%
%TEMPLATE,%(%else-then(%TEMPLATE%,%(%toupper(%Template%)%)%)%)%,%
%template,%(%else-then(%_template%,%(%tolower(%Template%)%)%)%)%,%
%is_file,%(%else-then(%is_file%,%(%is_File%)%)%)%,%
%file,%(%else-then(%if-no(%is_file%,,%(%file%)%)%,%(%if-no(%is_file%,,%(%Class%)%)%)%)%)%,%
%File,%(%else-then(%if-no(%is_file%,,%(%File%)%)%,%(%if-no(%is_file%,,%(%file%)%)%)%)%)%,%
%FILE,%(%else-then(%FILE%,%(%toupper(%File%)%)%)%)%,%
%file,%(%else-then(%_file%,%(%tolower(%File%)%)%)%)%,%
%%(%
%%include(%include_path%/hxx-cxx.t)%%
%)%)%