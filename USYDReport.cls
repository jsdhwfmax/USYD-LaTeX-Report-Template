% ==============================================================================
% Class Definition
% ==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{USYDReport}[2024/04/18 Version 1.3 The University of Sydney Course Report Template (pdfLaTeX)]

% --- Load Base Class
\LoadClass[a4paper, 12pt]{article}

% ==============================================================================
% Required Packages
% ==============================================================================
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\RequirePackage{xifthen, xparse, xstring, fancyhdr, etoolbox}
\RequirePackage{amstext, amsmath, amssymb, amsfonts}
\RequirePackage{mathrsfs, bm, mathtools}
\RequirePackage{graphicx}
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{array, longtable, makecell, tabu, booktabs}
\RequirePackage{enumitem}
\RequirePackage{indentfirst}
\usepackage{ulem}
\usepackage{setspace}

% ==============================================================================
% Page Geometry
% ==============================================================================
\RequirePackage[a4paper,
    marginparwidth=0pt, marginparsep=0pt,
    top=3cm, bottom=3cm, left=3cm, right=3cm,
    headheight=2.5cm, headsep=10pt, footskip=2cm]{geometry}

% ==============================================================================
% Font Settings (pdfLaTeX compatible Times New Roman)
% ==============================================================================
\RequirePackage{newtxtext, newtxmath} 
\newcommand{\TimesNewRoman}{\rmfamily}

% --- Custom Font Sizes ---
\newcommand{\chuhao}{\fontsize{42pt}{\baselineskip}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}{\baselineskip}\selectfont}
\newcommand{\yihao}{\fontsize{26pt}{\baselineskip}\selectfont}
\newcommand{\erhao}{\fontsize{22pt}{\baselineskip}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18pt}{\baselineskip}\selectfont}
\newcommand{\sanhao}{\fontsize{16pt}{\baselineskip}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}
\setstretch{1.3}

% ==============================================================================
% Header and Footer Settings
% ==============================================================================
\setlength{\baselineskip}{20pt}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}

\newcommand{\headstyle}{
    \fancyhead[OR]{\wuhao \thepage}
    \fancyhead[EC]{\wuhao \@author: \@title }
    \fancyhead[EL]{\wuhao \thepage}
}
\newcommand{\footstyle}{}

\pagestyle{fancy}
\fancyhf{} 
\headstyle
\footstyle

\fancypagestyle{main}{%
    \fancyhf{}
    \headstyle
    \footstyle
    \renewcommand{\headrulewidth}{0.4pt}
}

% ==============================================================================
% Section Title Formatting
% ==============================================================================
\RequirePackage{titlesec}
\titleformat{\section}{\centering\rmfamily\bfseries\sanhao}{Chapter \thesection}{0.5em}{}
\titlespacing*{\section}{0pt}{20pt}{20pt}
\newcommand{\sectionbreak}{\clearpage} 

\titleformat{\subsection}{\centering\rmfamily\bfseries\sihao}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\raggedright\rmfamily\bfseries\xiaosihao}{\thesubsubsection}{1em}{}

% ==============================================================================
% Abstract Environment
% ==============================================================================
\newenvironment{enabstract}[1]{
    \def \enkeyword {#1}
    \clearpage
    \thispagestyle{empty}
    \begin{center} \bfseries \xiaoerhao Abstract \end{center}
}{
    \vspace{1em}
    \paragraph{\xiaosihao \bfseries Key Words: } \enkeyword
    \clearpage
}

% ==============================================================================
% Table of Contents Formatting
% ==============================================================================
\RequirePackage{tocloft}
\tocloftpagestyle{empty}
\renewcommand{\cfttoctitlefont}{\TimesNewRoman \sanhao \bfseries }
\renewcommand{\contentsname}{\hspace*{\fill}Table of Contents\hspace*{\fill}}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftbeforesubsubsecskip}{0pt}
\renewcommand{\cftsecdotsep}{\cftdotsep} 
\setlength{\cftsecindent}{0em}
\setlength{\cftsubsecindent}{1em}
\setlength{\cftsubsubsecindent}{2em}
\renewcommand{\cftsecfont}{\sihao}
\renewcommand{\cftsubsecfont}{\xiaosihao}
\renewcommand{\cftsubsubsecfont}{\xiaosihao}

% ==============================================================================
% Figures, Tables, and Equations Formatting
% ==============================================================================
\makeatletter
\@addtoreset{figure}{section}
\@addtoreset{table}{section}
\renewcommand{\thefigure}{\ifnum \c@section>\z@ \thesection.\fi \@arabic\c@figure}
\renewcommand{\thetable}{\ifnum \c@section>\z@ \thesection.\fi \@arabic\c@table}

\RequirePackage{caption}
\captionsetup{labelsep=space,font={normalsize,bf,singlespacing}}
\captionsetup[figure]{position=bottom,skip={2pt},font={footnotesize}}
\captionsetup[table]{position=top,skip={2pt},font={footnotesize}}

\RequirePackage{tabularx}
\RequirePackage{makecell}
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedright \arraybackslash}X}
\RequirePackage{booktabs}

\numberwithin{equation}{section}

% ==============================================================================
% List Formatting
% ==============================================================================
\RequirePackage{enumitem}
\setlist{noitemsep}

% ==============================================================================
% Title Page and Statement of Originality
% ==============================================================================
\def \defcoursecode {}
\def \defstunum {}
\def \deftutorial {}
\def \defgroupnum {}
\def \deftutor {}

\newcommand{\coursecode}[1]{\def \defcoursecode {#1}}
\newcommand{\stunum}[1]{\def \defstunum {#1}}
\newcommand{\tutorial}[1]{\def \deftutorial {#1}}
\newcommand{\groupnum}[1]{\def \defgroupnum {#1}}
\newcommand{\tutor}[1]{\def \deftutor {#1}}

\RequirePackage{datetime}
\newdateformat{USdate}{\twodigit{\month}/\twodigit{\day}/\the\year}

\renewcommand{\maketitle}[1][12em]{
    \begin{titlepage}
     \centering
        \begin{center}
            \vspace*{60pt}
            {\sanhao \bfseries The University of Sydney}\\
            \vspace{80pt}
            {\erhao \TimesNewRoman \bfseries \@title}\\
            \vspace{8em} 
            {\sanhao \TimesNewRoman
                \renewcommand\arraystretch{2.2} 
                \hspace*{1em}
                \begin{tabular}{lc}
                    \makebox[6em][s]{Student Name:} & \makebox[#1][l]{\quad\@author} \\
                    \makebox[6em][s]{Student ID:}   & \makebox[#1][l]{\quad\defstunum} \\
                    \makebox[6em][s]{Course Code:}  & \makebox[#1][l]{\quad\defcoursecode} \\
                    \makebox[6em][s]{Tutorial:}     & \makebox[#1][l]{\quad\deftutorial} \\
                    \makebox[6em][s]{Group:}        & \makebox[#1][l]{\quad\defgroupnum} \\
                    \makebox[6em][s]{Tutor:}        & \makebox[#1][l]{\quad\deftutor} \\
            \end{tabular}}\\
            \vfill 
            {\sanhao \USdate\today}\\
            \vspace*{40pt}
        \end{center}
    \end{titlepage}
}

\newcommand{\makestatement}[1][0]{
    \clearpage
    \thispagestyle{empty}
    \vspace*{1em}
    \begin{center}
        \begin{spacing}{1.25}
            {\TimesNewRoman \sanhao \bfseries Statement of Originality}
        \end{spacing}
    \end{center}

    \begin{spacing}{1.5}
    \TimesNewRoman \sihao 
    I declare that my report/assignment \textbf{\@title} is the result of my independent research work during my postgraduate study period at \textbf{The University of Sydney}. The paper does not contain the research results that have been published or written by others, except for the parts already indicated, and the relevant personnel who have provided assistance in the completion of the thesis have been mentioned and thanked in this thesis.

    This report does not violate academic ethics and academic norms, has no infringement, and I am willing to undertake the legal responsibility and legal consequences arising therefrom.\\
    
    \rightline{
    \begin{tabular}{r}
        \\
        Author Signature:\uline{\makebox[6em]{}}
        \\
        Date: \quad\quad\quad\quad\quad\quad\quad\quad
    \end{tabular}
    }
    \end{spacing}
    \clearpage
}

\newcommand{\makeToc}{%
    \pagestyle{empty}
    \tableofcontents
    \clearpage
    \pagestyle{main}
    \pagenumbering{arabic}
    \setcounter{page}{1}
}

\endinput