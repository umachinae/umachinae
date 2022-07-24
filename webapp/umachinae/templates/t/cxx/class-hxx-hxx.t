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
%#   File: class-hxx-hxx.t
%#
%# Author: $author$
%#   Date: 5/2/2019
%########################################################################
%with(%
%is_typedef_implements,%(%else-then(%is_typedef_implements%,%(%is_Typedef_implements%)%)%)%,%
%typedef_implements,%(%else-then(%if-no(%is_typedef_implements%,,%(%typedef_implements%)%)%,%(%if-no(%is_typedef_implements%,,%(Implements)%)%)%)%)%,%
%Typedef_implements,%(%else-then(%if-no(%is_typedef_implements%,,%(%Typedef_implements%)%)%,%(%if-no(%is_typedef_implements%,,%(%typedef_implements%)%)%)%)%)%,%
%TYPEDEF_IMPLEMENTS,%(%else-then(%TYPEDEF_IMPLEMENTS%,%(%toupper(%Typedef_implements%)%)%)%)%,%
%typedef_implements,%(%else-then(%_typedef_implements%,%(%tolower(%Typedef_implements%)%)%)%)%,%
%is_typedef_extends,%(%else-then(%is_typedef_extends%,%(%is_Typedef_extends%)%)%)%,%
%typedef_extends,%(%else-then(%if-no(%is_typedef_extends%,,%(%typedef_extends%)%)%,%(%if-no(%is_typedef_extends%,,%(Extends)%)%)%)%)%,%
%Typedef_extends,%(%else-then(%if-no(%is_typedef_extends%,,%(%Typedef_extends%)%)%,%(%if-no(%is_typedef_extends%,,%(%typedef_extends%)%)%)%)%)%,%
%TYPEDEF_EXTENDS,%(%else-then(%TYPEDEF_EXTENDS%,%(%toupper(%Typedef_extends%)%)%)%)%,%
%typedef_extends,%(%else-then(%_typedef_extends%,%(%tolower(%Typedef_extends%)%)%)%)%,%
%is_typedef_derives,%(%else-then(%is_typedef_derives%,%(%is_Typedef_derives%)%)%)%,%
%typedef_derives,%(%else-then(%if-no(%is_typedef_derives%,,%(%typedef_derives%)%)%,%(%if-no(%is_typedef_derives%,,%(Derives)%)%)%)%)%,%
%Typedef_derives,%(%else-then(%if-no(%is_typedef_derives%,,%(%Typedef_derives%)%)%,%(%if-no(%is_typedef_derives%,,%(%typedef_derives%)%)%)%)%)%,%
%TYPEDEF_DERIVES,%(%else-then(%TYPEDEF_DERIVES%,%(%toupper(%Typedef_derives%)%)%)%)%,%
%typedef_derives,%(%else-then(%_typedef_derives%,%(%tolower(%Typedef_derives%)%)%)%)%,%
%is_copy_constructor,%(%else-then(%is_copy_constructor%,%(%is_Copy_constructor%)%)%)%,%
%copy_constructor,%(%else-then(%if-no(%is_copy_constructor%,,%(%copy_constructor%)%)%,%(%if-no(%is_copy_constructor%,,%()%)%)%)%)%,%
%Copy_constructor,%(%else-then(%if-no(%is_copy_constructor%,,%(%Copy_constructor%)%)%,%(%if-no(%is_copy_constructor%,,%(%copy_constructor%)%)%)%)%)%,%
%COPY_CONSTRUCTOR,%(%else-then(%COPY_CONSTRUCTOR%,%(%toupper(%Copy_constructor%)%)%)%)%,%
%copy_constructor,%(%else-then(%_copy_constructor%,%(%tolower(%Copy_constructor%)%)%)%)%,%
%is_constructor,%(%else-then(%is_constructor%,%(%is_Constructor%)%)%)%,%
%constructor,%(%else-then(%if-no(%is_constructor%,,%(%constructor%)%)%,%(%if-no(%is_constructor%,,%()%)%)%)%)%,%
%Constructor,%(%else-then(%if-no(%is_constructor%,,%(%Constructor%)%)%,%(%if-no(%is_constructor%,,%(%constructor%)%)%)%)%)%,%
%CONSTRUCTOR,%(%else-then(%CONSTRUCTOR%,%(%toupper(%Constructor%)%)%)%)%,%
%constructor,%(%else-then(%_constructor%,%(%tolower(%Constructor%)%)%)%)%,%
%is_destructor,%(%else-then(%is_destructor%,%(%is_Destructor%)%)%)%,%
%is_is_destructor,%(%else-then(%is_is_destructor%,%(%is_is_Destructor%)%)%)%,%
%destructor,%(%else-then(%if-no(%is_destructor%,,%(%destructor%)%)%,%(%if-no(%is_destructor%,,%(%if-no(%is_is_destructor%,,%(virtual)%)%)%)%)%)%)%,%
%Destructor,%(%else-then(%if-no(%is_destructor%,,%(%Destructor%)%)%,%(%if-no(%is_destructor%,,%(%destructor%)%)%)%)%)%,%
%DESTRUCTOR,%(%else-then(%DESTRUCTOR%,%(%toupper(%Destructor%)%)%)%)%,%
%destructor,%(%else-then(%_destructor%,%(%tolower(%Destructor%)%)%)%)%,%
%is_copy_constructor_public,%(%else-then(%is_copy_constructor_public%,%(%is_Copy_constructor_public%)%)%)%,%
%copy_constructor_public,%(%else-then(%if-no(%is_copy_constructor_public%,,%(%copy_constructor_public%)%)%,%(%if-no(%is_copy_constructor_public%,,%(%equal(public,%Copy_constructor_access%)%)%)%)%)%)%,%
%Copy_constructor_public,%(%else-then(%if-no(%is_copy_constructor_public%,,%(%Copy_constructor_public%)%)%,%(%if-no(%is_copy_constructor_public%,,%(%copy_constructor_public%)%)%)%)%)%,%
%COPY_CONSTRUCTOR_PUBLIC,%(%else-then(%COPY_CONSTRUCTOR_PUBLIC%,%(%toupper(%Copy_constructor_public%)%)%)%)%,%
%copy_constructor_public,%(%else-then(%_copy_constructor_public%,%(%tolower(%Copy_constructor_public%)%)%)%)%,%
%is_copy_constructor_protected,%(%else-then(%is_copy_constructor_protected%,%(%is_Copy_constructor_protected%)%)%)%,%
%copy_constructor_protected,%(%else-then(%if-no(%is_copy_constructor_protected%,,%(%copy_constructor_protected%)%)%,%(%if-no(%is_copy_constructor_protected%,,%(%equal(protected,%Copy_constructor_access%)%)%)%)%)%)%,%
%Copy_constructor_protected,%(%else-then(%if-no(%is_copy_constructor_protected%,,%(%Copy_constructor_protected%)%)%,%(%if-no(%is_copy_constructor_protected%,,%(%copy_constructor_protected%)%)%)%)%)%,%
%COPY_CONSTRUCTOR_PROTECTED,%(%else-then(%COPY_CONSTRUCTOR_PROTECTED%,%(%toupper(%Copy_constructor_protected%)%)%)%)%,%
%copy_constructor_protected,%(%else-then(%_copy_constructor_protected%,%(%tolower(%Copy_constructor_protected%)%)%)%)%,%
%is_copy_constructor_private,%(%else-then(%is_copy_constructor_private%,%(%is_Copy_constructor_private%)%)%)%,%
%copy_constructor_private,%(%else-then(%if-no(%is_copy_constructor_private%,,%(%copy_constructor_private%)%)%,%(%if-no(%is_copy_constructor_private%,,%(%equal(private,%Copy_constructor_access%)%)%)%)%)%)%,%
%Copy_constructor_private,%(%else-then(%if-no(%is_copy_constructor_private%,,%(%Copy_constructor_private%)%)%,%(%if-no(%is_copy_constructor_private%,,%(%copy_constructor_private%)%)%)%)%)%,%
%COPY_CONSTRUCTOR_PRIVATE,%(%else-then(%COPY_CONSTRUCTOR_PRIVATE%,%(%toupper(%Copy_constructor_private%)%)%)%)%,%
%copy_constructor_private,%(%else-then(%_copy_constructor_private%,%(%tolower(%Copy_constructor_private%)%)%)%)%,%
%is_constructor_public,%(%else-then(%is_constructor_public%,%(%is_Constructor_public%)%)%)%,%
%constructor_public,%(%else-then(%if-no(%is_constructor_public%,,%(%constructor_public%)%)%,%(%if-no(%is_constructor_public%,,%(%equal(public,%Constructor_access%)%)%)%)%)%)%,%
%Constructor_public,%(%else-then(%if-no(%is_constructor_public%,,%(%Constructor_public%)%)%,%(%if-no(%is_constructor_public%,,%(%constructor_public%)%)%)%)%)%,%
%CONSTRUCTOR_PUBLIC,%(%else-then(%CONSTRUCTOR_PUBLIC%,%(%toupper(%Constructor_public%)%)%)%)%,%
%constructor_public,%(%else-then(%_constructor_public%,%(%tolower(%Constructor_public%)%)%)%)%,%
%is_constructor_protected,%(%else-then(%is_constructor_protected%,%(%is_Constructor_protected%)%)%)%,%
%constructor_protected,%(%else-then(%if-no(%is_constructor_protected%,,%(%constructor_protected%)%)%,%(%if-no(%is_constructor_protected%,,%(%equal(protected,%Constructor_access%)%)%)%)%)%)%,%
%Constructor_protected,%(%else-then(%if-no(%is_constructor_protected%,,%(%Constructor_protected%)%)%,%(%if-no(%is_constructor_protected%,,%(%constructor_protected%)%)%)%)%)%,%
%CONSTRUCTOR_PROTECTED,%(%else-then(%CONSTRUCTOR_PROTECTED%,%(%toupper(%Constructor_protected%)%)%)%)%,%
%constructor_protected,%(%else-then(%_constructor_protected%,%(%tolower(%Constructor_protected%)%)%)%)%,%
%is_constructor_private,%(%else-then(%is_constructor_private%,%(%is_Constructor_private%)%)%)%,%
%constructor_private,%(%else-then(%if-no(%is_constructor_private%,,%(%constructor_private%)%)%,%(%if-no(%is_constructor_private%,,%(%equal(private,%Constructor_access%)%)%)%)%)%)%,%
%Constructor_private,%(%else-then(%if-no(%is_constructor_private%,,%(%Constructor_private%)%)%,%(%if-no(%is_constructor_private%,,%(%constructor_private%)%)%)%)%)%,%
%CONSTRUCTOR_PRIVATE,%(%else-then(%CONSTRUCTOR_PRIVATE%,%(%toupper(%Constructor_private%)%)%)%)%,%
%constructor_private,%(%else-then(%_constructor_private%,%(%tolower(%Constructor_private%)%)%)%)%,%
%is_destructor_public,%(%else-then(%is_destructor_public%,%(%is_Destructor_public%)%)%)%,%
%destructor_public,%(%else-then(%if-no(%is_destructor_public%,,%(%destructor_public%)%)%,%(%if-no(%is_destructor_public%,,%(%equal(public,%Destructor_access%)%)%)%)%)%)%,%
%Destructor_public,%(%else-then(%if-no(%is_destructor_public%,,%(%Destructor_public%)%)%,%(%if-no(%is_destructor_public%,,%(%destructor_public%)%)%)%)%)%,%
%DESTRUCTOR_PUBLIC,%(%else-then(%DESTRUCTOR_PUBLIC%,%(%toupper(%Destructor_public%)%)%)%)%,%
%destructor_public,%(%else-then(%_destructor_public%,%(%tolower(%Destructor_public%)%)%)%)%,%
%is_destructor_protected,%(%else-then(%is_destructor_protected%,%(%is_Destructor_protected%)%)%)%,%
%destructor_protected,%(%else-then(%if-no(%is_destructor_protected%,,%(%destructor_protected%)%)%,%(%if-no(%is_destructor_protected%,,%(%equal(protected,%Destructor_access%)%)%)%)%)%)%,%
%Destructor_protected,%(%else-then(%if-no(%is_destructor_protected%,,%(%Destructor_protected%)%)%,%(%if-no(%is_destructor_protected%,,%(%destructor_protected%)%)%)%)%)%,%
%DESTRUCTOR_PROTECTED,%(%else-then(%DESTRUCTOR_PROTECTED%,%(%toupper(%Destructor_protected%)%)%)%)%,%
%destructor_protected,%(%else-then(%_destructor_protected%,%(%tolower(%Destructor_protected%)%)%)%)%,%
%is_destructor_private,%(%else-then(%is_destructor_private%,%(%is_Destructor_private%)%)%)%,%
%destructor_private,%(%else-then(%if-no(%is_destructor_private%,,%(%destructor_private%)%)%,%(%if-no(%is_destructor_private%,,%(%equal(private,%Destructor_access%)%)%)%)%)%)%,%
%Destructor_private,%(%else-then(%if-no(%is_destructor_private%,,%(%Destructor_private%)%)%,%(%if-no(%is_destructor_private%,,%(%destructor_private%)%)%)%)%)%,%
%DESTRUCTOR_PRIVATE,%(%else-then(%DESTRUCTOR_PRIVATE%,%(%toupper(%Destructor_private%)%)%)%)%,%
%destructor_private,%(%else-then(%_destructor_private%,%(%tolower(%Destructor_private%)%)%)%)%,%
%%(%
%%if-no(%is_Class%,,%(%
%%if-no(%is_Template%,%(%then-if(%if-then(%Implements%, %ClassT%Implements;)%,
typedef )%%
%%then-if(%if-then(%Extends%, %ClassT%Extends;)%,
typedef )%)%)%
%Separator_begin%/// class %ClassT%
%Separator_end%%if-no(%is_Template%,,%(template <%Template%>
)%)%class %if-then(%Exported%, )%%ClassT%%
%%then-if(%then-if(%if-then(%ClassTImplements%,%if(%ClassTExtends%,%(,)%)%)%, virtual public )%%
%%then-if(%ClassTExtends%, public )%,:)% {
public:
    %if-then(%then-if(%if-then(%if(%Typedef_implements%,%ClassTImplements%)%, %Typedef_implements%;
    )%,typedef )%%then-if(%if-then(%if(%Typedef_extends%,%ClassTExtends%)%, %Typedef_extends%;
    )%,typedef )%%then-if(%if-then(%if(%Typedef_derives%,%ClassT%)%, %Typedef_derives%; 
    )%,typedef )%,
    )%%if(%if-no(%is_copy_constructor%,,yes)%%if-no(%is_constructor%,,yes)%%if-no(%is_destructor%,,yes)%,%(%
%%if-then(%Separator_begin%,    )%/// constructors / destructor
%then-if(%Separator_end%,    )%%if-no(%is_copy_constructor%,,%(%if(%Copy_constructor_public%,%(%
%    %if-then(%Copy_constructor%,%( )%)%%ClassT%%(()%const %ClassT%& copy%())%%if(%ClassTExtends%,%(: %Typedef_extends%%(()%copy%())%)%)% {
    }
)%)%)%)%%
%%if-no(%is_constructor%,,%(%if(%Constructor_public%,%(%
%    %if-then(%Constructor%,%( )%)%%ClassT%%(()%%())% {
    }
)%)%)%)%%
%%if-no(%is_destructor%,,%(%if(%Destructor_public%,%(%
%    %if-then(%Destructor%,%( )%)%~%ClassT%%(()%%())% {
    }
)%)%)%)%%
%)%)%%
%%if(%Copy_constructor_protected%%Constructor_protected%%Destructor_protected%,%(protected:
%if-no(%is_copy_constructor%,,%(%if(%Copy_constructor_protected%,%(%
%    %if-then(%Copy_constructor%,%( )%)%%ClassT%%(()%const %ClassT%& copy%())%%if(%ClassTExtends%,%(: %Typedef_extends%%(()%copy%())%)%)% {
    }
)%)%)%)%%
%%if-no(%is_constructor%,,%(%if(%Constructor_protected%,%(%
%    %if-then(%Constructor%,%( )%)%%ClassT%%(()%%())% {
    }
)%)%)%)%%
%%if-no(%is_destructor%,,%(%if(%Destructor_protected%,%(%
%    %if-then(%Destructor%,%( )%)%~%ClassT%%(()%%())% {
    }
)%)%)%)%%
)%)%%
%%if(%Copy_constructor_private%%Constructor_private%%Destructor_private%,%(private:
%if-no(%is_copy_constructor%,,%(%if(%Copy_constructor_private%,%(%
%    %if-then(%Copy_constructor%,%( )%)%%ClassT%%(()%const %ClassT%& copy%())%%if(%ClassTExtends%,%(: %Typedef_extends%%(()%copy%())%)%)% {
    }
)%)%)%)%%
%%if-no(%is_constructor%,,%(%if(%Constructor_private%,%(%
%    %if-then(%Constructor%,%( )%)%%ClassT%%(()%%())% {
    }
)%)%)%)%%
%%if-no(%is_destructor%,,%(%if(%Destructor_private%,%(%
%    %if-then(%Destructor%,%( )%)%~%ClassT%%(()%%())% {
    }
)%)%)%)%%
)%)%%
%}; /// class %ClassT%
%if-no(%is_Template%,,%(typedef %ClassT%<> %Class%;
)%)%%
%)%)%%
%)%)%