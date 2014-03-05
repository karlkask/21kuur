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
% \usepackage{tocbibind}

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

% Eemaldab alapealkirjadel taande ja teeb nende vahele tühja rea.
\usepackage[parfill]{parskip}

% titlesec pakett.
\usepackage{titlesec}

% Eestikeelsed muutujad.
\def\klass#1{\gdef\@klass{#1}}
\def\juhendaja#1{\gdef\@juhendaja{#1}}
\def\asutus#1{\gdef\@asutus{#1}}
\def\paber#1{\gdef\@paber{#1}}
\def\koht#1{\gdef\@koht{#1}}
\def\referaat#1{\gdef\@referaat{#1}}
\def\kuujaaasta#1{\gdef\@kuujaaasta{#1}}
\def\uldlkarv#1{\gdef\@uldlkarv{#1}}
\def\tekstlkarv#1{\gdef\@tekstlkarv{#1}}
\def\tabtkarv#1{\gdef\@tablkarv{#1}}
\def\lisatkarv#1{\gdef\@lisalkarv{#1}}
\def\joontkarv#1{\gdef\@joonlkarv{#1}}
\def\kasktkarv#1{\gdef\@kasklkarv{#1}}
\def\votme#1{\gdef\@votme{#1}}
\def\refjar#1{\gdef\@refjar{#1}}

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
        \vskip0in

        \vfill

        \begin{center}
                \doublespacing{\fontsize{20pt}{24pt}\selectfont\bfseries\uppercase\expandafter{\@title}}
        \end{center}
        {\fontsize{14pt}{16.8pt}\selectfont\centerline{\@paber}}

        \vskip-1.9in
        \vfill
        
        \begin{flushright}
                {\fontsize{14pt}{16.8pt}\selectfont Koostaja: \expandafter{\@author} \expandafter{\@klass}} \\
                {\fontsize{14pt}{16.8pt}\selectfont Juhendaja: \expandafter{\@juhendaja}}
        \end{flushright}
        \vskip.5in

        \vfill
        {\fontsize{14pt}{16.8pt}\selectfont\centerline{\@koht{} \the\year}}%
        \clearpage
        }

% graphicx pakett.
\usepackage{graphicx}

% tabularx pakett.
\usepackage{tabularx}

% Kood annotatsiooni genereerimiseks.
\usepackage{multirow}
\newcommand{\makeannotation}{
        \chapter*{ANNOTATSIOON}
        \cftaddtitleline{toc}{chapter}{ANNOTATSIOON}{2}
        \thispagestyle{empty}
%        {\fontsize{16pt}{19.2pt}\selectfont ANNOTATSIOON}\\\\
        {\fontsize{12pt}{14.4pt}\selectfont {\@asutus}} \\
          \begin{tabularx}{\textwidth}{ | l | X | }
            \hline                       
            \multicolumn{2}{|l|}{Töö pealkiri} \\
	 \multicolumn{2}{|l|}{
            \begin{tabular}{p{15cm}}
              {\@title}\\
            \end{tabular} 
            }\\
         %   \multicolumn{2}{|l|}{{\@title}} \\
            \hline
            \begin{tabular}{l}
              Töö kaitsmise kuu ja aasta \\
              {\@kuujaaasta} \\
               \\
            \end{tabular}
            & 
            \begin{tabular}{r r}
              lehekülgede arv töös: {\@uldlkarv} lk, & millest teksti: {\@tekstlkarv} lk \\
              tabeleid: {\@tablkarv} tk & lisasid: {\@lisalkarv} tk \\
              jooniseid: {\@joonlkarv} tk & kasutatud allikaid: {\@kasklkarv} tk \\
            \end{tabular} \\
            \hline
            \multicolumn{2}{|l|}{Referaat} \\
            \multicolumn{2}{|l|}{
            \begin{tabular}{p{15cm}}
              {\@referaat}\\[\@refjar cm]
            \end{tabular} 
            }\\
            \hline
	 \multicolumn{2}{|l|}{
            \begin{tabular}{p{15cm}}
              Võtmesõnad: {\@votme}\\
            \end{tabular} 
            }\\
            %\multicolumn{2}{|l|}{Võtmesõnad: {\@votme}} \\
            \multicolumn{2}{|l|}{} \\
            \hline
            \multicolumn{1}{|l}{Töö autor:} & {allkiri:} \\
            \multicolumn{1}{|l}{{\@author}} & \\
            \hline
            \multicolumn{1}{|l}{Kaitsmisele lubatud:} &  \\
            \multicolumn{1}{|l}{Juhendaja: \expandafter{\@juhendaja}} & allkiri: \\
            \hline  
          \end{tabularx}
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
	{20pt} % Vertikaal peale

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

\setlength{\abovecaptionskip}{5pt}

% Kõik pealkirjad vasakjoondusega.
\captionsetup{justification=justified,singlelinecheck=false}

% Joonis vahetult seda kirjeldava teksti juures ehk sama alapeatüki sees.
\usepackage[section]{placeins}

% Tabelitele allikad
\newcommand*{\tabsource}[1]{% 
    \hspace{\linewidth}
    \newline Allikas: #1%
}

% Joonistele allikad
\newcommand*{\joonsource}[1]{% 
    Allikas: #1%
}

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

% xspace pakett, ning käsk nime LaTeX stiliseeritud kujutamiseks
\usepackage{xspace}
\newcommand{\latex}{\LaTeX\xspace}

% Joonealuste viidete tähestikuline nummerdamine.
\renewcommand{\thefootnote}{[\alph{footnote}]}

% Joonealuste viidete nummerdamise lähtestamine.
\usepackage{perpage}
\MakePerPage{footnote}

% Verbatim font väiksemaks.
\def\verbatim{\footnotesize\@verbatim \onehalfspacing\@vobeyspaces \@xverbatim}
