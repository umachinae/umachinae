%########################################################################
%# Copyright (c) 1988-2020 $organization$
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
%#   File: cclass-hxx.t
%#
%# Author: $author$
%#   Date: 2/7/2020
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_class,%(%else-then(%is_class%,%(%is_Class%)%)%)%,%
%class,%(%else-then(%if-no(%is_class%,,%(%class%)%)%,%(%if-no(%is_class%,,%(Class)%)%)%)%)%,%
%Class,%(%else-then(%if-no(%is_class%,,%(%Class%)%)%,%(%class%)%)%)%,%
%CLASS,%(%else-then(%CLASS%,%(%toupper(%Class%)%)%)%)%,%
%class,%(%else-then(%_class%,%(%tolower(%Class%)%)%)%)%,%
%is_implements,%(%else-then(%is_implements%,%(%is_Implements%)%)%)%,%
%implements,%(%else-then(%if-no(%is_implements%,,%(%implements%)%)%,%(%if-no(%is_implements%,,%(Implements)%)%)%)%)%,%
%Implements,%(%else-then(%if-no(%is_implements%,,%(%Implements%)%)%,%(%implements%)%)%)%,%
%IMPLEMENTS,%(%else-then(%IMPLEMENTS%,%(%toupper(%Implements%)%)%)%)%,%
%implements,%(%else-then(%_implements%,%(%tolower(%Implements%)%)%)%)%,%
%is_extends,%(%else-then(%is_extends%,%(%is_Extends%)%)%)%,%
%extends,%(%else-then(%if-no(%is_extends%,,%(%extends%)%)%,%(%if-no(%is_extends%,,%(Extends)%)%)%)%)%,%
%Extends,%(%else-then(%if-no(%is_extends%,,%(%Extends%)%)%,%(%extends%)%)%)%,%
%EXTENDS,%(%else-then(%EXTENDS%,%(%toupper(%Extends%)%)%)%)%,%
%extends,%(%else-then(%_extends%,%(%tolower(%Extends%)%)%)%)%,%
%is_constructor,%(%else-then(%is_constructor%,%(%is_Constructor%)%)%)%,%
%constructor,%(%else-then(%if-no(%is_constructor%,,%(%constructor%)%)%,%(%if-no(%is_constructor%,,%(%if(%Extends%,yes)%)%)%)%)%)%,%
%Constructor,%(%else-then(%if-no(%is_constructor%,,%(%Constructor%)%)%,%(%if-no(%is_constructor%,,%(%constructor%)%)%)%)%)%,%
%CONSTRUCTOR,%(%else-then(%CONSTRUCTOR%,%(%toupper(%Constructor%)%)%)%)%,%
%constructor,%(%else-then(%_constructor%,%(%tolower(%Constructor%)%)%)%)%,%
%is_destructor,%(%else-then(%is_destructor%,%(%is_Destructor%)%)%)%,%
%destructor,%(%else-then(%if-no(%is_destructor%,,%(%destructor%)%)%,%(%if-no(%is_destructor%,,%(yes)%)%)%)%)%,%
%Destructor,%(%else-then(%if-no(%is_destructor%,,%(%Destructor%)%)%,%(%if-no(%is_destructor%,,%(%destructor%)%)%)%)%)%,%
%DESTRUCTOR,%(%else-then(%DESTRUCTOR%,%(%toupper(%Destructor%)%)%)%)%,%
%destructor,%(%else-then(%_destructor%,%(%tolower(%Destructor%)%)%)%)%,%
%%(/**
 **********************************************************************
 * Copyright (c) 1988-%year()% $organization$
 *
 * This software is provided by the author and contributors ``as is'' 
 * and any express or implied warranties, including, but not limited to, 
 * the implied warranties of merchantability and fitness for a particular 
 * purpose are disclaimed. In no event shall the author or contributors 
 * be liable for any direct, indirect, incidental, special, exemplary, 
 * or consequential damages (including, but not limited to, procurement 
 * of substitute goods or services; loss of use, data, or profits; or 
 * business interruption) however caused and on any theory of liability, 
 * whether in contract, strict liability, or tort (including negligence 
 * or otherwise) arising in any way out of the use of this software, 
 * even if advised of the possibility of such damage.
 *
 *   File: %base%.%extension%
 *
 * Author: $author$
 *   Date: %date()%
 **********************************************************************
 */
#ifndef %CLASS%_HXX
#define %CLASS%_HXX

#include "%include%"

/**
 **********************************************************************
 * Class: %Class%
 *
 * Author: $author$
 *   Date: %date()%
 **********************************************************************
 */
class %Class%%if(%Implements%%Extends%,%(: %if(%Implements%,%(virtual public %Implements%)%)%%if(%Extends%,%(%if(%Implements%,%(, )%)%public %Extends%)%)%)%)% {
public:%if(%Implements%,%(
    typedef %Implements% cImplements;)%)%%if(%Extends%,%(
    typedef %Extends% cExtends;)%)%
    typedef %Class% cDerives;%if(%Constructor%%Destructor%,%(
    /**
     **********************************************************************
     * %if(%Constructor%,%(Constructor: %Class%%if(%Destructor%, / )%)%)%%if(%Destructor%,%(Destructor: ~%Class%)%)%
     *
     * Author: $author$
     *   Date: %date()%
     **********************************************************************
     */)%)%%if(%Constructor%,%(
    %Class%() {
    })%)%%if(%Destructor%,%(
    virtual ~%Class%() {
    })%)%
}; /* class %Class% */

#endif /* ndef %CLASS%_HXX */
)%)%