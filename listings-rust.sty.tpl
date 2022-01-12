\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesPackage{listings-rust}[2022/01/12 Rust Listings]

\RequirePackage{color}
\RequirePackage[procnames]{listings}
\RequirePackage{accsupp}

\newcommand{\noncopynumber}[1]{
    \BeginAccSupp{method=escape,ActualText={}}
    #1
    \EndAccSupp{}
}

{#
A little hacky way to color numerals. Doesn't really work, just colors all digits.
\newcommand{\colornumber}{\color{red}}
\lstset{literate=%
    {0}{{ "{{{\colornumber{0}}}}" }}1
    {1}{{ "{{{\colornumber{1}}}}" }}1
    {2}{{ "{{{\colornumber{2}}}}" }}1
    {3}{{ "{{{\colornumber{3}}}}" }}1
    {4}{{ "{{{\colornumber{4}}}}" }}1
    {5}{{ "{{{\colornumber{5}}}}" }}1
    {6}{{ "{{{\colornumber{6}}}}" }}1
    {7}{{ "{{{\colornumber{7}}}}" }}1
    {8}{{ "{{{\colornumber{8}}}}" }}1
    {9}{{ "{{{\colornumber{9}}}}" }}1
}
#}

\lstdefinelanguage{rust}{ %
	sensitive, %
	alsodigit={_}, %
	alsoother={}, %
	alsoletter={!}, %
	% Comments
	morecomment=[l]{//}, %
	morecomment=[l]{///}, %
	morecomment=[l]{//!}, %
	morecomment=[n]{/*}{*/}, %
	% String literals
	morestring=[b]{"}, %
	%
	% Identifies defined symbols, such as functions, statics & modules
	moreprocnamekeys={fn}, %
	moreprocnamekeys={static,const}, %
	moreprocnamekeys={mod}, %
	%
	% Keyword classes
	%
	% [1] user structs
	% [2] user enums
	% [3] user traits
	% [4] user macros
	% [5] user typdef
	% [6] user unions
	% [7] primitive types
	% [8] type and value constructors
	% [9] definition keywords
	% [10] statement keywords
	% [11] type-like keywords
	% [12] other keywords
	% [13] generated structs
	% [14] generated enums
	% [15] generated traits
	% [16] generated macros
	% [17] generated typdef
	% [18] generated unions
	%
	% About the keyword classes, we want to allow users to easily add custom
	% struct names and stuff, however we also want the predefined stuff in
	% classes 7-12 to take precedence over the automatically generate names.
	% Thus automatically generated names get classes 13-18, which the
	% corresponding user defined classes are 1-6.
	%
	% This complicated arrangement is particularly important, because as of the
	% time of writing there is a struct definition with named `bool` somewhere
	% in the Rust source. Thus if the priorities are neglected, `bool` gets
	% highlighted as struct instead of a primitive type.
	%
	% While the automatically generated names could be filtered for occurrences,
	% of `bool` or any other perdefined name, it actually seems easier and more
	% robust to just adjust the order of definition.
	%
	%
	% User Struct Type Names
	%
	morekeywords=[1]{}, % left empty, to be filled by the user via `\lstset`
	%
	% User Enum Type Names
	%
	morekeywords=[2]{}, % left empty, to be filled by the user via `\lstset`
	%
	% User Trait Names
	%
	morekeywords=[3]{}, % left empty, to be filled by the user via `\lstset`
	%
	% User Macro Names
	%
	morekeywords=[4]{}, % left empty, to be filled by the user via `\lstset`
	%
	% User Typedefs
	%
	morekeywords=[5]{}, % left empty, to be filled by the user via `\lstset`
	%
	% User Union Names
	%
	morekeywords=[6]{}, % left empty, to be filled by the user via `\lstset`
	%
	% Primitive Types
	%
	morekeywords=[7]{bool, char, f32, f64, i8, i16, i32, i64, isize, str, u8, u16, u32, u64, unit, usize, i128, u128, !},  % primitive types
	%
	% Prelude Values and Constructors
	%
	morekeywords=[8]{Err, false, None, Ok, Some, true}, % prelude value constructors
	%
	% Definition Keywords
	%
	morekeywords=[9]{const, enum, fn, impl, mod, static, struct, trait, type, union}, % definitions
	morekeywords=[9]{async, extern, pub, unsafe, where}, % modifier/marker
	%
	% Statement Keywords
	%
	morekeywords=[10]{break, continue, else, for, if, in, let, loop, match, return, use, while}, % statements
	morekeywords=[10]{as, await, move,}, % operators
	%
	% Type-like Keywords
	%
	morekeywords=[11]{const, dyn, ref, mut, Self}, % type-likes
	%
	% Other Keywords
	%
	morekeywords=[12]{crate, self, super}, % path-likes
	%
	% Generated Struct Type Names
	%
	morekeywords=[13]{ {{ structs }} }, %
	%
	% Generated Enum Type Names
	%
	morekeywords=[14]{ {{ enums }} }, %
	%
	% Generated Trait Names
	%
	morekeywords=[15]{ {{ traits }} }, %
	%
	% Generated Macro Names
	%
	morekeywords=[16]{ {{ macros }} }, %
	%
	% Generated Typedefs
	%
	morekeywords=[17]{ {{ typdefs }} }, %
	%
	% Generated Union Names
	%
	morekeywords=[18]{ {{ unions }} }, %
	%
	%
}%

% User-defined types
% [1] user structs
% [2] user enums
% [3] user traits
% [4] user macros
% [5] user typdef
% [6] user unions
% Primitive types & Keywords
% [7] primitive types
% [8] type and value constructors
% [9] definition keywords
% [10] statement keywords
% [11] type-like keywords
% [12] other keywords
% Core & Std types
% [13] generated structs
% [14] generated enums
% [15] generated traits
% [16] generated macros
% [17] generated typdef
% [18] generated unions


\lstdefinestyle{rust-defs}{ %
	basicstyle=\ttfamily, %
	language=rust, %
	%
	identifierstyle=, %
	commentstyle={\itshape\color[gray]{0.302}}, % #4D4D4C
	stringstyle=\color[rgb]{0.443, 0.549, 0.0}, % #718C00
	%
	% function/static/const names in declarations
	procnamestyle=\color[rgb]{0.604, 0.431, 0.192}, % function declaration rgb(154, 110, 49)
	%
	% Attributes, e.g. `#[foobar]` => rgb(200, 40, 41)
	moredelim=[s][{\color[rgb]{0.784, 0.157, 0.161}}]{\#[}{]}, %
	moredelim=[s][{\color[rgb]{0.784, 0.157, 0.161}}]{\#![}{]}, %
	%
	% User-defined types
	keywordstyle=[1]\color[rgb]{0.678, 0.267, 0.557}, % structs #ad448e
	keywordstyle=[2]\color[rgb]{0.314, 0.505, 0.341}, % enums #508157
	keywordstyle=[3]\color[rgb]{0.486, 0.353, 0.953}, % traits #7c5af3
	keywordstyle=[4]\color[rgb]{0.024, 0.502, 0.000}, % macros #068000
	keywordstyle=[5]\color[rgb]{0.729, 0.365, 0.000}, % typdef #ba5d00
	keywordstyle=[6]\color[rgb]{0.462, 0.482, 0.153}, % unions #767b27
	%
	% Primitive types & Keywords
	keywordstyle=[7]\color[rgb]{0.173, 0.502, 0.576}, % primitive types rgb(44	128, 147)
	keywordstyle=[8]\color[rgb]{0.784, 0.157, 0.161}, % prelude values #C82829
	keywordstyle=[9]\bfseries, % Def Keywords
	keywordstyle=[10]\bfseries, % Stmt Keywords
	keywordstyle=[11]{\color[rgb]{0.259, 0.443, 0.682}}, % Ty Keywords
	keywordstyle=[12]{}, % Other Keywords
	%
	% Core & Std types
	keywordstyle=[13]\color[rgb]{0.678, 0.267, 0.557}, % structs #ad448e
	keywordstyle=[14]\color[rgb]{0.314, 0.505, 0.341}, % enums #508157
	keywordstyle=[15]\color[rgb]{0.486, 0.353, 0.953}, % traits #7c5af3
	keywordstyle=[16]\color[rgb]{0.024, 0.502, 0.000}, % macros #068000
	keywordstyle=[17]\color[rgb]{0.729, 0.365, 0.000}, % typdef #ba5d00
	keywordstyle=[18]\color[rgb]{0.462, 0.482, 0.153}, % unions #767b27
	%
	literate=%
		{\&}{{ "{{{\bfseries\color[rgb]{0.259, 0.443, 0.682}\&}}}" }}1 % The ampersand rgb(66, 113, 174)
		{'}{{ "{{{\textquotesingle}}}" }}1 % Keeps apostrophes straight
	,% end of literate
	%
	columns=fixed, %
	keepspaces=true, %
	showspaces=false, %
	showtabs=false, %
	showstringspaces=true, %
}%

\lstdefinestyle{rust}{ %
	basicstyle=\ttfamily, %
	language=rust, %
	%
	identifierstyle=, %
	commentstyle={\itshape\color[gray]{0.302}}, % #4D4D4C
	stringstyle=\color[rgb]{0.443, 0.549, 0.0}, % #718C00
	%
	% Attributes, e.g. `#[foobar]` => rgb(200, 40, 41)
	moredelim=[s][{\color[rgb]{0.784, 0.157, 0.161}}]{\#[}{]}, %
	moredelim=[s][{\color[rgb]{0.784, 0.157, 0.161}}]{\#![}{]}, %
	%
	% User-defined types
	keywordstyle=[1]{}, % structs
	keywordstyle=[2]{}, % enums
	keywordstyle=[3]{}, % traits
	keywordstyle=[4]\color[rgb]{0.243, 0.600, 0.624}, % macros #3E999F
	keywordstyle=[5]{}, % typdefs
	keywordstyle=[6]{}, % unions
	%
	% Primitive types & Keywords
	keywordstyle=[7]\color[rgb]{0.173, 0.502, 0.576}, % primitive types rgb(44, 128, 147)
	keywordstyle=[8]\color[rgb]{0.784, 0.157, 0.161}, % prelude values #C82829
	keywordstyle=[9]{\color[rgb]{0.537, 0.349, 0.659}}, % Def keywords #8959A8
	keywordstyle=[10]{\color[rgb]{0.537, 0.349, 0.659}}, % Stmt keywords #8959A8
	keywordstyle=[11]{\color[rgb]{0.259, 0.443, 0.682}}, % Ty Keywords
	keywordstyle=[12]{\bfseries}, % Other Keywords
	%
	% Core & Std types
	keywordstyle=[13]{}, % structs
	keywordstyle=[14]{}, % enums
	keywordstyle=[15]{}, % traits
	keywordstyle=[16]\color[rgb]{0.243, 0.600, 0.624}, % macros #3E999F
	keywordstyle=[17]{}, % typdefs
	keywordstyle=[18]{}, % unions
	%
	literate=%
		{\&}{{ "{{{\bfseries\color[rgb]{0.259, 0.443, 0.682}\&}}}" }}1 % The ampersand rgb(66, 113, 174)
		{'}{{ "{{{\textquotesingle}}}" }}1 % Keeps apostrophes straight
	,% end of literate
	%
	columns=fixed, %
	keepspaces=true, %
	showspaces=false, %
	showtabs=false, %
	showstringspaces=true, %
}%

\lstdefinestyle{rust-bw}{ %
	basicstyle=\ttfamily, %
	language=rust, %
	%
	identifierstyle=, %
	commentstyle={\itshape\color[gray]{0.302}}, % #4D4D4C
	stringstyle={}, %
	%
	% Attributes, e.g. `#[foobar]` => rgb(200, 40, 41)
	moredelim=[s][{\slshape}]{\#[}{]}, %
	moredelim=[s][{\slshape}]{\#![}{]}, %
	%
	% User-defined types
	keywordstyle=[1]{}, % structs
	keywordstyle=[2]{}, % enums
	keywordstyle=[3]{}, % traits
	keywordstyle=[4]{}, % macros
	keywordstyle=[5]{}, % typdef
	keywordstyle=[6]{}, % union
	%
	% Primitive types & Keywords
	keywordstyle=[7]{\bfseries}, % primitive types
	keywordstyle=[8]{}, % primitive types
	keywordstyle=[9]{\bfseries}, % Def keywords
	keywordstyle=[10]{\bfseries}, % Stmt keywords
	keywordstyle=[11]{}, % Ty keywords
	keywordstyle=[12]{\bfseries}, % Other keywords
	%
	% Core & Std types
	keywordstyle=[13]{}, % structs
	keywordstyle=[14]{}, % enums
	keywordstyle=[15]{}, % traits
	keywordstyle=[16]{}, % macros
	keywordstyle=[17]{}, % typdef
	keywordstyle=[18]{}, % union
	%
	literate=%
		{\&}{{ "{{{\bfseries\&}}}" }}1 % The ampersand
		{'}{{ "{{{\textquotesingle}}}" }}1 % Keeps apostrophes straight
	,% end of literate
	%
	columns=fixed, %
	keepspaces=true, %
	showspaces=false, %
	showtabs=false, %
	showstringspaces=true, %
}%


% Adds a line number and 'boxes' the code via background color
\lstdefinestyle{boxed}{ %
	firstnumber=auto, %
	stepnumber=1, %
	numbers=left, %
	numberstyle={\tiny\noncopynumber}, %
	numbersep=3pt, %
	numberblanklines=true, %
	breaklines=true, %
	breakatwhitespace=true, %
	frame=leftline, %
	framesep=5pt, %
	framerule=15pt, %
	backgroundcolor=\color[gray]{0.97}, %
	rulecolor=\color[gray]{0.90}, %
}

% Adds line number and a horizontal lines
\lstdefinestyle{lined}{ %
	firstnumber=auto, %
	stepnumber=1, %
	numbers=left, %
	numberstyle={\tiny\noncopynumber}, %
	numbersep=3pt, %
	numberblanklines=true, %
	breaklines=true, %
	breakatwhitespace=true, %
	frame=lines, %
	framesep=5pt, %
	captionpos=b, %
	abovecaptionskip=0.5em, %
}



