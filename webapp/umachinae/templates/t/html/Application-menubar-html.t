%########################################################################
%# Copyright (c) 1988-2021 $organization$
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
%#   File: Application-menubar-html.t
%#
%# Author: $author$
%#   Date: 12/11/2021
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_application,%(%else-then(%is_application%,%(%is_Application%)%)%)%,%
%application,%(%else-then(%if-no(%is_application%,,%(%application%)%)%,%(%if-no(%is_application%,,%(%
%%include(%Include_path%/Application.t)%%
%)%)%)%)%)%,%
%Application,%(%else-then(%if-no(%is_application%,,%(%Application%)%)%,%(%if-no(%is_application%,,%(%application%)%)%)%)%)%,%
%APPLICATION,%(%else-then(%APPLICATION%,%(%toupper(%Application%)%)%)%)%,%
%application,%(%else-then(%_application%,%(%tolower(%Application%)%)%)%)%,%
%is_do,%(%else-then(%is_do%,%(%is_Do%)%)%)%,%
%do,%(%else-then(%if-no(%is_do%,,%(%do%)%)%,%(%if-no(%is_do%,,%()%)%)%)%)%,%
%Do,%(%else-then(%if-no(%is_do%,,%(%Do%)%)%,%(%if-no(%is_do%,,%(%do%)%)%)%)%)%,%
%DO,%(%else-then(%DO%,%(%toupper(%Do%)%)%)%)%,%
%do,%(%else-then(%_do%,%(%tolower(%Do%)%)%)%)%,%
%is_what,%(%else-then(%is_what%,%(%is_What%)%)%)%,%
%what,%(%else-then(%if-no(%is_what%,,%(%what%)%)%,%(%if-no(%is_what%,,%()%)%)%)%)%,%
%What,%(%else-then(%if-no(%is_what%,,%(%What%)%)%,%(%if-no(%is_what%,,%(%what%)%)%)%)%)%,%
%WHAT,%(%else-then(%WHAT%,%(%toupper(%What%)%)%)%)%,%
%what,%(%else-then(%_what%,%(%tolower(%What%)%)%)%)%,%
%is_which,%(%else-then(%is_which%,%(%is_Which%)%)%)%,%
%which,%(%else-then(%if-no(%is_which%,,%(%which%)%)%,%(%if-no(%is_which%,,%(menubar)%)%)%)%)%,%
%Which,%(%else-then(%if-no(%is_which%,,%(%Which%)%)%,%(%if-no(%is_which%,,%(%which%)%)%)%)%)%,%
%WHICH,%(%else-then(%WHICH%,%(%toupper(%Which%)%)%)%)%,%
%which,%(%else-then(%_which%,%(%tolower(%Which%)%)%)%)%,%
%is_thing,%(%else-then(%is_thing%,%(%is_Thing%)%)%)%,%
%thing,%(%else-then(%if-no(%is_thing%,,%(%thing%)%)%,%(%if-no(%is_thing%,,%()%)%)%)%)%,%
%Thing,%(%else-then(%if-no(%is_thing%,,%(%Thing%)%)%,%(%if-no(%is_thing%,,%(%thing%)%)%)%)%)%,%
%THING,%(%else-then(%THING%,%(%toupper(%Thing%)%)%)%)%,%
%thing,%(%else-then(%_thing%,%(%tolower(%Thing%)%)%)%)%,%
%is_dowhat,%(%else-then(%is_dowhat%,%(%is_DoWhat%)%)%)%,%
%dowhat,%(%else-then(%if-no(%is_dowhat%,,%(%dowhat%)%)%,%(%if-no(%is_dowhat%,,%(%Do%%then-if(%What%,-)%)%)%)%)%)%,%
%DoWhat,%(%else-then(%if-no(%is_dowhat%,,%(%DoWhat%)%)%,%(%if-no(%is_dowhat%,,%(%dowhat%)%)%)%)%)%,%
%DOWHAT,%(%else-then(%DOWHAT%,%(%toupper(%DoWhat%)%)%)%)%,%
%dowhat,%(%else-then(%_dowhat%,%(%tolower(%DoWhat%)%)%)%)%,%
%is_dowhatwhich,%(%else-then(%is_dowhatwhich%,%(%is_DoWhatWhich%)%)%)%,%
%dowhatwhich,%(%else-then(%if-no(%is_dowhatwhich%,,%(%dowhatwhich%)%)%,%(%if-no(%is_dowhatwhich%,,%(%DoWhat%%then-if(%Which%,-)%)%)%)%)%)%,%
%DoWhatWhich,%(%else-then(%if-no(%is_dowhatwhich%,,%(%DoWhatWhich%)%)%,%(%if-no(%is_dowhatwhich%,,%(%dowhatwhich%)%)%)%)%)%,%
%DOWHATWHICH,%(%else-then(%DOWHATWHICH%,%(%toupper(%DoWhatWhich%)%)%)%)%,%
%dowhatwhich,%(%else-then(%_dowhatwhich%,%(%tolower(%DoWhatWhich%)%)%)%)%,%
%is_dowhatthing,%(%else-then(%is_dowhatthing%,%(%is_DoWhatThing%)%)%)%,%
%dowhatthing,%(%else-then(%if-no(%is_dowhatthing%,,%(%dowhatthing%)%)%,%(%if-no(%is_dowhatthing%,,%(%DoWhat%%then-if(%Thing%,-)%)%)%)%)%)%,%
%DoWhatThing,%(%else-then(%if-no(%is_dowhatthing%,,%(%DoWhatThing%)%)%,%(%if-no(%is_dowhatthing%,,%(%dowhatthing%)%)%)%)%)%,%
%DOWHATTHING,%(%else-then(%DOWHATTHING%,%(%toupper(%DoWhatThing%)%)%)%)%,%
%dowhatthing,%(%else-then(%_dowhatthing%,%(%tolower(%DoWhatThing%)%)%)%)%,%
%is_part,%(%else-then(%is_part%,%(%is_Part%)%)%)%,%
%part,%(%else-then(%if-no(%is_part%,,%(%part%)%)%,%(%if-no(%is_part%,,%(%dowhatwhich%)%)%)%)%)%,%
%Part,%(%else-then(%if-no(%is_part%,,%(%Part%)%)%,%(%if-no(%is_part%,,%(%part%)%)%)%)%)%,%
%PART,%(%else-then(%PART%,%(%toupper(%Part%)%)%)%)%,%
%part,%(%else-then(%_part%,%(%tolower(%Part%)%)%)%)%,%
%is_applicationpart,%(%else-then(%is_applicationpart%,%(%is_ApplicationPart%)%)%)%,%
%applicationpart,%(%else-then(%if-no(%is_applicationpart%,,%(%applicationpart%)%)%,%(%if-no(%is_applicationpart%,,%(%Application%%then-if(%part%,%(-)%)%)%)%)%)%)%,%
%ApplicationPart,%(%else-then(%if-no(%is_applicationpart%,,%(%ApplicationPart%)%)%,%(%if-no(%is_applicationpart%,,%(%applicationpart%)%)%)%)%)%,%
%APPLICATIONPART,%(%else-then(%APPLICATIONPART%,%(%toupper(%ApplicationPart%)%)%)%)%,%
%applicationpart,%(%else-then(%_applicationpart%,%(%tolower(%ApplicationPart%)%)%)%)%,%
%is_home,%(%else-then(%is_home%,%(%is_Home%)%)%)%,%
%home,%(%else-then(%if-no(%is_home%,,%(%home%)%)%,%(%if-no(%is_home%,,%(home)%)%)%)%)%,%
%Home,%(%else-then(%if-no(%is_home%,,%(%Home%)%)%,%(%if-no(%is_home%,,%(%home%)%)%)%)%)%,%
%HOME,%(%else-then(%HOME%,%(%toupper(%Home%)%)%)%)%,%
%home,%(%else-then(%_home%,%(%tolower(%Home%)%)%)%)%,%
%is_tools,%(%else-then(%is_tools%,%(%is_Tools%)%)%)%,%
%tools,%(%else-then(%if-no(%is_tools%,,%(%tools%)%)%,%(%if-no(%is_tools%,,%(tools)%)%)%)%)%,%
%Tools,%(%else-then(%if-no(%is_tools%,,%(%Tools%)%)%,%(%if-no(%is_tools%,,%(%tools%)%)%)%)%)%,%
%TOOLS,%(%else-then(%TOOLS%,%(%toupper(%Tools%)%)%)%)%,%
%tools,%(%else-then(%_tools%,%(%tolower(%Tools%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-html.t)%%
%
<!--
=====================================================================
=== menubar
=====================================================================
-->
<ul class="menubar">
    <li class="home"><div><a href="%Application%-home.html">%Home%</a></div></li>
    <li class="home"><div><a href="%Application%-tools.html">%Tools%</a></div></li>
</ul>
%
%)%)%