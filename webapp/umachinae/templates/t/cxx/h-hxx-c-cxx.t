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
%#   File: h-hxx-c-cxx.t
%#
%# Author: $author$
%#   Date: 5/5/2019
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%Extension,%(%else-then(%if-no(%is_Extension%,,%Extension%)%,%(%else-then(%fileextension(%File%)%,hxx)%)%)%)%,%
%EXTENSION,%(%else-then(%EXTENSION%,%(%toupper(%Extension%)%)%)%)%,%
%extension,%(%else-then(%_Extension%,%(%tolower(%Extension%)%)%)%)%,%
%Header,%(%else-then(%Header%,%(%if(%equal(c,%Extension%)%,h,%if(%equal(cpp,%Extension%)%,hpp,%if(%equal(cxx,%Extension%)%,hxx,%Extension%)%)%)%)%)%)%,%
%HEADER,%(%else-then(%HEADER%,%(%toupper(%Header%)%)%)%)%,%
%header,%(%else-then(%_Header%,%(%tolower(%Header%)%)%)%)%,%
%Body,%(%else-then(%Body%,%(%if(%equal(h,%Header%)%,c,%if(%equal(hpp,%Header%)%,cpp,cxx)%)%)%)%)%,%
%BODY,%(%else-then(%BODY%,%(%toupper(%Body%)%)%)%)%,%
%body,%(%else-then(%_Body%,%(%tolower(%Body%)%)%)%)%,%
%%(%
%%include(%include_path%/%Header%-%Body%.t)%%
%)%)%