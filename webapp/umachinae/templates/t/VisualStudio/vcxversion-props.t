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
%#   File: vcxversion-props.t
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
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(vcversion)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_vcxversion,%(%else-then(%is_vcxversion%,%(%is_VCXVersion%)%)%)%,%
%vcxversion,%(%else-then(%if-no(%is_vcxversion%,,%(%vcxversion%)%)%,%(%if-no(%is_vcxversion%,,%(vc10)%)%)%)%)%,%
%VCXVersion,%(%else-then(%if-no(%is_vcxversion%,,%(%VCXVersion%)%)%,%(%if-no(%is_vcxversion%,,%(%vcxversion%)%)%)%)%)%,%
%VCXVERSION,%(%else-then(%VCXVERSION%,%(%toupper(%VCXVersion%)%)%)%)%,%
%vcxversion,%(%else-then(%_vcxversion%,%(%tolower(%VCXVersion%)%)%)%)%,%
%is_buildmacros,%(%else-then(%is_buildmacros%,%(%is_BuildMacros%)%)%)%,%
%buildmacros,%(%else-then(%if-no(%is_buildmacros%,,%(%buildmacros%)%)%,%(%if-no(%is_buildmacros%,,%(VCVersion=%VCXVersion%)%)%)%)%)%,%
%BuildMacros,%(%else-then(%if-no(%is_buildmacros%,,%(%BuildMacros%)%)%,%(%if-no(%is_buildmacros%,,%(%buildmacros%)%)%)%)%)%,%
%BUILDMACROS,%(%else-then(%BUILDMACROS%,%(%toupper(%BuildMacros%)%)%)%)%,%
%buildmacros,%(%else-then(%_buildmacros%,%(%tolower(%BuildMacros%)%)%)%)%,%
%%(%
%%include(%Include_path%/props.t)%%
%)%)%