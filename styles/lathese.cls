% lathese.cls
%
% Author: Claudia Esteves
% Date:    25.10.2006
%
% \documentclass{lathese}
% requires quotchap.sty, amstrans.bst

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lathese}[2006/10/25 Claudia's Thesis Class]

\LoadClass[12pt]{report}

\newif\if@final

\DeclareOption{draft}{%
	\PassOptionsToPackage{all}{draftcopy}%
	\PassOptionsToClass{draft}{report}%
\AtEndOfClass{%
	\RequirePackage{draftcopy}%
	\draftcopyName{DRAFT: \today}{60}
}
\global\@finalfalse}

\DeclareOption{final}{
\global\@finaltrue}

\ProcessOptions

\def\@TheTitle{My Thesis}
\def\@TheAuthor{My Name}
\def\@TheDraftDate{\today}
\def\@TheDate{Date}
\def\@TheMonth{Month}
\def\@TheYear{YYYY}
\def\@TheAdvisor{Advisor's name}
\def\@TheGroup{Research group}
\def\@EDSYS{\'Ecole Doctorale Syst\`emes}
\def\@DEMAT{Divisi\'on de Ciencias Naturales y Exactas}
\def\@INPT{Institut National Polytechnique de Toulouse}
\def\@LAAS{Laboratoire d'Analyse et d'Architecture des Syst\`emes}
\def\@CIMAT{Centro de Investigaci\'on en Matem\'aticas}

\long\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}
\long\def\@resume{\@latex@error{No \noexpand\resume given}\@ehc}


%% MARGINS


%\usepackage[left=1.5in, right=1in, top=1in, bottom=1in, includefoot, headheight=13.6pt]{geometry}
\usepackage[letterpaper]{geometry}
\geometry{tmargin=35mm,bmargin=35mm,lmargin=40mm,rmargin=30mm}
%\RequirePackage{geometry}
%\geometry{tmargin=35mm}
%\geometry{tmargin=35mm,bmargin=26mm,lmargin=23mm,rmargin=23mm}

\@twosidetrue  \@mparswitchtrue
\def\pages{\pageref{@firstpg}--\pageref{@lastpg}}%
\def\@getpagenum#1#2{#2}%
\def\mypage{\thepage}%
%\def\pdfinfo#1#2{}%
%\def\pdfbookmark#1#2{}%


\def\TheTitle#1{\def\@TheTitle{#1}}
\def\TheAuthor#1{\def\@TheAuthor{#1}}
\def\TheDate#1{\def\@TheDate{#1}}
\def\TheMonth#1{\def\@TheMonth{#1}}
\def\TheYear#1{\def\@TheYear{#1}}
\def\TheAdvisor#1{\def\@TheAdvisor{#1}}
\def\TheGroup#1{\def\@TheGroup{#1}}

% my "ojo" environment
\newenvironment{ojo}[1]%
{
\vskip 10mm
\begin{center} \fcolorbox{blue}{white}{ %
\begin{minipage}{15cm} %
\begin{description}\item[{\small\textcolor{blue}\dbend}]{
\normalsize \sf #1} \end{description} \end{minipage}}%
}
{
\end{center}
}

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}

\newenvironment{dedication}
{\begin{alwayssingle}
  \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{verse}\begin{center}}
{\end{center}\end{verse}\end{alwayssingle}}


%% CHAPTER'S TITLE STYLE
%\RequirePackage{./styles/quotchap}\
%%
%% This is file `quotchap.sty',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% quotchap.dtx 
%% 
%% This file is part of the QUOTCHAP package, a package a package for
%% creating decorative chapter headings with quotations, a postscript
%% output device is needed. Copyright (C) 1998 Karsten Tinnefeld.
%% 
%% This file is NOT part of the LaTeX2e system, but intended for use with
%% it.
%% 
%% This file is free software; you can redistribute it and/or modify it
%% under the terms of the GNU Library General Public License as published
%% by the Free Software Foundation; either version 2 of the License, or
%% (at your option) any later version.
%% 
%% This document is distributed in the hope that it will be useful, but
%% WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%% General Public License for more details.
%% 
%% You should have received a copy of the GNU General Public License
%% somehow; if not, write to the Free Software Foundation, Inc., 675 Mass
%% Ave, Cambridge, MA 02139, USA.
%% 
%% Error Reports in case of UNCHANGED versions to
%% 
%%              Karsten Tinnefeld
%%              Leostrasse 11
%%              D-44225 Dortmund
%%              Germany
%%       Email: tinnefeld@irb.cs.uni-dortmund.de
%% 
%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesPackage{quotchap}
  [1998/02/09 v0.9f Decorative Chapter Headings with Quotes]
\newif\if@usecolor\@usecolortrue
\DeclareOption{grey}{\@usecolortrue}
\DeclareOption{nogrey}{\@usecolorfalse}
\newcommand*{\@newfontcmd}{\@ifundefined{@defaultcnfont}{\newcommand*}{%
    \PackageWarning{quotchap}{%
      You have tried to specify more than one font to be\MessageBreak
      used for the chapter numbers. I ignore the font\MessageBreak
      `\CurrentOption'}
    \providecommand*}}
\DeclareOption{charter}{\@newfontcmd{\@defaultcnfont}{bch}}
\DeclareOption{palatino}{\@newfontcmd{\@defaultcnfont}{ppl}}
\DeclareOption{avantgarde}{\@newfontcmd{\@defaultcnfont}{pag}}
\DeclareOption{bookman}{\@newfontcmd{\@defaultcnfont}{pbk}}
\DeclareOption{courier}{\@newfontcmd{\@defaultcnfont}{pcr}}
\DeclareOption{helvetica}{\@newfontcmd{\@defaultcnfont}{phv}}
\DeclareOption{newcentury}{\@newfontcmd{\@defaultcnfont}{pnc}}
\DeclareOption{times}{\@newfontcmd{\@defaultcnfont}{ptm}}
\DeclareOption{utopia}{\@newfontcmd{\@defaultcnfont}{put}}
\ProcessOptions\relax
\providecommand*{\@defaultcnfont}{pbk}
\if@usecolor
  \IfFileExists{color.sty}{%
    \RequirePackage{color}
    \definecolor{chaptergrey}{rgb}{0.6,0.6,0.6}}{%
    \PackageError{quotchap}{%
      The color package is apparently unavailable.\MessageBreak
      Turn off the `grey' option and come back again}{%
      Since you did not say `nogrey', quotchap defined chapter
      numbers to appear\MessageBreak grey. You do not need a color
      printer, since most printing devices can cope\MessageBreak with
      grey scales, but you need the color package coming with the
      graphics\MessageBreak bundle available from CTAN.}}
\else
  \providecommand*{\color}[1]{}
\fi
\AtEndOfPackage{%
  \newcommand*{\chapnumfont}{%
    \usefont{T1}{\@defaultcnfont}{b}{n}\fontsize{100}{130}\selectfont%
    \color{chaptergrey}}
  \let\size@chapter\huge
  \providecommand*{\chapterheadstartvskip}{\vspace*{2.3\baselineskip}}
  \providecommand*{\chapterheadendvskip}{\vspace{1.7\baselineskip}}
  \providecommand*{\sectfont}{\relax}
  \@ifundefined{@mainmattertrue}{\newif\if@mainmatter\@mainmattertrue}{}}
\newenvironment{savequote}[1][10cm]{%
  \begin{lrbox}{\@quotebox}
    \begin{minipage}[t]{#1}\footnotesize\slshape
      \ignorespaces}{%
      \unskip\end{minipage}\end{lrbox}
  \global\setbox\@quotebox\copy\@quotebox
  \global\let\@printcites\@iprintcites
  \ignorespacesafterend}
\newcommand{\qauthor}[1]{%
  \par\smallskip
  {\raggedleft\upshape #1\qquad\hbox{}\par}\bigskip}
\newsavebox{\@quotebox}
\let\@printcites\relax
\renewcommand\chapter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{plain}%
  \global\@topnum\z@
  \@printcites
  \@afterindentfalse
  \secdef\@chapter\@schapter}
\renewcommand{\@makechapterhead}[1]{\chapterheadstartvskip%
  {\size@chapter{\sf\sectfont\raggedleft
      {\chapnumfont
        \ifnum \c@secnumdepth >\m@ne%
        \if@mainmatter\thechapter%
        \fi\fi
        \par\nobreak}%
      {\raggedleft\advance\leftmargin10em\interlinepenalty\@M #1\par}}
    \nobreak\chapterheadendvskip}}
\renewcommand{\@makeschapterhead}[1]{%
  {\let\c@secnumdepth\m@ne\@makechapterhead{#1}}}
\newcommand*{\@iprintcites}{%
  \vbox to\z@{\copy\@quotebox\vss}
  \global\let\@printcites\relax}
%% End of file `quotchap.sty'.


%% LINE SPACING
\RequirePackage[onehalfspacing]{setspace}
\renewcommand{\baselinestretch}{1.2}

\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \else \newpage \fi \thispagestyle{empty}\c@page\z@}
\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}

\renewcommand{\chaptermark}[1]{\markboth{\sf \ #1}{}}

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\sf}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                    {-3.25ex\@plus -1ex \@minus -.2ex}%
                                    {1.5ex \@plus .2ex}%
                                     {\normalfont\large\sf}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\sf}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\sf}}

\newif\if@mainmatter \@mainmattertrue

% Frontmatter
\newcommand\frontmatter{ 
\cleardoublepage
\@mainmatterfalse
\pagenumbering{roman}
}

%Mainmatter
\newcommand\mainmatter{
\cleardoublepage 
\@mainmattertrue
\pagenumbering{arabic}
\setcounter{page}{1}
} 

% Headers and Footers
\mark{{}{}}

\def\ps@myheadings{\let\@mkboth\@gobbletwo
\def\@oddhead{\hbox{}\hfill \small\sf \leftmark\hskip 19pt{\Large$\cdot$}\hskip 17pt\mypage}
%\def\@oddfoot{\hbox{}\hfill\small\sf Draft Version: \@TheDraftDate}
\def\@evenhead{\small\sf\mypage \hskip 17pt{\Large$\cdot$}\hskip 19pt\@TheTitle\hfill \hbox{}}
%\def\@evenfoot{\hbox{}\hfill\small\sf Draft Version: \@TheDraftDate}
\def\@runningfoot{}
\def\runningfoot{\def\@runningfoot{Toto}}

\def\sectionmark##1{}\def\subsectionmark##1{}}

\def\ps@titlepage{\let\@mkboth\@gobbletwo
\def\@oddhead{}\def\@oddfoot{\hbox{}\hfill \tiny\@firstfoot}\def\@evenhead{}\def\@evenfoot{\tiny\@firstfoot\hfill\hbox{}}}

\def\today{\ifcase\month\or
 January\or February\or March\or April\or May\or June\or
 July\or August\or September\or October\or November\or December\fi
 \space\number\day, \number\year}
\def\@marrayclassiv{\@addtopreamble{$\displaystyle \@nextchar$}}
\def\@marrayclassz{\ifcase \@lastchclass \@acolampacol \or \@ampacol \or
 \or \or \@addamp \or
 \@acolampacol \or \@firstampfalse \@acol \fi
\edef\@preamble{\@preamble
 \ifcase \@chnum 
 \hfil$\relax\displaystyle\@sharp$\hfil \or $\relax\displaystyle\@sharp$\hfil 
 \or \hfil$\relax\displaystyle\@sharp$\fi}}
\def\marray{\arraycolsep 2.5pt\let\@acol\@arrayacol \let\@classz\@marrayclassz
 \let\@classiv\@marrayclassiv \let\\\@arraycr\def\@halignto{}\@tabarray}
\def\endmarray{\crcr\egroup\egroup}

\ps@myheadings \pagenumbering{arabic} \onecolumn 

\newcommand{ \maketitlepage } {{
	\thispagestyle{empty}
	\sf  \vspace*{0in}
	\begin{center}\sc \LARGE\@CIMAT\end{center}\vspace{.2in}
	\begin{center}\sc \LARGE Tesis\end{center}\vspace{.3in}
	\begin{center}para obtener el grado de\\
	 \vspace{.2in} {\large Maestr\'ia en Ciencias con Especialidad en Computaci\'on y Matem\'aticas Industriales}\\
	 \if@final{\vspace{.6in}presentada el \@TheDate}
	 \else{\vspace{.2in}\LARGE Draft: \@TheDraftDate}\fi
	 \end{center} \vspace{0.3in}
	\begin{center}\LARGE\@TheTitle\end{center}\vspace{.5in}
	\begin{center}\@TheAuthor\end{center}\vspace{.5in}
	\begin{center} {\large Jurado}\end{center}\vspace{0.1in}
	\begin{center}\begin{tabular}{lcl}
	 Dr. H\'ector \sc Becerra & & Sinodal \\
	 Dr. Claudia \sc Esteves & & Sinodal \\
	 Dr. Olivier \sc Stasse & & Co-Asesor \\
	 Dr. Jean-Bernard \sc Hayet & & Co-Asesor
	\end{tabular}\end{center}
	\pagebreak
	\thispagestyle{empty}
	}}
	
	
\newcommand{ \makeabstract}{{
	\newpage
	\chapter*{Abstract}
	\thispagestyle{empty}
	\@abstract
	\clearpage
}}

\newcommand{ \makeresume}{{
	\newpage
	%\addcontentsline{toc}{section}{R\'esum\'e}
	\chapter*{R\'esum\'e}
	\thispagestyle{empty}
	\@resume
	\clearpage
}}

\long\def\abstract#1{\gdef\@abstract{#1}}
\long\def\resume#1{\gdef\@resume{#1}}

%-----------------------BIBLIOGRAPHY STUFF-------------------------
% this is adapted (November 1993) by Andrew Appel and Rebecca Davies from
% 
%%%     filename        = "chicago.sty",
%%%     version         = "4",  % MODIFIED!
%%%     date            = "31 August 1992",
%%%     time            = "09:42:44 199",
%%%     author          = "Glenn Paulley",
%%%     address         = "Data Structuring Group
%%%                        Department of Computer Science
%%%                        University of Waterloo
%%%                        Waterloo, Ontario, Canada
%%%                        N2L 3G1",
%%%     telephone       = "(519) 885-1211",
%%%     FAX             = "(519) 885-1208",
%%%     email           = "gnpaulle@bluebox.uwaterloo.ca",

%%% ====================================================================
%
% this file: Modification of chicago.sty for new ACM bibliography
% style, which is similar (but not identical) to the ``Chicago'' style.
%
% chicago.sty: Style file for use with bibtex style chicago.bst, for
% bibliographies formatted according to the 13th Edition of the Chicago
% Manual of Style.
%
% 'newapa.bst' was made from 'plain.bst', 'named.bst', and 'apalike.bst',
% with lots of tweaking to make it look like APA style, along with tips
% from Young Ryu and Brian Reiser's modifications of 'apalike.bst'.
% newapa.sty formed the basis of this style, chicago.sty. Author-date
% references in newapa.bst formed the basis for chicago.bst. Chicagoa.bst
% supports annotations.
%
% Version 4 (August, 1992):
% - fixed chicago.bst and chicagoa.bst to handle long author lists in
%   sorting
% - fixed chicago.bst and chicagoa.bst so that missing page numbers in
%   ``article'' entries are handled correctly
% - modified chicago.sty to format entries with 2nd and subsequent lines
%   indented.
%
%   Citation format: (author-last-name year)
%             (author-last-name and author-last-name year)
%             (author-last-name et al. year)
%             (author-last-name)
%             author-last-name
%             author-last-name (year)
%             (author-last-name and author-last-name)
%             (author-last-name et al.)
%             (year) or (year,year)
%             year or year,year
%
%   Reference list ordering: alphabetical by author or whatever passes
%    for author in the absence of one.
%
% This BibTeX style has support for abbreviated author lists and for
%    year-only citations.  This is done by having the citations
%    actually look like
%
%    \citeauthoryear{full-author-info}{abbrev-author-info}{year}
%
% The LaTeX style has to have the following (or similar)
%
%     \let\@internalcite\cite
%     \def\fullcite{\def\citeauthoryear##1##2##3{##1, ##3}\@internalcite}
%     \def\fullciteA{\def\citeauthoryear##1##2##3{##1}\@internalcite}
%     \def\shortcite{\def\citeauthoryear##1##2##3{##2, ##3}\@internalcite}
%     \def\shortciteA{\def\citeauthoryear##1##2##3{##2}\@internalcite}
%     \def\citeyear{\def\citeauthoryear##1##2##3{##3}\@internalcite}
%
%
% -------------------------------------------------------------------------
%
% Citation macros.
%

\let\@internalcite\cite

\def\cite{\def\@citeseppen{-1000}%
    \def\@cite##1##2{[##1\if@tempswa , ##2\fi]}%
    \def\citeauthoryear##1##2##3{##2 ##3}\@internalcite}
\def\citeXNP#1#2{%
  \def\@cite@label{#2}%
  \def\@cite##1##2{##1\if@tempswa , ##2\fi}%
  \def\citeauthoryear##1##2##3{\@cite@label}\@internalcite{#1}}
% \def\@citeseppen{-1000}%
%    \def\@cite@label{#1}
%    \def\@cite##1##2{\if@tempswa ##2\fi}%
%    \def\citeauthoryear##1##2##3{##2 ##3}\@internalcite}
\def\citeNP{\def\@citeseppen{-1000}%
    \def\@cite##1##2{##1\if@tempswa , ##2\fi}%
    \def\citeauthoryear##1##2##3{##2 ##3}\@internalcite}
\def\citeN{\def\@citeseppen{-1000}%
    \def\@cite##1##2{##1\if@tempswa , ##2]\else{]}\fi}%
    \def\citeauthoryear##1##2##3{##2 [##3}\@citedata}
\def\shortcite#1{\citeyear{#1}}
\def\citeS#1{[\citeANP{#1} \citeyearNP{#1}]}
\def\citeNS#1{\citeANP{#1} \citeyear{#1}}
\def\citeNPS#1{\citeANP{#1} \citeyearNP{#1}}
%testing year,year
\def\citeNN{\def\@citeseppen{-1000}%
    \def\@cite##1##2{[##1\if@tempswa , ##2\fi]}%
    \def\citeauthoryear##1##2##3{##3}\@citedata}

\def\citeA{\def\@citeseppen{-1000}%
    \def\@cite##1##2{[##1\if@tempswa , ##2\fi]}%
    \def\citeauthoryear##1##2##3{##2}\@internalcite}
\def\citeANP{\def\@citeseppen{-1000}%
    \def\@cite##1##2{##1\if@tempswa , ##2\fi}%
    \def\citeauthoryear##1##2##3{##2}\@internalcite}

\def\citeyear{\def\@citeseppen{-1000}%
    \def\@cite##1##2{[##1\if@tempswa , ##2\fi]}%
    \def\citeauthoryear##1##2##3{##3}\@citedata}
\def\citeyearNP{\def\@citeseppen{-1000}%
    \def\@cite##1##2{##1\if@tempswa , ##2\fi}%
    \def\citeauthoryear##1##2##3{##3}\@citedata}

%
% \@citedata and \@citedatax:
%
% Place commas in-between citations in the same \citeyear, \citeyearNP,
% or \citeN command.
% Use something like \citeN{ref1,ref2,ref3} and \citeN{ref4} for a list.
%
\def\@citedata{%
        \@ifnextchar [{\@tempswatrue\@citedatax}%
                                  {\@tempswafalse\@citedatax[]}%
}

\def\@citedatax[#1]#2{%
\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi%
  \def\@citea{}\@cite{\@for\@citeb:=#2\do%
    {\@citea\def\@citea{; }\@ifundefined% by Young
       {b@\@citeb}{{\bf ?}%
       \@warning{Citation `\@citeb' on page \thepage \space undefined}}%
{\csname b@\@citeb\endcsname}}}{#1}}%

% don't box citations, separate with ; and a space
% also, make the penalty between citations negative: a good place to break.
%
\def\@citex[#1]#2{%
\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi%
  \def\@citea{}\@cite{\@for\@citeb:=#2\do%
    {\@citea\def\@citea{; }\@ifundefined% by Young
       {b@\@citeb}{{\bf ?}%
       \@warning{Citation `\@citeb' on page \thepage \space undefined}}%
{\csname b@\@citeb\endcsname}}}{#1}}%

% (from apalike.sty)
% No labels in the bibliography.
%
\def\@biblabel#1{ }

% (from apalike.sty)
% Set length of hanging indentation for bibliography entries.
%
%\newlength{\bibhang}
%\setlength{\bibhang}{2em}

% Indent second and subsequent lines of bibliographic entries. Stolen
% from openbib.sty: \newblock is set to {}.

\newdimen\bibindent
\bibindent=1em


% the original definition of \@listI doesn't set labelwidth
\def\@listI{\leftmargin\leftmargini
 \labelwidth\leftmargini\advance\labelwidth-\labelsep
 \parsep 0pt plus 1pt
 \topsep 6pt plus 2pt minus 2pt
 \itemsep 2pt plus 1pt minus .5pt}
\let\@listi\@listI
\@listi 

\newcommand{\longpage}{\enlargethispage{\baselineskip}}
\newcommand{\shortpage}{\enlargethispage{-\baselineskip}}

% Don't indent bibliography and
% override \refname (which sets fontsize):
\def\thebibliography#1{
\begin{spacing}{1.1}
  \chapter*{\sf{References}}
   \list
{\@biblabel{\arabic{enumiv}}}{%
   %\settowidth\labelwidth{[#1]}
   \labelwidth 0pt
   \leftmargin \bibindent
   \labelsep 0pt
   \listparindent -\bibindent
   \labelsep -\bibindent
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy
    \clubpenalty=4500
    \widowpenalty=4500
    \frenchspacing}
\def\endthebibliography{%
\end{spacing}
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
  \endlist}
\def\@lbibitem[#1]#2{\item[]\if@filesw
      {\def\protect##1{\string ##1\space}\immediate
       \write\@auxout{\string\bibcite{#2}{#1}}}\fi\hskip-1em\ignorespaces}


\def\cite{\def\@citeseppen{-1000}%
    \def\@cite##1##2{[##1\if@tempswa , ##2\fi]}%
    \let\@lastauthor=\@noauthor
    \let\citeauthoryear=\citeauthoryear@no@repeats\@internalcite}
    %\def\citeauthoryear##1##2##3{##2 ##3}\@internalcite

\def\@noauthor={\relax}
\let\@lastauthor=\@noauthor
\let\@currauthor=\@noauthor

\def\citeauthoryear@no@repeats#1#2#3{%
  \def\@currauthor{\csname @author #1\endcsname}%
  \ifx\@lastauthor\@currauthor{#3}\else{#2 #3}\fi%
  \let\@lastauthor=\@currauthor}


%%%%%%%% NOTATIONS %%%%%%%%%%

% --------------------- Basic --------------------

% Axis (basis)
\newcommand{\axis}[1]{\hat{#1}}
% Vector and its derivatives
\newcommand{\mvec}[1]{\mathbf{#1}}
\newcommand{\mdvec}[1]{\dot{\mathbf{#1}}}
\newcommand{\mddvec}[1]{\ddot{\mathbf{#1}}}
% Point
\newcommand{\mpoint}[1]{\mvec{p}_{#1}}
\newcommand{\mRpoint}[2]{\mvec{p}_{#1}\in\mReal{#2}}
% Physical vector (e.g. rotation axis, etc.)
\newcommand{\pvec}[1]{\vec{#1}}
% Matrix
\newcommand{\mmat}[1]{\mathbf{#1}}

% Coordinate frame 
\newcommand{\mframe}[1]{\mathcal{F}_{#1}}
\newcommand{\morigin}[1]{\mathcal{O}_{#1}}

% Tasks
\newcommand{\mtask}[1]{\mvec{#1}}
\newcommand{\mdtask}[1]{\mdvec{#1}}

% ------------- Topological spaces  ----------------
% space of real numbers
\newcommand{\Rspace}{\mathbb{R}}
\newcommand{\mReal}[1]{\mathbb{R}^{#1}}
\newcommand{\Sspace}{\mathbb{S}}
\newcommand{\mS}[1]{\mathbb{S}^{#1}}
% workspace 
\newcommand{\we}{\mathcal{W}}
% configuration space
\newcommand{\ce}{\mathcal{C}}
\newcommand{\cobst}{\mathcal{C}_{obst}} 
\newcommand{\cfree}{\mathcal{C}_{free}}
% state space
\newcommand{\xe}{\mathcal{X}}
\newcommand{\xfree}{\mathcal{X}_{free}}
\newcommand{\xobst}{\mathcal{X}_{obst}}
%%%%%%%%%%%%%%%%%%%%%%%%%

% Graph
\newcommand{\graph}{\mathcal{G}}
% Configurations
\newcommand{\config}{q\in\qe = \mReal{n}}
\newcommand{\qinit}{q_{init}}
\newcommand{\qend}{q_{end}}
% Path
\newcommand{\path}{\tau:[0,1]}
% Trajectory
\newcommand{\traj}{\tau(t)}
% Local Planner
\newcommand{\localplanner}{\mathcal{L}}


