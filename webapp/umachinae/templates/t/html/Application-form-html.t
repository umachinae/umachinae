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
%#   File: Application-form-html.t
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
%which,%(%else-then(%if-no(%is_which%,,%(%which%)%)%,%(%if-no(%is_which%,,%(form)%)%)%)%)%,%
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
%is_application_path,%(%else-then(%is_application_path%,%(%is_Application_path%)%)%)%,%
%application_path,%(%else-then(%if-no(%is_application_path%,,%(%application_path%)%)%,%(%if-no(%is_application_path%,,%(/%application%)%)%)%)%)%,%
%Application_path,%(%else-then(%if-no(%is_application_path%,,%(%Application_path%)%)%,%(%if-no(%is_application_path%,,%(%application_path%)%)%)%)%)%,%
%APPLICATION_PATH,%(%else-then(%APPLICATION_PATH%,%(%toupper(%Application_path%)%)%)%)%,%
%application_path,%(%else-then(%_application_path%,%(%tolower(%Application_path%)%)%)%)%,%
%is_action_path,%(%else-then(%is_action_path%,%(%is_Action_path%)%)%)%,%
%action_path,%(%else-then(%if-no(%is_action_path%,,%(%action_path%)%)%,%(%if-no(%is_action_path%,,%(%Application_path%/templates/t)%)%)%)%)%,%
%Action_path,%(%else-then(%if-no(%is_action_path%,,%(%Action_path%)%)%,%(%if-no(%is_action_path%,,%(%action_path%)%)%)%)%)%,%
%ACTION_PATH,%(%else-then(%ACTION_PATH%,%(%toupper(%Action_path%)%)%)%)%,%
%action_path,%(%else-then(%_action_path%,%(%tolower(%Action_path%)%)%)%)%,%
%is_action_type,%(%else-then(%is_action_type%,%(%is_Action_type%)%)%)%,%
%action_type,%(%else-then(%if-no(%is_action_type%,,%(%action_type%)%)%,%(%if-no(%is_action_type%,,%(%else-then(%File_type%,t)%)%)%)%)%)%,%
%Action_type,%(%else-then(%if-no(%is_action_type%,,%(%Action_type%)%)%,%(%if-no(%is_action_type%,,%(%action_type%)%)%)%)%)%,%
%ACTION_TYPE,%(%else-then(%ACTION_TYPE%,%(%toupper(%Action_type%)%)%)%)%,%
%action_type,%(%else-then(%_action_type%,%(%tolower(%Action_type%)%)%)%)%,%
%is_action_base,%(%else-then(%is_action_base%,%(%is_Action_base%)%)%)%,%
%action_base,%(%else-then(%if-no(%is_action_base%,,%(%action_base%)%)%,%(%if-no(%is_action_base%,,%(%Action_type%)%)%)%)%)%,%
%Action_base,%(%else-then(%if-no(%is_action_base%,,%(%Action_base%)%)%,%(%if-no(%is_action_base%,,%(%action_base%)%)%)%)%)%,%
%ACTION_BASE,%(%else-then(%ACTION_BASE%,%(%toupper(%Action_base%)%)%)%)%,%
%action_base,%(%else-then(%_action_base%,%(%tolower(%Action_base%)%)%)%)%,%
%is_action_extension,%(%else-then(%is_action_extension%,%(%is_Action_extension%)%)%)%,%
%action_extension,%(%else-then(%if-no(%is_action_extension%,,%(%action_extension%)%)%,%(%if-no(%is_action_extension%,,%(%Action_type%)%)%)%)%)%,%
%Action_extension,%(%else-then(%if-no(%is_action_extension%,,%(%Action_extension%)%)%,%(%if-no(%is_action_extension%,,%(%action_extension%)%)%)%)%)%,%
%ACTION_EXTENSION,%(%else-then(%ACTION_EXTENSION%,%(%toupper(%Action_extension%)%)%)%)%,%
%action_extension,%(%else-then(%_action_extension%,%(%tolower(%Action_extension%)%)%)%)%,%
%is_template_path,%(%else-then(%is_template_path%,%(%is_Template_path%)%)%)%,%
%template_path,%(%else-then(%if-no(%is_template_path%,,%(%template_path%)%)%,%(%if-no(%is_template_path%,,%(%Action_path%)%)%)%)%)%,%
%Template_path,%(%else-then(%if-no(%is_template_path%,,%(%Template_path%)%)%,%(%if-no(%is_template_path%,,%(%template_path%)%)%)%)%)%,%
%TEMPLATE_PATH,%(%else-then(%TEMPLATE_PATH%,%(%toupper(%Template_path%)%)%)%)%,%
%template_path,%(%else-then(%_template_path%,%(%tolower(%Template_path%)%)%)%)%,%
%is_template_type,%(%else-then(%is_template_type%,%(%is_Template_type%)%)%)%,%
%template_type,%(%else-then(%if-no(%is_template_type%,,%(%template_type%)%)%,%(%if-no(%is_template_type%,,%(%Action_type%)%)%)%)%)%,%
%Template_type,%(%else-then(%if-no(%is_template_type%,,%(%Template_type%)%)%,%(%if-no(%is_template_type%,,%(%template_type%)%)%)%)%)%,%
%TEMPLATE_TYPE,%(%else-then(%TEMPLATE_TYPE%,%(%toupper(%Template_type%)%)%)%)%,%
%template_type,%(%else-then(%_template_type%,%(%tolower(%Template_type%)%)%)%)%,%
%is_template_base,%(%else-then(%is_template_base%,%(%is_Template_base%)%)%)%,%
%template_base,%(%else-then(%if-no(%is_template_base%,,%(%template_base%)%)%,%(%if-no(%is_template_base%,,%(%Action_base%)%)%)%)%)%,%
%Template_base,%(%else-then(%if-no(%is_template_base%,,%(%Template_base%)%)%,%(%if-no(%is_template_base%,,%(%template_base%)%)%)%)%)%,%
%TEMPLATE_BASE,%(%else-then(%TEMPLATE_BASE%,%(%toupper(%Template_base%)%)%)%)%,%
%template_base,%(%else-then(%_template_base%,%(%tolower(%Template_base%)%)%)%)%,%
%is_template_extension,%(%else-then(%is_template_extension%,%(%is_Template_extension%)%)%)%,%
%template_extension,%(%else-then(%if-no(%is_template_extension%,,%(%template_extension%)%)%,%(%if-no(%is_template_extension%,,%(%Action_extension%)%)%)%)%)%,%
%Template_extension,%(%else-then(%if-no(%is_template_extension%,,%(%Template_extension%)%)%,%(%if-no(%is_template_extension%,,%(%template_extension%)%)%)%)%)%,%
%TEMPLATE_EXTENSION,%(%else-then(%TEMPLATE_EXTENSION%,%(%toupper(%Template_extension%)%)%)%)%,%
%template_extension,%(%else-then(%_template_extension%,%(%tolower(%Template_extension%)%)%)%)%,%
%is_template_extensions,%(%else-then(%is_template_extensions%,%(%is_Template_extensions%)%)%)%,%
%template_extensions,%(%else-then(%if-no(%is_template_extensions%,,%(%template_extensions%)%)%,%(%if-no(%is_template_extensions%,,%(%Template_type%)%)%)%)%)%,%
%Template_extensions,%(%else-then(%if-no(%is_template_extensions%,,%(%Template_extensions%)%)%,%(%if-no(%is_template_extensions%,,%(%template_extensions%)%)%)%)%)%,%
%TEMPLATE_EXTENSIONS,%(%else-then(%TEMPLATE_EXTENSIONS%,%(%toupper(%Template_extensions%)%)%)%)%,%
%template_extensions,%(%else-then(%_template_extensions%,%(%tolower(%Template_extensions%)%)%)%)%,%
%is_cgi_path,%(%else-then(%is_cgi_path%,%(%is_CGI_path%)%)%)%,%
%cgi_path,%(%else-then(%if-no(%is_cgi_path%,,%(%cgi_path%)%)%,%(%if-no(%is_cgi_path%,,%(%else-then(%if-then(%Application_path%,%(-cgi)%)%,%(/cgi)%)%)%)%)%)%)%,%
%CGI_path,%(%else-then(%if-no(%is_cgi_path%,,%(%CGI_path%)%)%,%(%if-no(%is_cgi_path%,,%(%cgi_path%)%)%)%)%)%,%
%CGI_PATH,%(%else-then(%CGI_PATH%,%(%toupper(%CGI_path%)%)%)%)%,%
%cgi_path,%(%else-then(%_cgi_path%,%(%tolower(%CGI_path%)%)%)%)%,%
%is_organization_author_date_year,%(%else-then(%is_organization_author_date_year%,%(%is_Organization_Author_Date_Year%)%)%)%,%
%organization_author_date_year,%(%else-then(%if-no(%is_organization_author_date_year%,,%(%organization_author_date_year%)%)%,%(%if-no(%is_organization_author_date_year%,,%()%)%)%)%)%,%
%Organization_Author_Date_Year,%(%else-then(%if-no(%is_organization_author_date_year%,,%(%Organization_Author_Date_Year%)%)%,%(%if-no(%is_organization_author_date_year%,,%(%organization_author_date_year%)%)%)%)%)%,%
%ORGANIZATION_AUTHOR_DATE_YEAR,%(%else-then(%ORGANIZATION_AUTHOR_DATE_YEAR%,%(%toupper(%Organization_Author_Date_Year%)%)%)%)%,%
%organization_author_date_year,%(%else-then(%_organization_author_date_year%,%(%tolower(%Organization_Author_Date_Year%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-html.t)%%
%
<!--
=====================================================================
=== form
=====================================================================
-->
<form name="Form" method="POST" action="%Template_path%/%Template_type%/%Template_base%.%Template_extension%"
 onSubmit="return setFormSubmit(getFormValue2('FormTemplate','FormAction','Form'),getFormValue('FormMethod','Form'),'Form')">
    <div class="form">

    File: <input name="File" value=""></input>[%Template_base%][.%Template_extension%]%
%%parse(%Template_extensions%,;,,,,%(
    <input type="radio" name="Extension" value="%Template_extension%" unchecked="checked">.%Template_type%</input>%
%)%,Template_extension)%
    <input type="radio" name="Extension" value="" checked="checked">no</input>
    <input type="checkbox" name="is_File" value="no" unchecked="checked">no</input>
    <br/>

    Template: <select name="FormTemplate">
    <option value="%Template_path%/%Template_type%/%Template_base%.%Template_extension%">%if-then(%then-if(%What%,.)%%then-if(%Thing%,%(%if(%What%,%( )%)%)%)%,%( )%)%(%Template_path%/%Template_type%/%Template_base%.%Template_extension%)</option>
    <option value=""></option>
    <option value="%Template_path%/t/parameters.t">t parameters &nbsp;&nbsp; (%Template_path%/t/parameters.t)</option>
    <option value="%Template_path%/t/functions.t">t functions &nbsp;&nbsp; (%Template_path%/t/functions.t)</option>
    <option value=""></option>
    <option value="%CGI_path%/cgi">cgi parameters &nbsp;&nbsp; (%CGI_path%/cgi)</option>
    <option value="%CGI_path%/cgicatch">catch cgi parameters &nbsp;&nbsp; (%CGI_path%/cgicatch)</option>
    <option value=""/>
    </select>
    <br/>
%
%%if(%Organization_Author_Date_Year%,%
%%(%include(%Include_path%/form-Organization-Author-Date-Year-html.t)%)%,%
%%(%include(%Include_path%/form-Copyright-Organization-Author-Date-Claims-html.t)%)%)%%
%
    <br/>
    Content-Type: <select name="content_type">
    <option value="text/plain">text</option>
    <option value="text/html">html</option>
    <option value="text/xml">xml</option>
    <option value="application/json">json</option>
    <option value="application/javascript">javascript</option>
    <option value=""></option>
    </select>
    <br/>
    Action: <select name="FormAction">
    <option value="%Template_path%/%Template_type%/%Template_base%.%Template_extension%">%if-then(%then-if(%What%,.)%%then-if(%Thing%,%(%if(%What%,%( )%)%)%)%,%( )%)%(%Template_path%/%Template_type%/%Template_base%.%Template_extension%)</option>
    <option value=""></option>
    <option value="%Template_path%/t/parameters.t">t parameters &nbsp;&nbsp; (%Template_path%/t/parameters.t)</option>
    <option value="%Template_path%/t/functions.t">t functions &nbsp;&nbsp; (%Template_path%/t/functions.t)</option>
    <option value=""></option>
    <option value="%CGI_path%/cgi">cgi parameters &nbsp;&nbsp; (%CGI_path%/cgi)</option>
    <option value="%CGI_path%/cgicatch">catch cgi parameters &nbsp;&nbsp; (%CGI_path%/cgicatch)</option>
    <option value=""/>
    </select>
    <br/>
    Method: <select name="FormMethod">
    <option value="POST">POST</option>
    <option value="GET">GET</option>
    <option value=""></option>
    </select>
    <br/>
    <br/>
    <input type="submit" name="submit" value="submit"/><br/>
    </div>
</form>
%
%)%)%