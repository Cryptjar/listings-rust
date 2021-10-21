\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesPackage{listings-rust}[2021/10/21 Rust Listings]

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
	% [1] structs
	% [2] enums
	% [3] traits
	% [4] macros
	% [5] typdef
	% [6] unions
	% [7] primitive types
	% [8] type and value constructors
	% [9] definition keywords
	% [10] statement keywords
	% [11] type-like keywords
	% [12] other keywords
	%
	%
	% Struct Type Names
	%
	morekeywords=[1]{ {{ structs }} }, %
	%
	% Enum Type Names
	%
	morekeywords=[2]{ {{ enums }} }, %
	%
	% Trait Names
	%
	morekeywords=[3]{ {{ traits }} }, %
	%
	% Macro Names
	%
	morekeywords=[4]{ {{ macros }} }, %
	%
	% Typedefs
	%
	morekeywords=[5]{ {{ typdefs }} }, %
	%
	% Union Names
	%
	morekeywords=[6]{ {{ unions }} }, %
	%
	% Primitive Types
	%
	morekeywords=[7]{bool, char, f32, f64, i8, i16, i32, i64, isize, str, u8, u16, u32, u64, unit, usize, i128, u128},  % primitive types
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
	morekeywords=[12]{crate, self, super} % path-likes
}%

% [1] structs
% [2] enums
% [3] traits
% [4] macros
% [5] typdef
% [6] unions
% [7] primitive types
% [8] type and value constructors
% [9] definition keywords
% [10] statement keywords
% [11] type-like keywords
% [12] other keywords


\lstdefinestyle{rust-defs}{ %
	basicstyle=\ttfamily, %
	language=rust, %
	identifierstyle=, %
	procnamestyle=\color[rgb]{0.604, 0.431, 0.192}, % function declaration rgb(154, 110, 49)
	commentstyle={\itshape\color[gray]{0.302}}, % #4D4D4C
	stringstyle=\color[rgb]{0.443, 0.549, 0.0}, % #718C00
	%
	% Attributes, e.g. `#[foobar]` => rgb(200, 40, 41)
	moredelim=[s][{\color[rgb]{0.784, 0.157, 0.161}}]{\#[}{]}, %
	%
	keywordstyle=[1]\color[rgb]{0.678, 0.267, 0.557}, % structs #ad448e
	keywordstyle=[2]\color[rgb]{0.314, 0.505, 0.341}, % enums #508157
	keywordstyle=[3]\color[rgb]{0.486, 0.353, 0.953}, % traits #7c5af3
	keywordstyle=[4]\color[rgb]{0.024, 0.502, 0.000}, % macros #068000
	keywordstyle=[5]\color[rgb]{0.729, 0.365, 0.000}, % typdef #ba5d00
	keywordstyle=[6]\color[rgb]{0.462, 0.482, 0.153}, % unions #767b27
	%
	keywordstyle=[7]\color[rgb]{0.173, 0.502, 0.576}, % primitive types rgb(44	128, 147)
	keywordstyle=[8]\color[rgb]{0.784, 0.157, 0.161}, % prelude values #C82829
	keywordstyle=[9]\bfseries, % Def Keywords
	keywordstyle=[10]\bfseries, % Stmt Keywords
	keywordstyle=[11]{\color[rgb]{0.259, 0.443, 0.682}}, % Ty Keywords
	keywordstyle=[12]{}, % Other Keywords
%, columns=spaceflexible%
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
	% Attributes, e.g. `#[foobar]` => rgb(200, 40, 41)
	moredelim=[s][{\color[rgb]{0.784, 0.157, 0.161}}]{\#[}{]}, %
	identifierstyle=, %
	commentstyle={\itshape\color[gray]{0.302}}, % #4D4D4C
	stringstyle=\color[rgb]{0.443, 0.549, 0.0}, % #718C00
	%
	keywordstyle=[1]{}, % structs
	keywordstyle=[2]{}, % enums
	keywordstyle=[3]{}, % traits
	keywordstyle=[4]\color[rgb]{0.243, 0.600, 0.624}, % macros #3E999F
	keywordstyle=[5]{}, % typdefs
	keywordstyle=[6]{}, % unions
	keywordstyle=[7]\color[rgb]{0.173, 0.502, 0.576}, % primitive types rgb(44, 128, 147)
	keywordstyle=[8]\color[rgb]{0.784, 0.157, 0.161}, % prelude values #C82829
	keywordstyle=[9]{\color[rgb]{0.537, 0.349, 0.659}}, % Def keywords #8959A8
	keywordstyle=[10]{\color[rgb]{0.537, 0.349, 0.659}}, % Stmt keywords #8959A8
	keywordstyle=[11]{\color[rgb]{0.259, 0.443, 0.682}}, % Ty Keywords
	keywordstyle=[12]{\bfseries}, % Other Keywords
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
	% Attributes, e.g. `#[foobar]` => rgb(200, 40, 41)
	moredelim=[s][{\itshape}]{\#[}{]}, %
	identifierstyle=, %
	commentstyle={\itshape\color[gray]{0.302}}, % #4D4D4C
	stringstyle={}, %
	%
	keywordstyle=[1]{}, % structs
	keywordstyle=[2]{}, % enums
	keywordstyle=[3]{}, % traits
	keywordstyle=[4]{}, % macros
	keywordstyle=[5]{}, % typdef
	keywordstyle=[6]{}, % union
	keywordstyle=[7]{\bfseries}, % primitive types
	keywordstyle=[8]{}, % primitive types
	keywordstyle=[9]{\bfseries}, % Def keywords
	keywordstyle=[10]{\bfseries}, % Stmt keywords
	keywordstyle=[11]{}, % Ty keywords
	keywordstyle=[12]{\bfseries}, % Other keywords
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
	numbers=left, %
	firstnumber=auto, %
	numberblanklines=true, %
	breaklines=true, %
	breakatwhitespace=true, %
	frame=trbL, %
	numberstyle={\tiny\noncopynumber}, %
	frame=leftline, %
	numbersep=3pt, %
	framesep=5pt, %
	framerule=15pt, %
	xleftmargin=15pt, %
	backgroundcolor=\color[gray]{0.97}, %
	rulecolor=\color[gray]{0.90}, %
}

% Adds line number and a horizontal lines
\lstdefinestyle{lined}{ %
	float=tbph, %
	frame=lines, %
	framesep=5pt, %
	captionpos=b, %
	abovecaptionskip=1em, %
	numbers=left, %
	breaklines=true, %
	breakatwhitespace=true, %
%	prebreak=\raisebox{0ex}[0ex][0ex]{\color{gray}\ensuremath{\searrow}},
	xleftmargin=15pt, %
	framexleftmargin=15pt, %
	numberstyle=\tiny, %
	numbersep=5pt, %
	stepnumber=1, %
	fontadjust, %
}



