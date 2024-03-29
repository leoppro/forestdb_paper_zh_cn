% Current Version: 0.03
% Author: ddswhu
% Homepage: https://ddswhu.me/
% Email: ddswhu@outlook.com
% Lastest Version: https://github.com/EthanDeng/ElegantPaper

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elegantpaper}[2018/1/13 v0.03 ElegantLaTeX Paper class]
  
\LoadClass[11pt]{article}

\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\RequirePackage{ifxetex}
\RequirePackage{etoolbox}
\RequirePackage{overpic}
\RequirePackage{calc}
\AtEndOfClass{\RequirePackage{microtype}}

\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

\DeclareStringOption[en]{lang}
\DeclareVoidOption{cn}{\ekv{lang = cn}}
\DeclareVoidOption{en}{\ekv{lang = en}}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%\ExecuteOptions{12pt}
\ProcessKeyvalOptions*\relax
\ProcessOptions*

% font setting for text and math

\RequirePackage{amsthm}
\RequirePackage{amsmath}
%\RequirePackage{newtxtext}
%\RequirePackage{newtxmath}
%  
\RequirePackage{type1cm}
\RequirePackage{indentfirst}

% more pretty font
\linespread{1.3}

% indentation, table and figure package
\RequirePackage{indentfirst}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{rotating}
\RequirePackage{fancyvrb}
\RequirePackage{type1cm}

\graphicspath{{image/}{figure/}{fig/}{img/}}

% caption settings 
\RequirePackage[font=small,labelfont={bf}]{caption} 
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

% list/itemize/enumerate setting
\RequirePackage[shortlabels]{enumitem}
\setlist{nolistsep}

% define the hyperref color 
\RequirePackage{xcolor}
\definecolor{winered}{rgb}{0.5,0,0}

% bib-settings
\RequirePackage{natbib}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\footnotesize}

% settings for the geometry
\RequirePackage{hyperref}
\hypersetup{
  pdfborder={0 0 0},
  colorlinks=true,
  linkcolor={winered},
  urlcolor={winered},
  filecolor={winered},
  citecolor={winered},
  linktoc=all,
}
\RequirePackage[left=1in, right=1in, top=1in, bottom=1in]{geometry}

% add the \email cmd 
\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}}


% fontsetting
\RequirePackage{ifxetex}
\ifxetex
	\RequirePackage{fontenc}
	\RequirePackage[no-math]{fontspec}
	\setmainfont{Times New Roman}
	\setsansfont{Times New Roman}
	%\setmonofont[Scale=0.8]{Courier New}
	\RequirePackage{xeCJK}
	\RequirePackage{xunicode}
	\setCJKmainfont{Source Han Serif CN}
	\setCJKsansfont{Source Han Serif CN}
	\setCJKmonofont{Source Han Serif CN}
	\XeTeXlinebreaklocale "zh"
	\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt
	\RequirePackage{newtxmath}
	\DeclareSymbolFont{operators}{\encodingdefault}{\familydefault}{m}{n}
\else
	\RequirePackage[T1]{fontenc}
	\RequirePackage{newtxtext}
	\RequirePackage{newtxmath}
	\RequirePackage[scale=0.8]{newtxtt}
	\RequirePackage[UTF8, scheme=plain]{ctex}
\fi

%

\ifdefstring{\ELEGANT@lang}{cn}{
  	\theoremstyle{plain}% default
	\newtheorem{theorem}{定理}[section] %
	\newtheorem{lemma}[theorem]{引理} %
	\newtheorem{proposition}[theorem]{性质} %
	\newtheorem*{corollary}{推论} %
	\theoremstyle{definition} %
	\newtheorem{definition}{定义}[section] %
	\newtheorem{conjecture}{猜想}[section] %
	\newtheorem{example}{例}[section] %
	\theoremstyle{remark} %
	\newtheorem*{remark}{\normalfont\bfseries评论} %
	\newtheorem*{note}{\normalfont\bfseries注} %
	\newtheorem{case}{\normalfont\bfseries案例} %
	\renewcommand*{\proofname}{\normalfont\bfseries证明} %
	\renewcommand\contentsname{目录}
	\renewcommand\refname{参考文献} %
	\renewcommand\figurename{图} %
	\renewcommand\tablename{表}%
	\newcommand\versiontext{版本：}%
	\newcommand\updatetext{最后更新：}%
	\renewcommand\abstractname{摘\hspace{2em}要}
	\setlength{\parindent}{2em}
}{\relax}
\ifdefstring{\ELEGANT@lang}{en}{
  \theoremstyle{plain}% default
	\newtheorem{theorem}{Theorem}[section] %
	\newtheorem{lemma}[theorem]{Lemma} %
	\newtheorem{proposition}[theorem]{Proposition} %
	\newtheorem*{corollary}{Corollary} %
	\theoremstyle{definition} %
	\newtheorem{definition}{Definition}[section] %
	\newtheorem{conjecture}{Conjecture}[section] %
	\newtheorem{example}{Example}[section] %
	\theoremstyle{remark} %
	\newtheorem*{remark}{Remark} %
	\newtheorem*{note}{Note} %
	\newtheorem{case}{Case} %
	\renewcommand*{\proofname}{\normalfont\bfseries\color{ecolor}Proof}%
	\newcommand\versiontext{Version: }%
	\newcommand\updatetext{Last update: }%
}{\relax}


\newtoks\version
\newtoks\institute
\def\maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE\bfseries \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author\\
        \the\institute
      \end{tabular}\par}%
  \end{center}%
  \par
  \vskip 1.5em}

\DeclareSymbolFont{cmlargesymbols}{OMX}{cmex}{m}{n}
\DeclareMathSymbol{\intop}{\mathop}{cmlargesymbols}{"5A}
  \def\int{\intop\nolimits}
\DeclareMathSymbol{\ointop}{\mathop}{cmlargesymbols}{"49}
  \def\oint{\ointop\nolimits}
\DeclareMathSymbol{\sumop}{\mathop}{cmlargesymbols}{"58}
  \let\sum\sumop
\DeclareMathSymbol{\prodop}{\mathop}{cmlargesymbols}{"59}
  \let\prod\prodop



\newcommand\figref[1]{{\bfseries Figure~\ref{#1}}}
\newcommand\tabref[1]{{\bfseries Table~\ref{#1}}}


\RequirePackage{listings} 
\definecolor{lightgrey}{rgb}{0.9,0.9,0.9}
\definecolor{frenchplum}{RGB}{190,20,83}
\lstset{language=[LaTeX]TeX,
	texcsstyle=*\bf\color{winered}\ttfamily,
	basicstyle=\footnotesize\ttfamily,
	numbers=none,
	breaklines=true,
	keywordstyle=\bf\color{winered}\ttfamily,
	commentstyle=\color{gray},
	emph={elegantpaper,fontenc,fontspec,xeCJK,xunicode,newtxmath,figure,fig,image,img,table,itemize,enumerate,newtxtext,newtxtt,ctex,microtype,description,times,newtx,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm},
	emphstyle={\color{frenchplum}},
	morekeywords={DeclareSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle},
	frame=none,
	tabsize=2,
	backgroundcolor=\color{lightgrey}
}


\bibliographystyle{aer}

