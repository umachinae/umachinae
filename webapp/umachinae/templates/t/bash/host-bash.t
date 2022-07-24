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
%#   File: host-bash.t
%#
%# Author: $author$
%#   Date: 3/9/2021, 7/23/2022
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
%is_host,%(%else-then(%is_host%,%(%is_Host%)%)%)%,%
%host,%(%else-then(%if-no(%is_host%,,%(%host%)%)%,%(%if-no(%is_host%,,%(hostname)%)%)%)%)%,%
%Host,%(%else-then(%if-no(%is_host%,,%(%Host%)%)%,%(%if-no(%is_host%,,%(%host%)%)%)%)%)%,%
%HOST,%(%else-then(%HOST%,%(%toupper(%Host%)%)%)%)%,%
%host,%(%else-then(%_host%,%(%tolower(%Host%)%)%)%)%,%
%is_title,%(%else-then(%is_title%,%(%is_Title%)%)%)%,%
%title,%(%else-then(%if-no(%is_title%,,%(%title%)%)%,%(%if-no(%is_title%,,%(%Utility% %Host% host address script)%)%)%)%)%,%
%Title,%(%else-then(%if-no(%is_title%,,%(%Title%)%)%,%(%if-no(%is_title%,,%(%title%)%)%)%)%)%,%
%TITLE,%(%else-then(%TITLE%,%(%toupper(%Title%)%)%)%)%,%
%title,%(%else-then(%_title%,%(%tolower(%Title%)%)%)%)%,%
%number,%(%else-then(%if-no(%is_number%,,%(%number%)%)%,%(%if-no(%is_number%,,%()%)%)%)%)%,%
%Number,%(%else-then(%if-no(%is_number%,,%(%Number%)%)%,%(%if-no(%is_number%,,%(%number%)%)%)%)%)%,%
%NUMBER,%(%else-then(%NUMBER%,%(%toupper(%Number%)%)%)%)%,%
%number,%(%else-then(%_number%,%(%tolower(%Number%)%)%)%)%,%
%is_host_address,%(%else-then(%is_host_address%,%(%is_Host_address%)%)%)%,%
%host_address,%(%else-then(%if-no(%is_host_address%,,%(%host_address%)%)%,%(%if-no(%is_host_address%,,%(%Host%-%if(%number%,$number-)%host-address.txt)%)%)%)%)%,%
%Host_address,%(%else-then(%if-no(%is_host_address%,,%(%Host_address%)%)%,%(%if-no(%is_host_address%,,%(%host_address%)%)%)%)%)%,%
%HOST_ADDRESS,%(%else-then(%HOST_ADDRESS%,%(%toupper(%Host_address%)%)%)%)%,%
%host_address,%(%else-then(%_host_address%,%(%tolower(%Host_address%)%)%)%)%,%
%is_number,%(%else-then(%is_number%,%(%is_Number%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%Host%-%if-then(%number%,-)%host)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-bash.t)%%
%dirname=`dirname $0`
basename=`basename $0`

if [ "$2" != "" ]; then
number=$2
else # [ "$2" != "" ]; then
number=%else-then(%number%,1)%
fi # [ "$2" != "" ]; then

file=$dirname/%Host_address%

if [ "$1" != "" ]; then
echo $1 > $file
else # [ "$1" != "" ]; then
cat $file
fi # [ "$1" != "" ]; then
%
%)%)%