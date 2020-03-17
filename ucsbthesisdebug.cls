% UCSB thesis document class
%    for LaTeX version 2e - 2014/09/11
% Most recent editor: Daniel Sank
% adapted from M. G. Neeley's mgnthesis.cls
% inspired by John T. Whelon's Jucthesis.cls
% which in turn derives from ucthesis.sty

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucsbthesis}[2014/09/11 UCSB thesis]

% derive from the book class
\LoadClassWithOptions{book}

\RequirePackage[usenames, dvipsnames, hyperref]{xcolor} %from mk

% BC, since I'm compiling with lua and using Geometry
\RequirePackage{luatex85}

% set up the page geometry per UCSB thesis guidelines
\RequirePackage[top=1.0in, bottom=1.0in,
inner=1.25in, outer=1.25in,
includehead,footskip=0.25in,
margin=1.25in,
marginparwidth=2.25in, marginparsep=0.1in]{geometry}



\ProcessOptions

\newcommand{\approvalmonth}[1]{\gdef\@approvalmonth{#1}}
\newcommand{\degreemonth}[1]{\gdef\@degreemonth{#1}}
\newcommand{\degreeyear}[1]{\gdef\@degreeyear{#1}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\field}[1]{\gdef\@field{#1}}
\newcommand{\campus}[1]{\gdef\@campus{#1}}

\newcommand{\chair}[1]{\gdef\@chair{#1}}
\newcommand{\experimentalmembera}[1]{\gdef\@experimentalmembera{#1}}
\newcommand{\experimentalmemberb}[1]{\gdef\@experimentalmemberb{#1}}
\newcommand{\theorymember}[1]{\gdef\@theorymember{#1}}
\newcommand{\othermembers}[1]{\gdef\@othermembers{#1}}

\newcommand{\@numberofmembers}{3}
\newcommand{\@approvalspace}{.75in}
\newcommand{\@signaturelinewidth}{4.0in}



%%%%%%%%%%%%%%% Compile modes to make orderly progress.

%%%%  draftmodetrue           draftmodefalse (formal output)

% Finished work              no box formatting           no box formatting

% inprogress                 green box                   no box formatting
%(needs polish but close enough for now inlude in formal compile)

% indraftprogress            blue box                    not shown
% not ready for prime time,  but in progress.  Considered

% draftcomment               red box                     not shown
% very rough content likely to get cut.


\newif\ifdraftmode
\RequirePackage{mdframed}

\definecolor{applegreen}{rgb}{0.55, 0.71, 0.0}
\definecolor{almond}{rgb}{0.94, 0.87, 0.8}
\mdfdefinestyle{inprogressstyle}{frametitle={},innertopmargin=5pt,innerrightmargin=0.5em,%
linewidth=1pt,linecolor=applegreen,hidealllines=false,topline=true,leftline=true,
linewidth=0.4em,backgroundcolor=almond!50}

\DeclareRobustCommand{\inprogress}[1]{
\ifdraftmode
\begin{mdframed}[style=inprogressstyle]
#1
\end{mdframed}
\else
#1
\fi
}

\definecolor{oceanboatblue}{rgb}{0.0, 0.47, 0.75}
\mdfdefinestyle{inprogressstyle}{frametitle={},innertopmargin=5pt,innerrightmargin=0.5em,%
linewidth=1pt,linecolor=oceanboatblue,hidealllines=false,topline=true,leftline=true,
linewidth=0.4em,backgroundcolor=almond!50}
\DeclareRobustCommand{\indraftprogress}[1]{
\ifdraftmode
\begin{mdframed}[style=indraftprogressstyle]
#1
\end{mdframed}
\fi
}

\definecolor{atomictangerine}{rgb}{1.0, 0.6, 0.4}
\definecolor{apricot}{rgb}{0.98, 0.81, 0.69}
\mdfdefinestyle{draftstyle}{frametitle={},innertopmargin=5pt,innerrightmargin=0.5em,%
linewidth=1pt,linecolor=red,hidealllines=false,topline=true,leftline=true,
linewidth=0.4em, backgroundcolor=apricot!20}
\DeclareRobustCommand{\draftcomment}[1]{
\ifdraftmode
\begin{mdframed}[style=draftstyle]
#1
\end{mdframed}
\fi
}

%\DeclareRobustCommand*{\onlinecite}[1]{%
%  \begingroup
%    \romannumeral-`\x % remove space at the beginning of \setcitestyle
%    \setcitestyle{numbers}%
%    \cite{#1}%
%  \endgroup
%}


