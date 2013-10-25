\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{21kuur}[2013/10/24 21.kooli uurimustöö vormistuse klass]

\LoadClass[12pt]{report}  % Use standard report class as base of the custom class

% Page layout
\usepackage{geometry}
\geometry{top=2.50cm, bottom=2.50cm, left=3cm, right=2cm}% Margins
\geometry{paperwidth=210mm, paperheight=297mm} % A4 papersize
\geometry{textwidth=205mm, headheight=0cm, headsep=0cm}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

\usepackage[estonian]{babel} % Set estonian as default language

\usepackage{tocbibind}

\usepackage{tocloft}
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
        \vspace*{0cm}
        \begin{center}
        \fontsize{14pt}{16.8pt}\selectfont\expandafter{\@asutus} \\
        \end{center}

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

% Section title styling
\titleformat{\section}[hang]
	{\fontsize{14pt}{16.8pt}\selectfont\bfseries}
	{\thesection. }
	{0pt}
	{}
	[] 

% Subsection title styling
\titleformat{\subsection}[hang]
	{\fontsize{12pt}{14.4pt}\selectfont\bfseries}
	{\thesubsection. }
	{0pt}
	{}
	[] 