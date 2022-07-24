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
%#   File: utility-script-bash.t
%#
%# Author: $author$
%#   Date: 2/25/2021, 7/23/2022
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_utility,%(%else-then(%is_utility%,%(%is_Utility%)%)%)%,%
%utility,%(%else-then(%if-no(%is_utility%,,%(%utility%)%)%,%(%if-no(%is_utility%,,%(utility)%)%)%)%)%,%
%Utility,%(%else-then(%if-no(%is_utility%,,%(%Utility%)%)%,%(%if-no(%is_utility%,,%(%utility%)%)%)%)%)%,%
%UTILITY,%(%else-then(%UTILITY%,%(%toupper(%Utility%)%)%)%)%,%
%utility,%(%else-then(%_utility%,%(%tolower(%Utility%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%else-then(%filebase(%File%)%,%Utility%)%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_title,%(%else-then(%is_title%,%(%is_Title%)%)%)%,%
%title,%(%else-then(%if-no(%is_title%,,%(%title%)%)%,%(%if-no(%is_title%,,%(%Utility% utility script)%)%)%)%)%,%
%Title,%(%else-then(%if-no(%is_title%,,%(%Title%)%)%,%(%if-no(%is_title%,,%(%title%)%)%)%)%)%,%
%TITLE,%(%else-then(%TITLE%,%(%toupper(%Title%)%)%)%)%,%
%title,%(%else-then(%_title%,%(%tolower(%Title%)%)%)%)%,%
%is_default_host,%(%else-then(%is_default_host%,%(%is_Default_host%)%)%)%,%
%default_host,%(%else-then(%if-no(%is_default_host%,,%(%default_host%)%)%,%(%if-no(%is_default_host%,,%('localhost')%)%)%)%)%,%
%Default_host,%(%else-then(%if-no(%is_default_host%,,%(%Default_host%)%)%,%(%if-no(%is_default_host%,,%(%default_host%)%)%)%)%)%,%
%DEFAULT_HOST,%(%else-then(%DEFAULT_HOST%,%(%toupper(%Default_host%)%)%)%)%,%
%default_host,%(%else-then(%_default_host%,%(%tolower(%Default_host%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-bash.t)%%
%dirname=`dirname $0`
basename=`basename $0`

title='%Title%'
utility='%utility%'
default_host=%Default_host%

if [ "$1" != "" ]; then
    if [ "$2" != "" ]; then
    host=$1
    else # [ "$2" != "" ]; then
    host=$default_host
    fi # [ "$2" != "" ]; then
else # [ "$1" != "" ]; then
host=$default_host
fi # [ "$1" != "" ]; then

if [ "$1" != "" ]; then
    if [ "$2" != "" ]; then
    $utility -o$host $2 $3 $4
    else # [ "$2" != "" ]; then
    $utility -o$host $1 $2 $3 $4
    fi # [ "$2" != "" ]; then
else # [ "$1" != "" ]; then
echo $title
echo usage $basename '[hostname['$host']]' '...' '(-h or --help -- options)'
fi # [ "$1" != "" ]; then
%
%)%)%