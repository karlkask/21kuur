\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{21kuur}[2013/10/24 21.kooli uurimustöö vormistuse klass]

\LoadClass[12pt]{report}  % Use standard report class as base of the custom class

% Page layout
\usepackage{geometry}
\geometry{top=2.50cm, bottom=2.50cm, left=3cm, right=2cm}% Margins
\geometry{paperwidth=210mm, paperheight=297mm} % A4 papersize
\geometry{textwidth=160mm, textheight=247mm, headheight=0cm, headsep=0cm}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

\usepackage[estonian]{babel} % Set estonian as default language

\usepackage{tocbibind}

% Chapter page break
\usepackage{etoolbox}
\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}

\usepackage{tocloft}

\setlength{\cftbeforetoctitleskip}{-16pt}
\setlength{\cftaftertoctitleskip}{20pt}

% jaotuste numbrite taga on punktid
\renewcommand{\cftchapaftersnum}{.}
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
\renewcommand{\cftsubsubsecaftersnum}{.}

%Näitame kõikide - ka väga madala taseme - jaotuste pealkirju
\setcounter{tocdepth}{99}
% numbreid ka neile
\setcounter{secnumdepth}{99}

% Lisade pealkirjad stiilis "Lisa 2 Teise lisa pealkiri"
\newcommand{\lisa}[1]{%
        \refstepcounter{chapter}%
        \addchap{Lisa \thechapter\enskip#1}%
        \setcounter{section}{0}%
        }

% pärast käsu \appendix kasutamist lisatakse peatüki asemel lisa.
\let\origappendix\appendix
\renewcommand{\appendix}{%
        \setcounter{chapter}{0}
        \let\chapter\lisa%
%        \let\section\lisa%
        \let\subsection\section%
        \let\subsubsection\section%
        }

\renewcommand{\cfttoctitlefont}{\fontsize{16pt}{19.2pt}\selectfont}

% Table of contents uppercase name
\addto{\captionsestonian}{\renewcommand*{\contentsname}{SISUKORD}}

% 1.5 linespacing
\usepackage{setspace}
\onehalfspacing

% Times New Roman everywhere
\usepackage{times}

% Remove indentation and add empty row between paragraphs
\usepackage[parfill]{parskip}

\usepackage{titlesec} % Documentation: http://www.tex-tipografia.com/archive/titlesec.pdf

%Title page styling
%% Tiitellehe genereerimine
% uued eestikeelsed muutujad
\def\klass#1{\gdef\@klass{#1}}
\def\juhendaja#1{\gdef\@juhendaja{#1}}
\def\asutus#1{\gdef\@asutus{#1}}
\def\paber#1{\gdef\@paber{#1}}
\def\koht#1{\gdef\@koht{#1}}

% vaikeväärtused
\paber{Uurimist\"o\"o}
\asutus{Tallinna 21. Kool}
\koht{Tallinn}

% Code to generate the title page
\renewcommand{\maketitle}{\newpage%
        \thispagestyle{empty}
        \vspace*{-1cm}
        \begin{center}
        \fontsize{14pt}{16.8pt}\selectfont\expandafter{\@asutus} \\
        \end{center}
        \vskip1in

        \vfill

        \begin{center}
                \fontsize{20pt}{24pt}\selectfont\bfseries\expandafter{\@title}
        \end{center}
        \fontsize{14pt}{16.8pt}\selectfont\centerline{\@paber}

        \vskip.5in
        \vfill
        
        \begin{flushright}
                \fontsize{14pt}{16.8pt}\selectfont\expandafter{\@author} \expandafter{\@klass} \\
                Juhendaja: \expandafter{\@juhendaja}
        \end{flushright}
        \vskip.5in

        \vfill
        \fontsize{14pt}{16.8pt}\selectfont\centerline{\@koht{} \the\year}%
        \clearpage
        }



% Chapter title styling
\titleformat{\chapter}[hang]
	{\fontsize{16pt}{19.2pt}\selectfont} % Format applied to the whole title - label and text
	{\thechapter. } % Label format
	{0pt} % Separation between title and label
	{\uppercase} % Code before title body
	[] 

\titlespacing{\chapter}
	{0pt} % Left
	{*0} % Vertical before
	{*2} % Vertical after

\def\ttl@mkchap@i#1#2#3#4#5#6#7{%
    \ttl@assign\@tempskipa#3\relax\beforetitleunit
    \vspace{\@tempskipa}%<<<<<< REMOVE THE * AFTER \vspace
    \global\@afterindenttrue
    \ifcase#5 \global\@afterindentfalse\fi
    \ttl@assign\@tempskipb#4\relax\aftertitleunit
    \ttl@topmode{\@tempskipb}{%
        \ttl@select{#6}{#1}{#2}{#7}}%
    \ttl@finmarks  % Outside the box!
    \@ifundefined{ttlp@#6}{}{\ttlp@write{#6}}}

% Section title styling
\titleformat{\section}[hang]
	{\fontsize{14pt}{16.8pt}\selectfont\bfseries}
	{\thesection. }
	{0pt}
	{}
	[] 

\titlespacing{\section}
        {0pt} % Left
        {*1} % Vertical before
        {*1} % Vertical after

% Subsection title styling
\titleformat{\subsection}[hang]
	{\fontsize{12pt}{14.4pt}\selectfont\bfseries}
	{\thesubsection. }
	{0pt}
	{}
	[] 