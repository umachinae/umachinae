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
%#   File: tarme-bash.t
%#
%# Author: $author$
%#   Date: 1/22/2022, 7/5/2022
%########################################################################
%with(%
%is_include_path,%(%else-then(%is_include_path%,%(%is_Include_path%)%)%)%,%
%include_path,%(%else-then(%if-no(%is_include_path%,,%(%include_path%)%)%,%(%if-no(%is_include_path%,,%(%filepath(%input%)%)%)%)%)%)%,%
%Include_path,%(%else-then(%if-no(%is_include_path%,,%(%Include_path%)%)%,%(%if-no(%is_include_path%,,%(%include_path%)%)%)%)%)%,%
%INCLUDE_PATH,%(%else-then(%INCLUDE_PATH%,%(%toupper(%Include_path%)%)%)%)%,%
%include_path,%(%else-then(%_include_path%,%(%tolower(%Include_path%)%)%)%)%,%
%is_tarit,%(%else-then(%is_tarit%,%(%is_Tarit%)%)%)%,%
%tarit,%(%else-then(%if-no(%is_tarit%,,%(%tarit%)%)%,%(%if-no(%is_tarit%,,%(tarit)%)%)%)%)%,%
%Tarit,%(%else-then(%if-no(%is_tarit%,,%(%Tarit%)%)%,%(%if-no(%is_tarit%,,%(%tarit%)%)%)%)%)%,%
%TARIT,%(%else-then(%TARIT%,%(%toupper(%Tarit%)%)%)%)%,%
%tarit,%(%else-then(%_tarit%,%(%tolower(%Tarit%)%)%)%)%,%
%is_tarme,%(%else-then(%is_tarme%,%(%is_Tarme%)%)%)%,%
%tarme,%(%else-then(%if-no(%is_tarme%,,%(%tarme%)%)%,%(%if-no(%is_tarme%,,%(tarme)%)%)%)%)%,%
%Tarme,%(%else-then(%if-no(%is_tarme%,,%(%Tarme%)%)%,%(%if-no(%is_tarme%,,%(%tarme%)%)%)%)%)%,%
%TARME,%(%else-then(%TARME%,%(%toupper(%Tarme%)%)%)%)%,%
%tarme,%(%else-then(%_tarme%,%(%tolower(%Tarme%)%)%)%)%,%
%is_typeextension,%(%else-then(%is_typeextension%,%(%is_TypeExtension%)%)%)%,%
%typeextension,%(%else-then(%if-no(%is_typeextension%,,%(%typeextension%)%)%,%(%if-no(%is_typeextension%,,%(sh)%)%)%)%)%,%
%TypeExtension,%(%else-then(%if-no(%is_typeextension%,,%(%TypeExtension%)%)%,%(%if-no(%is_typeextension%,,%(%typeextension%)%)%)%)%)%,%
%TYPEEXTENSION,%(%else-then(%TYPEEXTENSION%,%(%toupper(%TypeExtension%)%)%)%)%,%
%typeextension,%(%else-then(%_typeextension%,%(%tolower(%TypeExtension%)%)%)%)%,%
%is_base,%(%else-then(%is_base%,%(%is_Base%)%)%)%,%
%base,%(%else-then(%if-no(%is_base%,,%(%base%)%)%,%(%if-no(%is_base%,,%(%else-then(%filebase(%File%)%,%Tarme%)%)%)%)%)%)%,%
%Base,%(%else-then(%if-no(%is_base%,,%(%Base%)%)%,%(%if-no(%is_base%,,%(%base%)%)%)%)%)%,%
%BASE,%(%else-then(%BASE%,%(%toupper(%Base%)%)%)%)%,%
%base,%(%else-then(%_base%,%(%tolower(%Base%)%)%)%)%,%
%is_title,%(%else-then(%is_title%,%(%is_Title%)%)%)%,%
%title,%(%else-then(%if-no(%is_title%,,%(%title%)%)%,%(%if-no(%is_title%,,%(%Tarit% utility script)%)%)%)%)%,%
%Title,%(%else-then(%if-no(%is_title%,,%(%Title%)%)%,%(%if-no(%is_title%,,%(%title%)%)%)%)%)%,%
%TITLE,%(%else-then(%TITLE%,%(%toupper(%Title%)%)%)%)%,%
%title,%(%else-then(%_title%,%(%tolower(%Title%)%)%)%)%,%
%is_hostname,%(%else-then(%is_hostname%,%(%is_Hostname%)%)%)%,%
%hostname,%(%else-then(%if-no(%is_hostname%,,%(%hostname%)%)%,%(%if-no(%is_hostname%,,%(macbook3)%)%)%)%)%,%
%Hostname,%(%else-then(%if-no(%is_hostname%,,%(%Hostname%)%)%,%(%if-no(%is_hostname%,,%(%hostname%)%)%)%)%)%,%
%HOSTNAME,%(%else-then(%HOSTNAME%,%(%toupper(%Hostname%)%)%)%)%,%
%hostname,%(%else-then(%_hostname%,%(%tolower(%Hostname%)%)%)%)%,%
%is_repository,%(%else-then(%is_repository%,%(%is_Repository%)%)%)%,%
%repository,%(%else-then(%if-no(%is_repository%,,%(%repository%)%)%,%(%if-no(%is_repository%,,%(%
%%else-then(%include(%Include_path%/../t/Repository.t)%,repository)%%
%)%)%)%)%)%,%
%Repository,%(%else-then(%if-no(%is_repository%,,%(%Repository%)%)%,%(%if-no(%is_repository%,,%(%repository%)%)%)%)%)%,%
%REPOSITORY,%(%else-then(%REPOSITORY%,%(%toupper(%Repository%)%)%)%)%,%
%repository,%(%else-then(%_repository%,%(%tolower(%Repository%)%)%)%)%,%
%is_repositoryhostname,%(%else-then(%is_repositoryhostname%,%(%is_RepositoryHostname%)%)%)%,%
%repositoryhostname,%(%else-then(%if-no(%is_repositoryhostname%,,%(%repositoryhostname%)%)%,%(%if-no(%is_repositoryhostname%,,%(%if-then(%Repository%,-)%%Hostname%)%)%)%)%)%,%
%RepositoryHostname,%(%else-then(%if-no(%is_repositoryhostname%,,%(%RepositoryHostname%)%)%,%(%if-no(%is_repositoryhostname%,,%(%repositoryhostname%)%)%)%)%)%,%
%REPOSITORYHOSTNAME,%(%else-then(%REPOSITORYHOSTNAME%,%(%toupper(%RepositoryHostname%)%)%)%)%,%
%repositoryhostname,%(%else-then(%_repositoryhostname%,%(%tolower(%RepositoryHostname%)%)%)%)%,%
%is_tardir,%(%else-then(%is_tardir%,%(%is_Tardir%)%)%)%,%
%tardir,%(%else-then(%if-no(%is_tardir%,,%(%tardir%)%)%,%(%if-no(%is_tardir%,,%(./tar%then-if(%Hostname%,/)%)%)%)%)%)%,%
%Tardir,%(%else-then(%if-no(%is_tardir%,,%(%Tardir%)%)%,%(%if-no(%is_tardir%,,%(%tardir%)%)%)%)%)%,%
%TARDIR,%(%else-then(%TARDIR%,%(%toupper(%Tardir%)%)%)%)%,%
%tardir,%(%else-then(%_tardir%,%(%tolower(%Tardir%)%)%)%)%,%
%is_tardir2,%(%else-then(%is_tardir2%,%(%is_Tardir2%)%)%)%,%
%tardir2,%(%else-then(%if-no(%is_tardir2%,,%(%tardir2%)%)%,%(%if-no(%is_tardir2%,,%(./tar/$2%then-if(%Hostname%,/)%)%)%)%)%)%,%
%Tardir2,%(%else-then(%if-no(%is_tardir2%,,%(%Tardir2%)%)%,%(%if-no(%is_tardir2%,,%(%tardir2%)%)%)%)%)%,%
%TARDIR2,%(%else-then(%TARDIR2%,%(%toupper(%Tardir2%)%)%)%)%,%
%tardir2,%(%else-then(%_tardir2%,%(%tolower(%Tardir2%)%)%)%)%,%
%%(%
%%include(%Include_path%/file-bash.t)%%
%
if [ "$1" != "" ]; then
mkdir -p %Tardir%
if [ "$1" == "scripts" ]; then
mkdir -p scripts
cp tarme.sh scripts
fi # [ "$1" == "scripts" ]; then
if [ "$1" == "tar" ]; then
if [ "$2" != "" ]; then
mkdir -p %Tardir2%
pushd  %Tardir2%/..
tarit . %RepositoryHostname% %Hostname%
popd
else # [ "$2" != "" ]; then
pushd  %Tardir%/..
tarit . %RepositoryHostname% %Hostname%
popd
fi # [ "$2" != "" ]; then
else # [ "$1" == "tar" ]; then
if [ "$2" != "" ]; then
mkdir -p %Tardir2%
tarit %Tardir2% %RepositoryHostname% $1
else # [ "$2" != "" ]; then
tarit %Tardir% %RepositoryHostname% $1
fi # [ "$2" != "" ]; then
fi # [ "$1" == "tar" ]; then
else # [ "$1" != "" ]; then
mkdir -p %Tardir%
mkdir -p scripts
cp tarme.sh scripts
tarit %Tardir% %RepositoryHostname% scripts
fi # [ "$1" != "" ]; then
%
%)%)%