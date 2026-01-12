\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tfgtfmetsii}[2017/01/15 TFG/TFM para la ETSII de la UPV]
\LoadClass[10pt]{book}

% ------------------------------------------------------

\RequirePackage{ifthen}

% ------------------------------------------------------

\newboolean{TFG}\setboolean{TFG}{false}
\newboolean{TFM}\setboolean{TFM}{false}


\newboolean{DistanciesEquacions}\setboolean{DistanciesEquacions}{true}

\newboolean{RM}\setboolean{RM}{false}
\newboolean{SF}\setboolean{SF}{false}

\newboolean{valencia}\setboolean{valencia}{false}
\newboolean{castellano}\setboolean{castellano}{false}
\newboolean{english}\setboolean{english}{false}


% ------------------------------------------------------


\DeclareOption{tfg}{\setboolean{TFG}{true}}
\DeclareOption{tfm}{\setboolean{TFM}{true}}


\DeclareOption{rm}{\setboolean{RM}{true}}
\DeclareOption{sf}{\setboolean{SF}{true}}

\DeclareOption{nomathskip}{\setboolean{DistanciesEquacions}{false}}

\DeclareOption{castellano}{
	\setboolean{castellano}{true}
	\setboolean{valencia}{false}
	\setboolean{english}{false}
}
\DeclareOption{valencia}{
	\setboolean{castellano}{false}
	\setboolean{valencia}{true}
	\setboolean{english}{false}
	}
\DeclareOption{english}{
	\setboolean{castellano}{false}
	\setboolean{valencia}{false}
	\setboolean{english}{true}
	}

% ------------------------------------------------------

\DeclareOption*{\ClassWarning{tfgtfmetsii}{No se puede procesar la opción: ?\CurrentOption?}}

% ------------------------------------------------------

\ExecuteOptions{tfg,rm,castellano}
\ProcessOptions\relax


% ------------------------------------------------------

\RequirePackage{graphicx}
\RequirePackage{calc}
%\RequirePackage{hyperref}


% ---------------------------------------------------------------------
% Tipus de lletra


\ifTFG
	\renewcommand{\normalsize}{\fontsize{11pt}{13pt}\selectfont}
	\newcommand{\TF}{TFG\xspace}
	\newcommand{\Grado}{Grado\xspace}
	\newcommand{\maxpag}{80\xspace}
	\newcommand{\enlacedescargas}{\href{http://www.etsii.upv.es/docencia/tfg/descargas-es.php}{http://www.etsii.upv.es/docencia/tfg/descargas-es.php}}
	\newcommand{\urldescargas}{http://www.etsii.upv.es/docencia/tfg/descargas-es.php}
\fi

\ifTFM
	\renewcommand{\normalsize}{\fontsize{11pt}{13pt}\selectfont}
	\renewcommand{\TF}{TFM\xspace}
	\renewcommand{\Grado}{Máster\xspace}
	\renewcommand{\maxpag}{120\xspace}
	\renewcommand{\enlacedescargas}{\href{http://www.etsii.upv.es/docencia/tfm/descargas-es.php}{http://www.etsii.upv.es/docencia/tfm/descargas-es.php}}
	\renewcommand{\urldescargas}{http://www.etsii.upv.es/docencia/tfm/descargas-es.php}
\fi


% ---------------------------------------------------------------------

\ifSF
	\renewcommand{\familydefault}{\sfdefault}
\else
	\renewcommand{\familydefault}{\rmdefault}
\fi
	

% ---------------------------------------------------------------------
% Format de p�gina

\RequirePackage{geometry}


	


\newlength{\myheadsep}
\setlength{\myheadsep}{3cm-1.25cm-15pt}

\geometry{ 
	a4paper, twoside,         	% A4 a doble cara
	hmargin = {2.5cm, 2.5cm}, 	% {Izquierdo, Derecho}
	vmargin = {3cm, 3cm}, % {Superior, Inferior} 
	%includehead, includefoot, 	% Incluyendo encabezado y pie
	headsep = \myheadsep,  % Separaci?n entre el encabezado y el texto
	footskip = 1.75cm,        	% Separaci?n entre el texto y el pie
	headheight = 15pt
}


% ---------------------------------------------------------------------
% Cap�aleres i peus de p�gina

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\renewcommand{\chaptermark}[1]{\markboth{\@chapapp\ \thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}{}}

\fancyhead{} % Esborra la configuraci? de la cap?alera
\fancyfoot{} % Esborra la configuraci? del peu


\ifTFG

	\fancyhead[C]{\TFGtitulo}

\fi

\ifTFM

	\fancyhead[C]{\TFMtitulo}

\fi


\fancyfoot[LE,RO]{\thepage}

\renewcommand{\headrulewidth}{0.25pt}
\renewcommand{\footrulewidth}{0pt}	




% ---------------------------------------------------------------------
% Format de par�graf y maquetaci�



\setlength{\parskip}{6pt}
\setlength{\parindent}{0pt}
\linespread{1.15}

\setlength{\widowpenalty}{10000pt}
\setlength{\clubpenalty}{10000pt}

\raggedbottom


% ---------------------------------------------------------------------
% Mojora los t?tulos de las figuras y tablas

\RequirePackage{caption}
\renewcommand{\captionlabelfont}{\bfseries\small}
\renewcommand{\captionfont}{\small}

% ------------------------------------------------------------------------
% Formato de las secciones

\RequirePackage[
	raggedright,
	compact,
	nobottomtitles*, % Evita que queden t?tols solts al final de la p?gina
	clearempty, % Modifica \cleardoublepage per a que els fulls parells buides siguen blanques
	]{titlesec}

% ------------------------------------------------------------------------

\titleformat{\part}
	[display]
	{\thispagestyle{empty}\filcenter
	\tolerance=10000\hyphenpenalty=10000}
	{\fontsize{18}{20}\bfseries\partname\enspace\thepart}
	{1pc}
	{\fontsize{24}{30}\bfseries}

% ------------------------------------------------------------------------

\titleformat{\chapter}
	[display]
	{\normalfont\Large\filcenter}
	{\raggedleft\fontsize{18}{20}\bfseries\chaptertitlename\enspace\thechapter}
	{2ex}
	{\raggedleft\fontsize{24}{30}\bfseries}%\usefont{T1}{cmss}{n}{n}\selectfont
	[\vspace{2cm}]


% ------------------------------------------------------------------------


	% ------------------------------------------------------------------------
	
	\titleformat{\section}
		[hang]
		{\vspace{2ex}\raggedright\tolerance=10000\hyphenpenalty=10000}
		{\Large\bfseries\thesection}
		{1em}
		{\Large\bfseries}
	
	% ------------------------------------------------------------------------
	
	\titleformat{\subsection}
		[hang]
		{\vspace{1.5ex}\raggedright\tolerance=10000\hyphenpenalty=10000}
		{\large\bfseries\itshape\thesubsection}
		{1em}
		{\large\bfseries\itshape}
		[\vspace{-1ex}]
	


% ------------------------------------------------------------------------

\titleformat{\subsubsection}
	[hang]
	{\vspace{2ex}\raggedright\tolerance=10000\hyphenpenalty=10000}
	{\normalsize\itshape\thesubsubsection}
	{1em}
	{\normalsize\itshape}
	[\vspace{-0.75ex}]

% -------------------------------------------------------
% Para controlar la numeraci?n y formato de la tabla de contenidos

\setcounter{tocdepth}{1}

\RequirePackage{titletoc}

\titlecontents{part} 
	[0em] 
	{\addvspace{4ex}\Large} 
	{\partname\enspace\thecontentslabel\enspace} 
	{} 
	{\hfill\contentspage} 
	[\vspace{-1ex}]
	
\titlecontents{chapter} 
	[0em] 
	{\addvspace{3ex}\mdseries\large} 
	{\thecontentslabel\enspace} 
	{} 
	{\hfill\contentspage}
	[\vspace{-1ex}]
	
\titlecontents{section} 
	[1.5em] 
	{\addvspace{.5ex}\small} 
	{\thecontentslabel\enspace} 
	{} 
	{\titlerule*[0.5pc]{.}\contentspage} 
	[\vspace{-1.5ex}]	
	
\titlecontents{subsection} 
	[3.5em] 
	{\vspace{.25ex}\footnotesize}
	{\thecontentslabel\enspace} 
	{} 
	{\titlerule*[0.5pc]{.}\contentspage} 
	[\vspace{-1.5ex}]




% ------------------------------------------------------------------------


\RequirePackage{enumitem}
\setlist[1]{partopsep=-1ex,parsep=\parskip,itemsep=0\parskip}
\setlist[2]{partopsep=-1ex,parsep=\parskip,itemsep=0\parskip}


% ------------------------------------------------------------------------

\RequirePackage{mathtools}

\ifDistanciesEquacions
\AtBeginDocument
	{
	% ---------------------------------------------------
	% Dist?ncies de les equacions al text
	
	% Per a les equacions normals
	\abovedisplayshortskip = -1.0ex plus 0ex minus 0.25ex
	\belowdisplayshortskip = 2.0ex plus 1ex minus 0.0ex
	
	% Per a les equacions en varies l?nies
	\abovedisplayskip = -1.0ex plus 0ex minus 0.25ex
	\belowdisplayskip = 2.0ex plus 1ex minus 0.0ex
	}
\fi

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
