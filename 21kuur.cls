\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{21kuur}[2013/10/24 21.kooli uurimustöö vormistuse klass]

\LoadClass[12pt]{report}  % Use standard report class as base of the custom class

% Page layout
\usepackage{geometry}
\geometry{paperwidth=210mm, paperheight=297mm} % A4 papersize

\usepackage{anysize}
\marginsize{3cm}{2cm}{2.5cm}{2.5cm}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

\usepackage[estonian]{babel} % Set estonian as default language

% 1.5 linespacing
\usepackage{setspace}
\onehalfspacing

% Times New Roman everywhere
\usepackage{times}

% Remove indentation and add empty row between paragraphs
\usepackage[parfill]{parskip}

\usepackage{titlesec} % Documentation: http://www.tex-tipografia.com/archive/titlesec.pdf

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