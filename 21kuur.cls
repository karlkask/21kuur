\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{21kuur}[2013/10/24 21.kooli uurimustöö vormistuse klass]

\LoadClass[12pt]{report}  % kasuta standardset report klassi alusena.

% Lehe asetus.
\usepackage{geometry}
\geometry{top=2.50cm, bottom=2.50cm, left=3cm, right=2cm}
\geometry{paperwidth=210mm, paperheight=297mm} 
\geometry{textwidth=160mm, textheight=247mm, headheight=0cm, headsep=0cm}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

\usepackage[estonian]{babel} % Eesti keel vaikimisi keeleks.

\usepackage{tocbibind}

% Peatükid algavad uuelt lehelt.
\usepackage{etoolbox}
%\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}

% Leheküljenumbrid algavad pärast esimest pealkirja, kuid pealkirjaga leht on tühi.
\renewcommand\thepage{}
\newtoggle{nummerdamelehti}
\togglefalse{nummerdamelehti}

% Käsk nummerdamise alustamiseks.
\newcommand{\nummerdame}{%
  \iftoggle{nummerdamelehti}{}{%
    \renewcommand\thepage{\arabic{page}}%
    \toggletrue{nummerdamelehti}%
    \thispagestyle{empty}%
  }
}

% Esimese peatüki juures nummerdamise alustamine.
\patchcmd{\addchap}{\secdef}{\nummerdame\secdef}{}{}
\pretocmd{\chapter}{\nummerdame{}}{}{}

\usepackage{tocloft}

\setlength{\cftbeforetoctitleskip}{-16pt}
\setlength{\cftaftertoctitleskip}{20pt}

% jaotuste numbrite taga on punktid
\renewcommand{\cftchapaftersnum}{.}
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
\renewcommand{\cftsubsubsecaftersnum}{.}

% Näitame kõikide - ka väga madala taseme - jaotuste pealkirju
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

% Sisukorra  nimes suured tähed.
\addto{\captionsestonian}{\renewcommand*{\contentsname}{SISUKORD}}

% 1.5 reavahetus.
\usepackage{setspace}
\onehalfspacing

% Times New Roman kõikjal.
\usepackage{times}

% Eemaldab paragrahvidel taande ja teeb nende vahele tühja rea.
\usepackage[parfill]{parskip}

\usepackage{titlesec} % Documentation: http://www.tex-tipografia.com/archive/titlesec.pdf

%Tiitellehe kujundus
%% Tiitellehe genereerimine
% Eestikeelsed muutujad.
\def\klass#1{\gdef\@klass{#1}}
\def\juhendaja#1{\gdef\@juhendaja{#1}}
\def\asutus#1{\gdef\@asutus{#1}}
\def\paber#1{\gdef\@paber{#1}}
\def\koht#1{\gdef\@koht{#1}}

% Vaikeväärtused
\paber{Uurimist\"o\"o}
\asutus{Tallinna 21. Kool}
\koht{Tallinn}

% Kood tiitellehe genereerimiseks.
\renewcommand{\maketitle}{\newpage
        \thispagestyle{empty}
        \vspace*{-1cm}
        \begin{center}
        {\fontsize{14pt}{16.8pt}\selectfont\expandafter{\@asutus}} \\
        \end{center}
        \vskip1in

        \vfill

        \begin{center}
                {\fontsize{20pt}{24pt}\selectfont\bfseries\expandafter{\@title}}
        \end{center}
        {\fontsize{14pt}{16.8pt}\selectfont\centerline{\@paber}}

        \vskip.5in
        \vfill
        
        \begin{flushright}
                {\fontsize{14pt}{16.8pt}\selectfont\expandafter{\@author} \expandafter{\@klass}} \\
                Juhendaja: \expandafter{\@juhendaja}
        \end{flushright}
        \vskip.5in

        \vfill
        {\fontsize{14pt}{16.8pt}\selectfont\centerline{\@koht{} \the\year}}%
        \clearpage
        }

% Peatüki pealkirja kujundus.
\titleformat{\chapter}[hang]
	{\fontsize{16pt}{19.2pt}\selectfont}
	{\thechapter. } % Label format
	{0pt} % Märgise ja pealkirja vahe.
	{\uppercase} 
	[] 

\titlespacing{\chapter}
	{0pt} % Vasakult
	{*0} % Vertikaal enne
	{*2} % Vertikaal peale

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

% Alapeatüki pealkirja kujundus.
\titleformat{\section}[hang]
	{\fontsize{14pt}{16.8pt}\selectfont\bfseries}
	{\thesection. }
	{0pt}
	{}
	[] 

% Alapeatüki pealkirja kujundus.
\titlespacing{\section}
    {0pt} % Vasakult
    {*1} % Vertikaal enne
    {*1} % Vertikaal peale

% Alapeatüki alapealkirja kujundus.
\titleformat{\subsection}[hang]
	{\fontsize{12pt}{14.4pt}\selectfont\bfseries}
	{\thesubsection. }
	{0pt}
	{}
	[] 

%% tabelid ja joonised

% Jooniste (ja tabelite?) keskjoondus.
% \makeatletter
% \def\@floatboxreset{%
% \reset@font
% \normalsize
% \@setminipage
% \centering}
% \makeatother

% Tabelite ja jooniste numbrid ilma koolonita.
\usepackage{caption}
% Kõik pealkirjad vasakjoondusega.
\captionsetup{justification=justified,singlelinecheck=false}

% Joonis vahetult seda kirjeldava teksti juures ehk sama alapeatüki sees
\usepackage[section]{placeins}

% captions to "Caption" style instead of "Source".
\newcommand{\trkcaptionsetup}{\captionsetup{labelformat=simple, labelsep=period, labelfont=bf, font=bf}}
\trkcaptionsetup % And this is also the default
% captions to  "Source" mode. Only used internally by \allikas
\newcommand{\captionstosource}{\captionsetup{labelformat=simple, labelsep=period, font=normalfont}}
% Add source to a figure or table.
\newcommand{\allikas}[1]{\vspace{-3mm}\captionstosource\caption*{Allikas: #1}\trkcaptionsetup}

% Tabelite, jooniste ja valemite läbiv numeratsioon.
\usepackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{equation}{chapter}
\counterwithout{footnote}{chapter}

% graphicx pakett jooniste sisestamiseks.
\usepackage{graphicx}

% xspace pakett, ning käsk nime LaTeX stiliseeritud kujutamiseks
\usepackage{xspace}
\newcommand{\latex}{\LaTeX\xspace}

% Joonealuste viidete tähestikuline nummerdamine.
\renewcommand{\thefootnote}{[\alph{footnote}]}

% Joonealuste viidete nummerdamise lähtestamine.
\usepackage{perpage}
\MakePerPage{footnote}

