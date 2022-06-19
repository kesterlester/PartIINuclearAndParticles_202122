\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NSTexam}[2020/02/11 for UofC NST examinations (Version 8.4)]
%==============================================================================%
%                          Do NOT change this file!                            %
%                          ------------------------                            %
% If you really want to change some of settings/commands defined in this file, %
% put the changes in your LaTeX source .tex file, or put them in another .sty  %
% file of your own, which you should load after loading this file.             %
%==============================================================================%
% NSTexam.cls: LaTeX class file for NST (Physics) papers.                      %
% -----------                                                                  %
% Usage:                                                                       %
%                                                                              %
%  \documentclass[<option>]{NSTexam}          % <option> can be "cmmu",        %
%                                             % "euler", "txfonts", "newtx"    %
%                                             % for additional fonts           %
%                                                                              %
%  <put any specific LaTeX definitions here, for example to change the         %
%  default settings that are made at the bottom of this file>                  %
%                                                                              %
%  \begin{document}                                                            %
%                                                                              %
%  \ID{<text>}                                % letter label for each page, or %
%  \noID                                      % for none                       %
%                                                                              %
%  \version{<text>}                           % for each footline, or          %
%  \noversion                                 % for none                       %
%                                                                              %
%  \tripos{NATURAL SCIENCES TRIPOS <tripos>}  % can be used twice              %
%  \date{<date> \qquad <time>}                                                 %
%  \paper{<paper>}                                                             %
%                                                                              %
%  \begin{rubric}                                                              %
%  <Rubric text. Force a new line with\\                                       %
%  when required>                                                              %
%  \end{rubric}                                                                %
%                                                                              %
%  \requirements{<stationery>}{<special>}    % use \\ for newlines             %
%                                                                              %
%  \warning                                                                    %
%                                                                              %
%  \sectionfalse                             % for numbered questions          %
%  \sectiontrue                              % for section/numbered questions  %
%                                                                              %
%  \section{A\\                                                                %
%  \em <Additional text if required>}                                          %
%                                                                              %
%  \begin{questions}                                                           %
%                                                                              %
%  \question <The LaTeX source for the question>                               %
%  \insertplot{<ps-file>{<x-offset>}{<y-offset>}{<y-space>}                    %
%                                                                              %
%  \question <The LaTeX source \marks{5}>              % to indicate in right  %
%                                                      % margin the number of  %
%                                                      % marks                 %
%                                                                              %
%  \newpage                                            % to force a new page   %
%  \question \either{One part...}\or{Another part...}                          %
%                                                                              %
%  \question <Text...>                                 % for list of parts of  %
%  \begin{parts}                                       % a question (use "\ "  %
%  \part <lettered (a), (b),... question parts>        % between \question and %
%  \part <text>                                        % \begin{parts} if      %
%  \part <text>                                        % is no text            %
%  \begin{subparts}                                                            %
%  \subpart <roman numbered (i), (ii),... question sub-part>                   %
%  \subpart <text>                                                             %
%  \subpart <text>                                                             %
%  \end{subparts}                                                              %
%  \end{parts}                                                                 %
%                                                                              %
%  \question <Text...>                                                         %
%  \begin{allparts}                                 % as \begin{parts}, but    %
%  \part <lettered (a), (b),... question parts>     % using one lettered       %
%  \part <text>                                     % sequence throughout      %
%  \end{allcparts}                                   % a particular question    %
%  <Text...>                                                                   %
%  \begin{allparts}                                                            %
%  \part <lettered part, continuing the sequence...>                           %
%  \end{allparts}                                                              %
%                                                                              %
%  \section{B}                                                                 %
%                                                                              %
%  \thispagestyle{continue}                       % use this if the following  %
%  \question <The LaTeX source for the question>  % question is split at the   %
%                                                 % bottom of an odd-numbered  %
%                                                 % page                       %
%  \end{questions}                                                             %
%                                                                              %
%  \endofpaper                                    % for "END OF PAPER"         %
%                                                                              %
%  \end{document}                                                              %
%                                                                              %
%==============================================================================%
% D. A. Green --- MRAO --- 2020 February 11th (Version V8.4)                   %
%==============================================================================%
% Usually load the standard article class, but if big option has been
% set, instead load extarticle with larger fonts, and change base size
% from 14pt to 15.5pt...
%
% Store font options for processing later...
%
\newif\ifNSTnone\NSTnonetrue
\newif\ifNSTcmmu\NSTcmmufalse
\newif\ifNSTeuler\NSTeulerfalse
\newif\ifNSTtx\NSTtxfalse
\newif\ifNSTtxfonts\NSTtxfontsfalse
\newif\ifNSTnewtx\NSTnewtxfalse
\newif\ifNSTbig\NSTbigfalse
%
\DeclareOption{cmmu}{\NSTcmmutrue\NSTnonefalse}
\DeclareOption{euler}{\NSTeulertrue\NSTnonefalse}
\DeclareOption{txfonts}{\NSTtxfontstrue\NSTnonefalse\NSTtxtrue}
\DeclareOption{newtx}{\NSTnewtxtrue\NSTnonefalse\NSTtxtrue}
\DeclareOption{big}{\NSTbigtrue}
\ProcessOptions\relax
%
% for big option, load extartcile for 14pt, and make normalsize
% a bit bigger still (15.5pt)
%
\ifNSTbig
  \typeout{********* big option set **************}
  \LoadClass[a4paper,14pt,twoside]{extarticle}
  \renewcommand\normalsize{%
    \@setfontsize\normalsize {15.5}{17.5}%
    \abovedisplayskip 14\p@ \@plus3\p@ \@minus7\p@
    \abovedisplayshortskip \z@ \@plus4\p@
    \belowdisplayshortskip 7\p@ \@plus4\p@ \@minus3\p@
    \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
\else
  \LoadClass[a4paper,12pt,twoside]{article}
\fi
%
% Load amsmath, graphicx, abd babel (for British english hyphenation)...
%
\usepackage{amsmath}
\usepackage{graphicx}
\usepackage[british]{babel}
%------------------------------------------------------------------------------%
\def\maketildeletter{\catcode`\~=11\relax}
\def\maketildeactive{\catcode`\~=13\relax}
\maketildeletter
\typeout{==============NST examinations class: V8.4 (2019-Feb-20)==============}
\typeout{====== Dave Green --- MRAO --- e-mail: D.A.Green@mrao.cam.ac.uk ======}
\typeout{======================================================================}
\typeout{>>>>>>>>>>>> see: http://www.mrao.cam.ac.uk/~dag/NSTexam/ <<<<<<<<<<<<}
\typeout{>>>>>>>>>>>>>>>>> for current version and documentation <<<<<<<<<<<<<<}
\typeout{======================================================================}
\maketildeactive
%
% Page dimensions:
%
\headheight      12 pt
\headsep         12 pt
\oddsidemargin    4 mm
\evensidemargin   4 mm
\textheight     220 mm
\textwidth      150 mm
\topmargin       -5 mm
\footskip        24 pt
\leftmargin      30 pt
\parindent=30 pt
%
% Adjusted if big option set:
%
\ifNSTbig
  \headheight      12 pt
  \headsep          4 pt
  \oddsidemargin  -15 mm
  \evensidemargin -15 mm
  \textheight     270 mm
  \textwidth      180 mm
  \topmargin      -20 mm
  \footskip        17 pt
\fi
%
% For alternate Physics or HSP headers for the same paper...
%
\newif\ifII
\def\return{\par } % pressing return
\def\IIe{e }      % single character responses
\def\IIE{E }      %   "       "         "
\def\IIe{p }      %   "       "         "
\def\II{P }      %   "       "         "
\def\IIh{h }      %   "       "         "
\def\IIH{H }      %   "       "         "
\def\askifII{
  \typeout{------------------------------------------------------}
  \ifx\undefined\option
    \message{Physics (P) or Half Subject (H) [P]?: }
    \read-1 to\option
    \typeout{------------------------------------------------------}
  \fi
  \ifx\option\return \IItrue \fi
  \ifx\option\IIe \IItrue \fi
  \ifx\option\IIE \IItrue \fi
  \ifx\option\IIp \IItrue \fi
  \ifx\option\IIP \IItrue \fi
  \ifx\option\IIh \IIfalse \fi
  \ifx\option\IIH \IIfalse \fi
}
%
% For (optional) basic answers...
%
\newwrite\basics
\newif\ifshowbasics\showbasicsfalse
%
% headers...
%
\def\tripos#1{\hspace*{30 pt}#1\newline
  \ifshowbasics
    \immediate\write\basics{\unexpanded{\hspace*{30 pt}#1\newline}}
  \fi
}
\def\date#1{
  \vspace{6 pt}\hbox to \hsize{\rule{150 mm}{0.25 mm}\hss}\newline
  \hspace*{30 pt}#1\newline
  \vspace{6 pt}\hbox to \hsize{\rule{150 mm}{0.25 mm}\hss}\newline
  \vspace{6 pt}\newline
  \ifshowbasics
    \immediate\write\basics{\unexpanded{\vspace{6 pt}\hbox to
       \hsize{\rule{150 mm}{0.25 mm}\hss}\newline}}
    \immediate\write\basics{\unexpanded{\hspace*{30 pt}#1\newline}}
    \immediate\write\basics{\unexpanded{\vspace{6 pt}\hbox to
       \hsize{\rule{150 mm}{0.25 mm}\hss}\newline}}
    \immediate\write\basics{\unexpanded{\vspace{6 pt}\newline}}
  \fi
}
\def\paper#1{\hspace*{30 pt}#1\newline
  \ifshowbasics
    \immediate\write\basics{\unexpanded{\hspace*{30 pt}#1\newline}}
  \fi
}
%
% rubric (as verse environment)...
%
\newenvironment{rubric}{\begin{verse}\it}{\end{verse}}
%
% requirements...
%
\def\requirements#1#2{
   \bigskip
   \leftline{\hspace*{30 pt}\parbox[t]{0.43\hsize}{STATIONERY REQUIREMENTS}
                     \quad \parbox[t]{0.43\hsize}{SPECIAL REQUIREMENTS}}
   \vskip2pt
   \leftline{\hspace*{30 pt}\parbox[t]{0.43\hsize}{#1}
                     \quad \parbox[t]{0.43\hsize}{#2}}
   \vfill
}
%
% warning...
%
\def\warning{
  \vfill
  \begin{center}
   \setlength{\fboxrule}{2pt}\setlength{\fboxsep}{2mm}\fbox{%
   \setlength{\fboxrule}{1pt}\setlength{\fboxsep}{1mm}\fbox{%
   \parbox{0.65\linewidth}{%
   \begin{center}
     \large You may not start to read the questions\\
            printed on the subsequent pages of this\\
            question paper until instructed that you\\
            may do so by the Invigilator.
   \end{center}}
   }}
   \end{center}
   \vfill
}
%
% end of paper...
%
\def\endofpaper{\begin{center}
 END OF PAPER
\end{center}}
%
% section (as verse environment)...
%
\def\section#1{\ifdim\markscount>0pt\typeout{----- marks ---> \the\markscount}
\fi\markscount=0pt\vspace{12pt}\begin{verse}{\def\\{\@centercr\hskip 4pt}%
\hskip 4pt SECTION #1}\initial{#1}\typeout{}\typeout{* SECTION:
\sectioninitial}\end{verse}}
%
\newcount\lettercount
\def\initial#1{\lettercount=0\setinitial#1\end}
\def\setinitial#1{%
  \ifnum\lettercount=0\global\def\sectioninitial{#1}\fi
  \ifx#1\end
    \let\next=\relax
  \else
    \advance\lettercount by 1
    \let\next=\setinitial
  \fi
  \next}
%
\newif\ifsection
\sectionfalse
%
% question...
%
\newcounter{questioncount}
\newcounter{allpartcount}
\def\resetquestioncount{\setcounter{questioncount}{0}}
\newenvironment{questions}{\begin{list}{\vspace{24pt}\hbox to 30pt{%
  \ifsection%
    \typeout{== question: \sectioninitial\arabic{questioncount}}%
    {\sectioninitial\arabic{questioncount}\hfill}%
  \else%
    \typeout{== question: \arabic{questioncount}}%
    {\arabic{questioncount}\hfill}%
  \fi}}{\labelsep=0pt\leftmargin=0pt\parsep=0pt\listparindent=30pt
  \topsep=18pt\itemsep=18pt\labelwidth=30pt
  \usecounter{questioncount}\itemindent\labelwidth}}{
  \ifdim\markscount>0pt\typeout{----- marks ---> \the\markscount}\fi
  \end{list}\thispagestyle{last}}
\def\question{\ifdim\markscount>0pt\typeout{----- marks ---> \the\markscount}\fi
\markscount=0pt\setcounter{allpartcount}{0}\item}
%
% either/or questions...
%
\long\def\either#1\or#2{
\ \hbox to 72 pt{\hbox to 50 pt{\bf Either\hfil}(a)\hfil}#1\par
\vspace{12pt}
\ \hbox to 72 pt{\hbox to 50 pt{\bf Or\hfil}(b)\hfil}#2\par}
%
% parts and sub-parts...
%
\newcounter{partcount}
\newenvironment{parts}{
  \begin{list}{({\rm\alph{partcount}\/})\hfill}{
          \usecounter{partcount}\leftmargin=30pt\topsep=2pt
          \labelsep=0pt\labelwidth=20pt\itemindent=20pt
          \itemsep=2pt\listparindent=20pt}}{\end{list}}
\newcounter{subpartcount}
\newenvironment{subparts}{
  \begin{list}{(\roman{subpartcount})\hfill}{
          \usecounter{subpartcount}\leftmargin=30pt\topsep=2pt
          \labelsep=0pt\labelwidth=20pt\itemindent=20pt
          \itemsep=2pt\listparindent=20pt}}{\end{list}}
\let\part=\item
\let\subpart=\item
%
% allparts as parts, but can have multiple \begin{allparts} ...
% \end{allparts} in a each question with one sequence of lettering...
%
\newenvironment{allparts}{%
  \begin{list}{\stepcounter{allpartcount}({\rm\alph{allpartcount}\/})\hfill}{
    \leftmargin=30pt\topsep=2pt
    \labelsep=0pt\labelwidth=20pt\itemindent=20pt
    \itemsep=2pt\listparindent=20pt}}{\end{list}}
%
% to a question with a part, with no text...
%
\newdimen\startpartdim
\startpartdim=\baselineskip
\global\advance\startpartdim 2pt%
\def\startpart{\quad\vspace{-\startpartdim}}
%
% for marks in right margin (cummulative count per question in pt in
% \markscount, a dimension, so deals with half marks)...
%
\newdimen\markscount
\markscount=-1pt
\def\markfont{\normalsize\rm}
%
\def\marks#1{\global\advance\markscount #1pt\strut\vadjust{%
\kern-\dp\strutbox{\vtop to \dp\strutbox{\baselineskip\dp\strutbox\vss\rlap{%
\hskip\hsize\quad\markfont{[\displaymarks{#1}]}}\null}}}}
%
% display half marks as a fraction...
%
\def\displaymarks#1{\def\savemarks{#1.:}\expandafter\halfmarks\savemarks\relax}
\def\halfmarks#1.#2:{\def\halfamark{5.}\def\halftest{#2}%
\ifx\halftest\halfamark#1{\half}\else#1\fi}
%
% (optional) answers...
%
\newif\ifshowanswers\showanswersfalse
\def\answerbegin{\centerline{\hrulefill}\small}
\def\answerend{\centerline{\hrulefill}}
\AtBeginDocument{\ifshowanswers
  \newenvironment{answer}{\bgroup\answerbegin}{\answerend\egroup}
\else
  \long\def\answer#1\endanswer{\relax}
\fi}
%
% (optional) basic answers... (written to <jobname>-basics.tex)...
%
\AtBeginDocument{\ifshowbasics
  \immediate\openout\basics=\jobname-basics.tex\relax
  \ifNSTcmmu
    \immediate\write\basics{\unexpanded{\documentclass[cmmu]{NSTexam}}}
  \else\ifNSTeuler
    \immediate\write\basics{\unexpanded{\documentclass[cmmu]{NSTexam}}}
  \else\ifNSTtxfonts
    \immediate\write\basics{\unexpanded{\documentclass[txfonts]{NSTexam}}}
  \else\ifNSTnewtx
    \immediate\write\basics{\unexpanded{\documentclass[newtx]{NSTexam}}}
  \else
    \immediate\write\basics{\unexpanded{\documentclass{NSTexam}}}
  \fi\fi\fi\fi
  \immediate\write\basics{\unexpanded{\begin{document}}}
\fi}
%
% Check for first call...
%
\newif\ifstartbasic\startbasictrue
\def\basic#1{\ifshowbasics
  \ifstartbasic
    \immediate\write\basics{\unexpanded{\vskip20pt}}
    \immediate\write\basics{\unexpanded{\begin{itemize}}}
    \immediate\write\basics{\unexpanded{\item[]\textbf{Answers}}}
  \fi
  \startbasicfalse
  \immediate\write\basics{\string\item[\arabic{questioncount})]
     \unexpanded{#1}}
\fi}
%
\AtEndDocument{\ifshowbasics
  \immediate\write\basics{\unexpanded{\end{itemize}}}
  \immediate\write\basics{\unexpanded{\end{document}}}
  \immediate\closeout\basics
  \typeout{======================================================================}
  \typeout{Note: \jobname-basics.tex has been written...}
  \typeout{======================================================================}
\fi}
%
% for page identification...
%
\def\today{\number\day\space
  \ifcase\month\or January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December
  \fi\space\number\year}
\def\ID#1{\def\paperID{#1}}
\def\noID{\def\paperID{}}
\def\paperyear#1{\def\copyyear{#1}}
\def\copybox{\ifNSTbig\hskip-5mm\else\hskip-20mm\fi
  \rotatebox{90}{\hbox to 0pt{\footnotesize\hskip100mm
  \copyright\ \copyyear\ University of Cambridge\hss}}}
\def\version#1{\def\paperV{#1}}
\def\noversion{\def\paperV{}}
\ID{A}
\paperyear{\the\year}
\version{(\today)}
%
% page styles: first     no page number, university logo top left
%              turnover  page numbers, TURN OVER on odd pages
%              continue  if a question is split at the bottom of an odd page
%                        (put \thispagestyle{continue} before the question)
%              explicit  if explicitly numbered continue is needed
%              empty     no page number or TURN OVER (for values page)
%              last      page numbers only (for last page)
%
\def\lowerleft{\vbox to 0pt{\vskip 70pt
  {\hbox to 0pt {\hss {\small {\paperID}} \hskip 5pt}}\vss}}
\def\logobox{\hbox to 0pt{\vbox to 0pt{\vss
  \hbox{\includegraphics[width=28mm]{uni-logo}}\vskip+5mm}\hss}}
\def\ps@first{\let\@mkboth\@gobbletwo
  \def\@oddhead{\ifNSTbig\else\hbox{\logobox}\fi\hfill}
  \def\@oddfoot{\copybox\rm\lowerleft{\small\paperV}\hfil}
  \def\@evenhead{\rm\hfil{\small\thepage}\hfil}
  \def\@evenfoot{\copybox\rm\lowerleft{\small\paperV}\hfil}}
\def\ps@turnover{\let\@mkboth\@gobbletwo
  \def\@oddhead{\rm\hfil{\small\thepage}\hfil}
  \def\@oddfoot{\copybox\rm\lowerleft{\small\paperV}\hfil(TURN OVER}
  \def\@evenhead{\rm\hfil{\small\thepage}\hfil}
  \def\@evenfoot{\copybox\rm\lowerleft{\small\paperV}\hfil}}
\def\thepageone{1}
\def\ps@continue{\let\@mkboth\@gobbletwo
  \def\@oddhead{\rm\hfil{\if\thepage\thepageone\else{\small\thepage}\fi}\hfil}
  \def\@oddfoot{\copybox\rm\lowerleft{\small\paperV}\hfil
  \ifsection
   (TURN OVER for continuation of question \sectioninitial\arabic{questioncount}
  \else
   (TURN OVER for continuation of question \arabic{questioncount}
  \fi}
  \def\@evenhead{\rm\hfil{\small\thepage}\hfil}
  \def\@evenfoot{\copybox\rm\lowerleft{\small\paperV}\hfil}}
%
% explicit page number...
%
\def\explicitcontinue#1{\def\explicitcount{#1}\thispagestyle{explicit}}
\def\explicitcount{0}
%
\def\ps@explicit{\let\@mkboth\@gobbletwo
  \def\@oddhead{\rm\hfil{\if\thepage\thepageone\else{\small\thepage}\fi}\hfil}
  \def\@oddfoot{\copybox\rm\lowerleft{\small\paperV}\hfil
  \ifsection
   (TURN OVER for continuation of question \sectioninitial{\explicitcount}
  \else
   (TURN OVER for continuation of question {\explicitcount}
  \fi}
  \def\@evenhead{\rm\hfil{\small\thepage}\hfil}
  \def\@evenfoot{\copybox\rm\lowerleft{\small\paperV}\hfil}}
\def\ps@empty{\let\@mkboth\@gobbletwo
  \let\@oddhead\@empty
  \def\@oddfoot{\copybox\rm\lowerleft{\small\paperV}\hfil}
  \let\@evenhead\@empty
  \def\@evenfoot{\copybox\rm\lowerleft{\small\paperV}\hfil}}
\def\ps@last{\let\@mkboth\@gobbletwo
  \def\@oddhead{\rm\hfil{\small\thepage}\hfil}
  \def\@oddfoot{\copybox\rm\lowerleft{\small\paperV}\hfil}
  \def\@evenhead{\rm\hfil{\small\thepage}\hfil}
  \def\@evenfoot{\copybox\rm\lowerleft{\small\paperV}\hfil}}
%-------------------------------------------------------------------------------
% Maths mode (re-)definitions:
%-------------------------------------------------------------------------------
\AtBeginDocument{
%
% for slanted lower case greek letters (changed from \mathord to \mathalpha,
% so will use bold type font when requested):
%
\DeclareMathSymbol{\alpha}{\mathalpha}{letters}{"0B}
\DeclareMathSymbol{\beta}{\mathalpha}{letters}{"0C}
\DeclareMathSymbol{\gamma}{\mathalpha}{letters}{"0D}
\DeclareMathSymbol{\delta}{\mathalpha}{letters}{"0E}
\DeclareMathSymbol{\epsilon}{\mathalpha}{letters}{"0F}
\DeclareMathSymbol{\zeta}{\mathalpha}{letters}{"10}
\DeclareMathSymbol{\eta}{\mathalpha}{letters}{"11}
\DeclareMathSymbol{\theta}{\mathalpha}{letters}{"12}
\DeclareMathSymbol{\iota}{\mathalpha}{letters}{"13}
\DeclareMathSymbol{\kappa}{\mathalpha}{letters}{"14}
\DeclareMathSymbol{\lambda}{\mathalpha}{letters}{"15}
\DeclareMathSymbol{\mu}{\mathalpha}{letters}{"16}
\DeclareMathSymbol{\nu}{\mathalpha}{letters}{"17}
\DeclareMathSymbol{\xi}{\mathalpha}{letters}{"18}
\DeclareMathSymbol{\pi}{\mathalpha}{letters}{"19}
\DeclareMathSymbol{\rho}{\mathalpha}{letters}{"1A}
\DeclareMathSymbol{\sigma}{\mathalpha}{letters}{"1B}
\DeclareMathSymbol{\tau}{\mathalpha}{letters}{"1C}
\DeclareMathSymbol{\upsilon}{\mathalpha}{letters}{"1D}
\DeclareMathSymbol{\phi}{\mathalpha}{letters}{"1E}
\DeclareMathSymbol{\chi}{\mathalpha}{letters}{"1F}
\DeclareMathSymbol{\psi}{\mathalpha}{letters}{"20}
\DeclareMathSymbol{\omega}{\mathalpha}{letters}{"21}
\DeclareMathSymbol{\varepsilon}{\mathalpha}{letters}{"22}
\DeclareMathSymbol{\vartheta}{\mathalpha}{letters}{"23}
\DeclareMathSymbol{\varpi}{\mathalpha}{letters}{"24}
\DeclareMathSymbol{\varrho}{\mathalpha}{letters}{"25}
\DeclareMathSymbol{\varsigma}{\mathalpha}{letters}{"26}
\DeclareMathSymbol{\varphi}{\mathalpha}{letters}{"27}
%
% for slanted uppercase greek letters (change from operators to letters,
% so uses slanted font, or bold if requested):
%
\DeclareMathSymbol{\Gamma}{\mathalpha}{letters}{"00}
\DeclareMathSymbol{\Delta}{\mathalpha}{letters}{"01}
\DeclareMathSymbol{\Theta}{\mathalpha}{letters}{"02}
\DeclareMathSymbol{\Lambda}{\mathalpha}{letters}{"03}
\DeclareMathSymbol{\Xi}{\mathalpha}{letters}{"04}
\DeclareMathSymbol{\Pi}{\mathalpha}{letters}{"05}
\DeclareMathSymbol{\Sigma}{\mathalpha}{letters}{"06}
\DeclareMathSymbol{\Upsilon}{\mathalpha}{letters}{"07}
\DeclareMathSymbol{\Phi}{\mathalpha}{letters}{"08}
\DeclareMathSymbol{\Psi}{\mathalpha}{letters}{"09}
\DeclareMathSymbol{\Omega}{\mathalpha}{letters}{"0A}
}
%
% need to use slanted bold letters for bold maths vectors:
%
\DeclareMathAlphabet{\mathbf}{OT1}{cmr}{bx}{it}
\DeclareMathAlphabet{\mathbf}{OML}{cmm}{b}{it}
%
% redefine \vec to use bold fonts
%
\renewcommand{\vec}[1]{{\bf #1}}
%
% for (upright) numbers i and e:
%
\newcommand{\num}[1]{{\rm #1}}
%
% new \hbar, and define \dbar and \lambdabar (use LaTeXs \rule, and
% \mathchoice to get appropriate sizes for rules and back spacings)
%
% use same bar size for all fonts/characters
% (but shift as needed horizantally for each font/character)
%
\def\NSTbar#1#2#3#4{\mathchoice{\NSTdobar{#1}{6}{6}{0.6}{#4}}
  {\NSTdobar{#1}{6}{6}{0.6}{#4}}{\NSTdobar{#2}{4.2}{4.1}{0.4}{#4}}
  {\NSTdobar{#3}{3.2}{3.2}{0.3}{#4}}
}
% \NSTdobar arguments are:
%                #1 (pt) space to move bar
%                #2 (pt) raise of bar (rule)
%                #3 (pt) width of bar (rule)
%                #4 (pt) thickness of bar (rule)
%                #5 character to be barred
%
\def\NSTdobar#1#2#3#4#5{
   \kern #1 pt\rule[#2 pt]{#3 pt}{#4 pt}\kern -#3 pt\kern -#1 pt{#5}
}
%
% these dimensions are for 12pt base font size, cm fonts
%
\renewcommand{\hbar}{{\NSTbar{0}{0.3}{0.2}{h}}}
\newcommand{\dbar}{{\NSTbar{0.2}{0.6}{0.6}{{\rm d}}}}
\newcommand{\lambdabar}{{\NSTbar{0.2}{0.5}{0.6}{\lambda}}}
%
%                                         4
% this version prints things 5 times:   1 3 2
%                                         5
%
% For emboldening any character (\pmb: poor man's bold, cf. TeXbook, p.386)
%
\def\pmb#1{\setbox0=\hbox{#1}%
  \kern-0.02em\copy0\kern-\wd0
  \kern+0.04em\copy0\kern-\wd0
  \kern-0.02em\copy0\kern-\wd0
  \raise+0.02em\copy0\kern-\wd0
  \raise-0.02em\box0}
%
% for differentials...
%
\def\p#1by#2{\frac{\partial{#1}}{\partial{#2}}}
\def\pp#1by#2#3{\frac{\partial^2{#1}}{\partial{#2}\partial{#3}}}
\def\d#1by#2{\frac{{\rm d}{#1}}{{\rm d}{#2}}}
\def\dd#1by#2#3{\frac{{\rm d}^2{#1}}{{\rm d}{#2}{\rm d}{#3}}}
\def\vecd#1{\hbox{\bf d}{\vec{#1}}}
%
% for clearer dot accents...
%
\def\bigdot#1{{\mathop{\kern0pt #1}\limits^{\mkern3mu\pmb{.}}}}
\def\bigddot#1{{\mathop{\kern0pt #1}\limits^{\mkern3mu\pmb{.}\mkern1mu\pmb{.}}}}
%
% For "hints" at the end of questions...
%
\def\shorthint#1{$\big[${\em #1}$\big]$}
%
\long\def\longhint#1{\vskip-20pt$$\left[\begin{minipage}{0.97\linewidth}
   $\strut$\vskip-12pt\em #1\vskip-12pt$\strut$
 \end{minipage}\:\right]$$}
%------------------------------------------------------------------------------%
% Font options
%------------------------------------------------------------------------------%
%
% default, when no options...
%
\ifNSTnone{\typeout{---- no font option}
  \gdef\quark#1{{\rm #1}}
  \gdef\particle#1{{\rm #1}}
  \gdef\uppi{\pi}
  \gdef\upmu{\mu}
  \gdef\upDelta{{\rm\Delta}}
  \gdef\updelta{\delta}
  \gdef\upOmega{{\rm\Omega}}
}\fi
% --------------
% euler fonts...
% --------------
\ifNSTeuler{\typeout{---- 'euler' option, loading euler font}
  \AtEndOfClass{\DeclareMathAlphabet{\upright}{U}{eur}{m}{n}}
  \gdef\quark#1{\upright{#1}}
  \gdef\particle#1{\upright{#1}}
  \gdef\uppi{\upright{\pi}}
  \gdef\upmu{\upright{\mu}}
  \gdef\upDelta{\upright{\Delta}}
  \gdef\updelta{\upright{\delta}}
  \gdef\upOmega{\upright{\Omega}}
}\fi
% -------------
% cmmu fonts...
% -------------
% using a tweaked "upright" version of cmmi10 called cmmu10,
% which requires the following additional files:
%
%    omlcmmu.fd
%    cmmu10.mf
%    cmmu10.tfm
%
\ifNSTcmmu{\typeout{---- 'cmmu' option, loading cmmu font}
  \AtEndOfClass{\DeclareMathAlphabet{\upright}{OML}{cmmu}{m}{r}}
  \gdef\quark#1{\upright{#1}}
  \gdef\particle#1{\upright{#1}}
  \gdef\uppi{\upright{\pi}}
  \gdef\upmu{\upright{\mu}}
  \gdef\upDelta{\upright{\Delta}}
  \gdef\updelta{\upright{\delta}}
  \gdef\upOmega{\upright{\Omega}}
}\fi
% -------------------------
% using txfonts or newtx...
% -------------------------
% (Note: TS1 font encoding defines \d, so redefine my \d differential)
%
\newif\ifNSTgreek
\newbox\NSTone
\newbox\NSTtwo
\newbox\NSTthree
\ifNSTtx{
%
  \ifNSTtxfonts{\IfFileExists{txfonts.sty}{
     \typeout{---- 'txfonts' option, loading txfonts package}}{
     \typeout{**********************ERROR************************}
     \typeout{ 'txfonts' option is given, but txfonts.sty is NOT }
     \typeout{ available in this LaTeX implemention, so you need }
     \typeout{ to install it, or choose a different font option. }
     \typeout{***************************************************}
     \typeout{Stopping now...}\stop}
%
    \AtEndOfClass{\usepackage{txfonts}
    \usepackage[TS1,T1]{fontenc}\selectfont
    \def\d#1by#2{\frac{{\rm d}{#1}}{{\rm d}{#2}}}
    \DeclareMathAlphabet{\mathbf}{OML}{txmi}{bx}{it}
    \DeclareSymbolFont{boldsymbols}{OMS}{txsy}{bx}{n}
    \DeclareMathSymbol{\del}{\mathord}{boldsymbols}{"72}}
%
% these dimensions are for txfonts
%
    \renewcommand{\hbar}{{\NSTbar{0.2}{0.2}{0.2}{h}}}
    \renewcommand{\dbar}{{\NSTbar{0}{0}{0}{{\rm d}}}}
    \renewcommand{\lambdabar}{{\NSTbar{0.5}{0.3}{0.1}{\lambda}}}
  }\fi
%
  \ifNSTnewtx{\IfFileExists{newtxtext.sty}{
     \typeout{---- 'newtx' option, loading newtx packages}}{
     \typeout{**********************ERROR************************}
     \typeout{ 'newtx' option is given, but newtxtext.sty is NOT }
     \typeout{ available in this LaTeX implemention, so you need }
     \typeout{ to install it (and newtxmath.sty), or choose a    }
     \typeout{ different font option.                            }
     \typeout{***************************************************}
     \typeout{Stopping now...}\stop}
%
    \AtEndOfClass{\usepackage{newtxtext}
    \usepackage[slantedGreek]{newtxmath}
    \usepackage[TS1,T1]{fontenc}\selectfont
    \def\d#1by#2{\frac{{\rm d}{#1}}{{\rm d}{#2}}}
    \DeclareMathAlphabet{\mathbf}{OML}{ntxmi}{bx}{it}
%
% note: newtxmath.sty V1.5 was a significant upgrade, so need
% to do things differently for older/newer versions...
%
    \@ifpackagelater{newtxmath}{2016/08/11}{
      \immediate\write16{**** newer newtxmath > 2016/08/11 ****}
      \DeclareSymbolFont{boldsymbols}{LMS}{ntxsy}{bx}{n}
      \renewcommand{\vec}[1]{{\bf #1}}
    }{
      \immediate\write16{**** older newtxmath < 2017/08/11 ****}
      \DeclareSymbolFont{boldsymbols}{OMS}{ntxsy}{bx}{n}
    }
    \DeclareMathSymbol{\del}{\mathord}{boldsymbols}{"72}}
  }\fi
%
   \AtEndOfClass{
     \ifNSTbig
%
% these dimensions are for big newtx fonts...
%
       \def\NSTbar#1#2#3#4{\mathchoice{\NSTdobar{#1}{8}{8}{0.6}{#4}}
         {\NSTdobar{#1}{8}{8}{0.6}{#4}}{\NSTdobar{#2}{5.5}{5.5}{0.4}{#4}}
         {\NSTdobar{#3}{4}{4}{0.3}{#4}}
       }
       \renewcommand{\hbar}{{\NSTbar{0.4}{0.6}{0.4}{h}}}
       \renewcommand{\dbar}{{\NSTbar{0}{0.4}{0.4}{{\rm d}}}}
       \renewcommand{\lambdabar}{{\NSTbar{0.8}{0.9}{1.0}{\lambda}}}
     \else
%
% these dimensions for 12pt newtx fonts...
%
       \renewcommand{\hbar}{{\NSTbar{0.2}{0.4}{0.1}{h}}}
       \renewcommand{\dbar}{{\NSTbar{0}{0.4}{0.4}{{\rm d}}}}
       \renewcommand{\lambdabar}{{\NSTbar{0.8}{0.8}{0.7}{\lambda}}}
     \fi}
%
  \gdef\upright#1{{\rm #1}}
%
% Compare hbox with #1 with uppercase and lowercase versions, if changes it is
% a normal letter (so use \upright{#1}), if not it is a greek letter (use
% \mathfrak{#1} which is the lettersA font with upright greek letters
%
  \newbox\NSTone
  \newbox\NSTtwo
  \newbox\NSTthree
  \gdef\particle#1{\NSTgreekfalse\setbox\NSTone=\hbox{$#1$}
  \setbox\NSTtwo=\hbox{$\uppercase{#1}$}\setbox\NSTthree=\hbox{$\lowercase{#1}$}
  \ifdim\wd\NSTone=\wd\NSTtwo\relax\ifdim\wd\NSTtwo=\wd\NSTthree\relax
  \NSTgreektrue\fi\fi\ifNSTgreek\mathfrak{#1}\else\upright{#1}\fi}
%
  \gdef\quark#1{\upright{#1}}
  \gdef\uppi{\piup}
  \gdef\upmu{\muup}
  \gdef\upDelta{\upright{\Delta}}
  \gdef\updelta{\deltaup}
  \gdef\upOmega{\upright{\Omega}}
%
  \gdef\half{\mbox{\fontencoding{TS1}\selectfont \textonehalf}}
}\else{
%
% for faked bold \del and 1/2 fraction if not txfonts...
%
  \gdef\del{\mathchoice{\pmb{$\displaystyle\nabla$}}{\pmb{$\textstyle\nabla$}}%
     {\pmb{$\scriptstyle\nabla$}}{\pmb{$\scriptscriptstyle\nabla$}}}
  \gdef\half{$\frac{1}{2}$}
}\fi
%
%------------------------------------------------------------------------------%
% Initial settings...
%
\pagestyle{turnover}
\thispagestyle{first}
\pagenumbering{arabic}
\onecolumn
\raggedright                   % Old Schools' recommendations
\raggedbottom                  %  "     "          "
\parskip=0pt
%
\ifNSTbig\vspace*{10mm}\leftline{\logobox}\fi
%
\AtBeginDocument{\normalfont}
%==============================================================================%
\endinput
