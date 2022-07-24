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
%#   File: form-Copyright-Organization-Author-Date-Claims-html.t
%#
%# Author: $author$
%#   Date: 1/19/2022
%########################################################################
%with(%
%is_copyright_default,%(%else-then(%is_copyright_default%,%(%is_Copyright_default%)%)%)%,%
%copyright_default,%(%else-then(%if-no(%is_copyright_default%,,%(%copyright_default%)%)%,%(%if-no(%is_copyright_default%,,%(Copyright_default)%)%)%)%)%,%
%Copyright_default,%(%else-then(%if-no(%is_copyright_default%,,%(%Copyright_default%)%)%,%(%if-no(%is_copyright_default%,,%(%copyright_default%)%)%)%)%)%,%
%COPYRIGHT_DEFAULT,%(%else-then(%COPYRIGHT_DEFAULT%,%(%toupper(%Copyright_default%)%)%)%)%,%
%copyright_default,%(%else-then(%_copyright_default%,%(%tolower(%Copyright_default%)%)%)%)%,%
%is_genesis_default,%(%else-then(%is_genesis_default%,%(%is_Genesis_default%)%)%)%,%
%genesis_default,%(%else-then(%if-no(%is_genesis_default%,,%(%genesis_default%)%)%,%(%if-no(%is_genesis_default%,,%(1988)%)%)%)%)%,%
%Genesis_default,%(%else-then(%if-no(%is_genesis_default%,,%(%Genesis_default%)%)%,%(%if-no(%is_genesis_default%,,%(%genesis_default%)%)%)%)%)%,%
%GENESIS_DEFAULT,%(%else-then(%GENESIS_DEFAULT%,%(%toupper(%Genesis_default%)%)%)%)%,%
%genesis_default,%(%else-then(%_genesis_default%,%(%tolower(%Genesis_default%)%)%)%)%,%
%is_year_default,%(%else-then(%is_year_default%,%(%is_Year_default%)%)%)%,%
%year_default,%(%else-then(%if-no(%is_year_default%,,%(%year_default%)%)%,%(%if-no(%is_year_default%,,%(%%year%(()%%())%%%)%)%)%)%)%,%
%Year_default,%(%else-then(%if-no(%is_year_default%,,%(%Year_default%)%)%,%(%if-no(%is_year_default%,,%(%year_default%)%)%)%)%)%,%
%YEAR_DEFAULT,%(%else-then(%YEAR_DEFAULT%,%(%toupper(%Year_default%)%)%)%)%,%
%year_default,%(%else-then(%_year_default%,%(%tolower(%Year_default%)%)%)%)%,%
%is_organization_default,%(%else-then(%is_organization_default%,%(%is_Organization_default%)%)%)%,%
%organization_default,%(%else-then(%if-no(%is_organization_default%,,%(%organization_default%)%)%,%(%if-no(%is_organization_default%,,%($organization$)%)%)%)%)%,%
%Organization_default,%(%else-then(%if-no(%is_organization_default%,,%(%Organization_default%)%)%,%(%if-no(%is_organization_default%,,%(%organization_default%)%)%)%)%)%,%
%ORGANIZATION_DEFAULT,%(%else-then(%ORGANIZATION_DEFAULT%,%(%toupper(%Organization_default%)%)%)%)%,%
%organization_default,%(%else-then(%_organization_default%,%(%tolower(%Organization_default%)%)%)%)%,%
%is_author_default,%(%else-then(%is_author_default%,%(%is_Author_default%)%)%)%,%
%author_default,%(%else-then(%if-no(%is_author_default%,,%(%author_default%)%)%,%(%if-no(%is_author_default%,,%($author$)%)%)%)%)%,%
%Author_default,%(%else-then(%if-no(%is_author_default%,,%(%Author_default%)%)%,%(%if-no(%is_author_default%,,%(%author_default%)%)%)%)%)%,%
%AUTHOR_DEFAULT,%(%else-then(%AUTHOR_DEFAULT%,%(%toupper(%Author_default%)%)%)%)%,%
%author_default,%(%else-then(%_author_default%,%(%tolower(%Author_default%)%)%)%)%,%
%is_date_default,%(%else-then(%is_date_default%,%(%is_Date_default%)%)%)%,%
%date_default,%(%else-then(%if-no(%is_date_default%,,%(%date_default%)%)%,%(%if-no(%is_date_default%,,%(%%date%(()%%())%%%)%)%)%)%)%,%
%Date_default,%(%else-then(%if-no(%is_date_default%,,%(%Date_default%)%)%,%(%if-no(%is_date_default%,,%(%date_default%)%)%)%)%)%,%
%DATE_DEFAULT,%(%else-then(%DATE_DEFAULT%,%(%toupper(%Date_default%)%)%)%)%,%
%date_default,%(%else-then(%_date_default%,%(%tolower(%Date_default%)%)%)%)%,%
%is_claims_default,%(%else-then(%is_claims_default%,%(%is_Claims_default%)%)%)%,%
%claims_default,%(%else-then(%if-no(%is_claims_default%,,%(%claims_default%)%)%,%(%if-no(%is_claims_default%,,%(``as is'')%)%)%)%)%,%
%Claims_default,%(%else-then(%if-no(%is_claims_default%,,%(%Claims_default%)%)%,%(%if-no(%is_claims_default%,,%(%claims_default%)%)%)%)%)%,%
%CLAIMS_DEFAULT,%(%else-then(%CLAIMS_DEFAULT%,%(%toupper(%Claims_default%)%)%)%)%,%
%claims_default,%(%else-then(%_claims_default%,%(%tolower(%Claims_default%)%)%)%)%,%
%%(%
%
    <br/>
    Copyright:<input name="Genesis" size="10" value=""/>[%Genesis_default%]<b></b>
    <input type="checkbox" name="is_Genesis" value="no" unchecked="checked">no</input>
    <b>-</b><input name="Year" size="10" value=""/>[%Year_default%]<b></b>
    <input type="checkbox" name="is_Year" value="no" unchecked="checked">no</input>
    <b>&nbsp;&nbsp;</b>Organization:<input name="Organization" value=""></input>[%Organization_default%]
    <input type="checkbox" name="is_Organization" value="no" unchecked="checked">no</input>
    <input type="checkbox" name="is_Copyright" value="no" unchecked="checked">no</input>
    <br/>
    Author:<input name="Author" value=""></input>[%Author_default%]
    <input type="checkbox" name="is_Author" value="no" unchecked="checked">no</input>
    <b>&nbsp;&nbsp;</b>Date:<input name="Date" size="10" value=""/>[%Date_default%]<b></b>
    <input type="checkbox" name="is_Date" value="no" unchecked="checked">no</input>
    <b>&nbsp;&nbsp;</b><select name="Claims">
    <option value=""></option>
    <option value="as_is">``as is''</option>
    <option value=""></option>
    </select>[%Claims_default%]
    <input type="checkbox" name="is_Claims" value="no" unchecked="checked">no</input>
    <br/>
%
%)%)%