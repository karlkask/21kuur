\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{21kuur}[2013/10/24 Tallinna 21. Kooli uurimustöö vormistuse klass]

\LoadClass[12pt]{report}  % Kasuta standardset report klassi alusena.

% Lehe asetus.
\usepackage{geometry}
\geometry{top=2.50cm, bottom=2.50cm, left=3cm, right=2cm}
\geometry{paperwidth=210mm, paperheight=297mm} 
\geometry{textwidth=160mm, textheight=247mm, headheight=0cm, headsep=0cm}

% UTF-8
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

\usepackage[estonian]{babel} % Eesti keel vaikimisi keeleks.

% Sisukord sisukorda.
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

% tocloft pakett.
\usepackage{tocloft}

% Sisukorra pealkirja asetus.
\setlength{\cftbeforetoctitleskip}{-16pt}
\setlength{\cftaftertoctitleskip}{20pt}

% Jaotuste numbrite taga punktid.
\renewcommand{\cftchapaftersnum}{.}
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
\renewcommand{\cftsubsubsecaftersnum}{.}

% Kujutame kõikide jaotuste pealkirju.
\setcounter{tocdepth}{99}
% Nummerdus
\setcounter{secnumdepth}{99}

% Sisukorra pealkirja font.
\renewcommand{\cfttoctitlefont}{\fontsize{16pt}{19.2pt}\selectfont}

% Sisukorra  pealkirjas suured tähed.
\addto{\captionsestonian}{\renewcommand*{\contentsname}{SISUKORD}}

% 1.5 reavahetus.
\usepackage{setspace}
\onehalfspacing

% Times New Roman kõikjal.
\usepackage{times}

% Eemaldab paragrahvidel taande ja teeb nende vahele tühja rea.
\usepackage[parfill]{parskip}

% titlesec pakett.
\usepackage{titlesec}

% Tiitellehe kujundus
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
	{\thechapter. } % Etiketi formaat
	{0pt} % Märgise ja pealkirja vahe.
	{\uppercase} 
	[] 

\titlespacing{\chapter}
	{0pt} % Vasakult
	{*0} % Vertikaal enne
	{*2} % Vertikaal peale

% Peatüki eelne vahe.
\def\ttl@mkchap@i#1#2#3#4#5#6#7{%
    \ttl@assign\@tempskipa#3\relax\beforetitleunit
    \vspace{\@tempskipa}% Eelmalda pealne \vspace.
    \global\@afterindenttrue
    \ifcase#5 \global\@afterindentfalse\fi
    \ttl@assign\@tempskipb#4\relax\aftertitleunit
    \ttl@topmode{\@tempskipb}{
        \ttl@select{#6}{#1}{#2}{#7}}
    \ttl@finmarks
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

%% Tabelid ja joonised.

% Tabelite ja jooniste numbrid ilma koolonita.
\usepackage{caption}
% Kõik pealkirjad vasakjoondusega.
\captionsetup{justification=justified,singlelinecheck=false}

% Joonis vahetult seda kirjeldava teksti juures ehk sama alapeatüki sees.
\usepackage[section]{placeins}

% Pealkirjad pealkirjade stiili.
\newcommand{\trkcaptionsetup}{\captionsetup{labelformat=simple, labelsep=period, labelfont=bf, font=bf}}
\trkcaptionsetup
% Pealkirjad allika moodi.
\newcommand{\captionstosource}{\captionsetup{labelformat=simple, labelsep=period, font=normalfont}}
% Allika lisamine joonisele.
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

