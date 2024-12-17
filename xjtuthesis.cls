% multiple1902 <multiple1902@gmail.com>
% xjtuthesis.cls
% Copyright 2011~2013, multiple1902 (Weisi Dai)
% https://code.google.com/p/xjtuthesis/
%
% It is strongly recommended that you read documentations located at
%   http://code.google.com/p/xjtuthesis/wiki/Landing?tm=6
% in advance of your compilation if you have not read them before.
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Weisi Dai.
%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{xjtuthesis}
[2011/7/15 0.0.1 Xi'an Jiaotong University Dissertation Template]

% Brand marks, and version info
\def\xjtuthesis{XJTUthesis}
\def\meta@version{0.6.6}
\def\meta@codename{Monet}
\def\metaversion{\meta@version}

% Option switches
\newif\ifxjtu@bachelor  \xjtu@bachelorfalse
\newif\ifxjtu@master    \xjtu@masterfalse
\newif\ifxjtu@doctor    \xjtu@doctorfalse
\newif\ifxjtu@bigskip   \xjtu@bigskipfalse
\newif\ifxjtu@truefont  \xjtu@truefontfalse
\newif\ifxjtu@nofont    \xjtu@nofontfalse
\newif\ifxjtu@pdflinks  \xjtu@pdflinksfalse
\newif\ifxjtu@colorlinks\xjtu@colorlinksfalse
\newif\ifxjtu@compact   \xjtu@compactfalse
\newif\ifxjtu@content	  \xjtu@contentfalse

\DeclareOption{bachelor}    {\xjtu@bachelortrue}
\DeclareOption{master}      {\xjtu@mastertrue}
\DeclareOption{doctor}      {\xjtu@doctortrue}
\DeclareOption{bigskip}     {\xjtu@bigskiptrue} % bachelor only
\DeclareOption{truefont}    {\xjtu@truefonttrue}
\DeclareOption{nofont}      {\xjtu@nofonttrue}
\DeclareOption{pdflinks}    {\xjtu@pdflinkstrue}
\DeclareOption{colorlinks}  {\xjtu@colorlinkstrue}
\DeclareOption{compact}     {\xjtu@compacttrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions\relax

\LoadClass[openany]{book}

% if-condition
\newif\ifxjtu@inmainbody\xjtu@inmainbodyfalse

\newcommand{\inmainbodyfalse}{\xjtu@inmainbodyfalse}
\newcommand{\inmainbodytrue}{\newpage\xjtu@inmainbodytrue}


\ifxjtu@bachelor\relax\else
  \ifxjtu@master\relax\else
    \ifxjtu@doctor\relax\else
      \ClassError{xjtuthesis}%
                 {You have to specify one of thesis options: bachelor, master or doctor.}{}
    \fi
  \fi
\fi

% Math & format packages
% \RequirePackage{showframe}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
%\RequirePackage{amsbsy,amsopn,amstext,amsxtra,color,multicol,bm,calc,ifpdf,esint, epsf,enumerate,arydshln,extarrows,float,mathrsfs,amsmath}
\RequirePackage{amsbsy,amsopn,amstext,amsxtra,color,multicol,bm,calc,ifpdf,esint, epsf,enumerate,extarrows,float,mathrsfs,amsmath}
\RequirePackage{enumerate}
\RequirePackage{indentfirst}
\RequirePackage{tabularx}
\RequirePackage{threeparttable}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{subfig}
\RequirePackage[numbers,super,square,sort&compress]{natbib}
\RequirePackage{setspace}
\RequirePackage[shortlabels]{enumitem}
\setenumerate[1]{1),fullwidth,itemindent=\parindent,listparindent=\parindent,itemsep=0.05\baselineskip,partopsep=0pt,parsep=0ex,topsep=0.1\baselineskip}
\setenumerate[2]{\qquad(1),itemindent=\parindent,listparindent=\parindent,itemsep=0ex,partopsep=0pt,parsep=0ex,topsep=0\baselineskip}
\RequirePackage{pdfpages}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}

% CJK character support
\RequirePackage[no-math]{fontspec}
\RequirePackage{xltxtra,xunicode}
\RequirePackage[slantfont,boldfont,CJKnumber]{xeCJK}
\punctstyle{hangmobanjiao}
\RequirePackage{zhnumber}

% Padding
\RequirePackage[left=2.6cm, right=2.6cm,top=3.0cm,bottom=2.5cm,a4paper]{geometry}

% Header & footer
\RequirePackage{fancyhdr}
\RequirePackage[perpage]{footmisc}
\RequirePackage{tikz}

% titleformat
\RequirePackage{titlesec,titletoc}
\RequirePackage{array}

% l10n here
\renewcommand{\ALG@name}{算法}
\renewcommand{\tablename}{表}
\renewcommand{\figurename}{图}
\renewcommand{\bibname}{\vskip -0.5em 参考文献}
\renewcommand\@biblabel[1]{{[#1]\hfill}}
\renewcommand\contentsname{目\quad 录}
\renewcommand\thefigure{% thanks to fitsir<at>gmail.com
     \ifnum \c@chapter>\z@\thechapter-\fi\@arabic\c@figure%
}
\renewcommand\thetable{%
    \ifnum \c@chapter >\z@ \thechapter-\fi \@arabic \c@table%
}
\renewcommand\theequation{%
    \ifnum \c@chapter >\z@ \thechapter-\fi \@arabic \c@equation%
}
\captionsetup{labelsep=quad}
\captionsetup[longtable]{labelsep=quad}

\newcommand{\thesis}{thesis}
\newcommand{\Master}{Master}

\ifxjtu@pdflinks
    \RequirePackage{hyperref}
    \ifxjtu@colorlinks
        \hypersetup{
            bookmarksnumbered=true,
            bookmarksopen=true,
            bookmarksopenlevel=1,
            breaklinks=true,
            colorlinks=true,
            linkcolor=blue,
            anchorcolor=blue,
            citecolor=green,
            plainpages=false,
            % pdfpagelabels, % comment this to reduce warning
            pdfborder=0 0 0,
        }
    \else
        \hypersetup{
            bookmarksnumbered=true,
            bookmarksopen=true,
            bookmarksopenlevel=1,
            breaklinks=true,
            colorlinks=false,
            plainpages=false,
            % pdfpagelabels, % comment this to reduce warning
            pdfborder=0 0 0,
        }
    \fi
    \urlstyle{same}
\fi

% Font-size
\RequirePackage{calc}
% Used code from THUthesis. Many thanks!
\newlength\thu@linespace
\newcommand{\thu@choosefont}[2]{%
  \setlength{\thu@linespace}{#2*\real{#1}}%
  \fontsize{#2}{\thu@linespace}\selectfont}
\def\thu@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \thu@choosefont{##1}{#2}}}
\thu@define@fontsize{chuhao}{42bp}
\thu@define@fontsize{xiaochu}{36bp}
\thu@define@fontsize{yihao}{26bp}
\thu@define@fontsize{xiaoyi}{24bp}
\thu@define@fontsize{erhao}{22bp}
\thu@define@fontsize{xiaoer}{18bp}
\thu@define@fontsize{sanhao}{16bp}
\thu@define@fontsize{xiaosan}{15bp}
\thu@define@fontsize{sihao}{14bp}
\thu@define@fontsize{banxiaosi}{13bp}
\thu@define@fontsize{xiaosi}{12bp}
\thu@define@fontsize{dawu}{11bp}
\thu@define@fontsize{wuhao}{10.5bp}
\thu@define@fontsize{xiaowu}{9bp}
\thu@define@fontsize{liuhao}{7.5bp}
\thu@define@fontsize{xiaoliu}{6.5bp}
\thu@define@fontsize{qihao}{5.5bp}
\thu@define@fontsize{bahao}{5bp}
\renewcommand\normalsize{%
   \@setfontsize\normalsize{12bp}{20bp}%
  \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=10bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip}
\DeclareCaptionFont{wuhao}{\wuhao}\captionsetup{font=wuhao,labelsep=quad} % thanks to @wanderxjtu
\DeclareCaptionFont{xiaowu}{\xiaowu}\captionsetup[subfloat]{font=xiaowu} % issue 4

% Subfloat
\captionsetup[subfloat]{labelformat=simple,captionskip=6bp,nearskip=6bp,farskip=0bp,topadjust=0bp}
\renewcommand{\thesubfigure}{(\alph{subfigure})} % referencing
\setlength{\floatsep}{5bp \@plus4pt \@minus1pt}
\setlength{\intextsep}{5bp \@plus4pt \@minus2pt}
\setlength{\textfloatsep}{5bp \@plus4pt \@minus2pt}

% Header & footer styles
\def\ps@thu@empty{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty}
\def\ps@thu@plain{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \def\@oddfoot{\hfil\wuhao\thepage\hfil}%
  \let\@evenfoot=\@oddfoot}

% Font-family
\ifxjtu@nofont\else
    \ifxjtu@truefont
      \setmainfont[Ligatures=TeX]{Times New Roman}
      \setCJKmainfont{SimSun}
      \setCJKfamilyfont{vert}[RawFeature={script=hani:language=CHN:vertical:+valt}]{SimSun}
          \def\CJKmovesymbol#1{\raise.35em\hbox{#1}}
          \def\CJKmove{\let\CJKsymbol\CJKmovesymbol \let\CJKpunctsymbol\CJKsymbol}
      \setCJKfamilyfont{hei}{SimHei}
    \else
      \setmainfont[Ligatures=TeX]{FreeSerif}
      \setCJKmainfont{文鼎ＰＬ简报宋}
      \setCJKfamilyfont{vert}[RawFeature={script=hani:language=CHN:vertical:+valt}]{文鼎ＰＬ简报宋}
          \def\CJKmovesymbol#1{\raise.35em\hbox{#1}}
          \def\CJKmove{\let\CJKsymbol\CJKmovesymbol \let\CJKpunctsymbol\CJKsymbol}
      \setCJKfamilyfont{hei}{SimHei}
    \fi
\fi

\def\thu@define@term#1{
\long\expandafter\gdef\csname #1\endcsname##1{% defines a macro like \ctitle#1: \def\xjtu@ctitle{#1}
    \long\expandafter\gdef\csname xjtu@#1\endcsname{##1}}
  \csname #1\endcsname{}} % the initial value is NULLSTR

% Table of contents, in English
\newcommand\engcontentsname{CONTENTS}
\newcommand\tableofengcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\engcontentsname
        \@mkboth{%
           \MakeUppercase\engcontentsname}{\MakeUppercase\engcontentsname}}%
    \@starttoc{toe}%
    \if@restonecol\twocolumn\fi
    }
\newcommand\addengcontents[2]{%
    \addcontentsline{toe}{#1}{\protect\numberline{\csname the#1\endcsname}#2}}
\newcommand\addengappendice[2]{%
    \addcontentsline{toe}{#1}{theappendix}#2}

\newcommand\echapter[1]{\addengcontents{chapter}{#1}}
\newcommand\esection[1]{\addengcontents{section}{#1}}
\newcommand\esubsection[1]{\addengcontents{subsection}{#1}}
\newcommand\esubsubsection[1]{} % do nothing
\newcommand\eappendix[1]{\addengappendice{#1}}

% Circled footnote number
% http://tex.stackexchange.com/questions/133264/circled-footnote-symbols-with-pifont-showing-arrows-instead-of-circled-numbers
\newcommand*\circled[1]{
    \tikz[baseline=(char.base)]
    \node[shape=circle,draw,inner sep=0.5pt,minimum size=8pt] (char) {#1};
}
\renewcommand\thefootnote{\protect\circled{\arabic{footnote}}}
\setlength{\footnotesep}{\baselineskip}
\renewcommand\@makefntext[1]{
    \setstretch{1.2}%
    \noindent\@thefnmark #1
}

\thu@define@term{type}

\ifxjtu@master
    \type{硕士}
\else
    \type{博士}
    \renewcommand{\thesis}{dissertation}
    \renewcommand{\Master}{Doctor}
\fi

% Interfaces, or commands
\newcommand\xjtucover{}
\newcommand\xjtuchead{}
\newcommand\xjtuehead{}
\newcommand\xjtucinfopage{}
\newcommand\xjtueinfopage{}
\newcommand\xjtucontent{}
\newcommand\xjtuendcontent{}
\newcommand\xjtutoc{
    \tableofcontents
    \ifxjtu@bachelor\else
        \noindent 声明
    \fi
    \chaptermark{目\quad 录}
}
\newcommand\xjtutoe{
    \tableofengcontents
    \noindent Declaration
}
\newcommand\xjtuspchapter[2]{
    \chapter*{#2}
    \chaptermark{#1}
    \addcontentsline{toc}{chapter}{#1}
}
\newcommand\xjtuincite[1]{ {%
    \citestyle{plain}%
    \cite{#1}%
    }%
}

% Interfaces, or terms
\thu@define@term{cauthor}
\thu@define@term{ctitle}
\thu@define@term{csupervisor}
\thu@define@term{cabstract}
\thu@define@term{ckeywords}
\thu@define@term{csubject}
\thu@define@term{cproddate}
\thu@define@term{ctype}

\thu@define@term{eauthor}
\thu@define@term{etitle}
\thu@define@term{ecate}
\thu@define@term{esupervisor}
\thu@define@term{eabstract}
\thu@define@term{ekeywords}
\thu@define@term{esubject}
\thu@define@term{eproddate}
\thu@define@term{etype}

\thu@define@term{zhongtufenlei}
\thu@define@term{UDC}
\thu@define@term{secrettype}
\thu@define@term{stunum}
\thu@define@term{degreetype}

\newcommand\xjtutype{\xjtu@type}

% Geometry specifications
% raggedbottom 令latex倾向于在页低添加空白，而不是拉伸段间距或列表前后间距、公式图片前后间距。按照工作手册，要求段间不空行。
% \parskip 0pt 也可以实现段间不空行，但是在无法填充页面时会导致列表前后、图片前后等位置被拉伸。
\raggedbottom
\topmargin=-1in % 消除页眉-边界距离初始值
\headheight=5.5mm % 该设定使得效果与官方doc模板相似
\textheight=242mm % 297-30-25
\footskip=7.5mm
\setlength\voffset{2cm} % 规范：页眉距边界2.0cm, one inch + \voffset + \topmargin = 2cm.
% 规范：上装订线边距3cm，即上边距到正文3cm。
% 需要 1 inch + \voffset + \topmargin + \headheight + \headsep = 3.0cm
\headsep= 4.5mm
\pagenumbering{Roman}
\xiaosi
\setlength{\parindent}{2em}

% Table of contents, style
\setcounter{secnumdepth}{3}

% Section titles, style
\titleformat{\chapter}[block]{\sanhao\centering}{}{1em}{}[]
\titlespacing{\chapter}{0em}{0\baselineskip}{1\baselineskip}
\titleformat{\section}[hang]{\xiaosan}{\thesection}{1em}{}
\titlespacing{\section}{0em}{1\baselineskip}{0.5\baselineskip}
\titleformat{\subsection}{\sihao}{\thesubsection}{1em}{}
\titlespacing{\subsection}{2em}{0.5\baselineskip}{0\baselineskip}
\titleformat{\subsubsection}{}{\arabic{subsubsection})~}{1em}{}
\titlespacing{\subsubsection}{2em}{0.2\baselineskip}{0\baselineskip}
\renewcommand{\l@chapter}{\@dottedtocline{1}{0em}{1.5em}}

\titlecontents{chapter}[0em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
\titlecontents{section}[1.5em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
\titlecontents{subsection}[3.8em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}

\let\oldfigure=\figure
\renewcommand\figure[1][]{
    \oldfigure[#1]
    \wuhao
}

\let\oldtable=\table
\renewcommand\table[1][]{
    \vskip0.5\baselineskip
    \oldtable[#1]
    \wuhao
    \renewcommand{\arraystretch}{1.5}
}

% algorithm/pseudocode
\renewcommand\thealgorithm{%
    \ifnum \c@chapter >\z@ \thechapter-\fi \@arabic \c@algorithm%
}
\newcommand\fs@ruled@notop{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@ruled
  %\def\@fs@pre{\hrule height.8pt depth0pt \kern2pt}% <----removed
  \def\@fs@pre{\vskip0.5\baselineskip}%
  \def\@fs@mid{\vskip1ex\kern2pt\hrule height1.5pt\kern2pt}%
  \def\@fs@post{\kern2pt\hrule height1.5pt\relax}%
  \let\@fs@iftopcapt\iftrue}
\renewcommand\fst@algorithm{\fs@ruled@notop}

% following codes are defining breakable pseudocode block.
% this solution cannot prevent pagebreak before the ending hline.
\newenvironment{breakablealgorithm}[1][\relex] %dismiss float placement specifier
  {% \begin{breakablealgorithm}
  {\par\baselineskip}%
     \refstepcounter{algorithm}% New algorithm
     \renewcommand{\caption}[2][\relax]{% Make a new \caption
       {\centerline{\wuhao \ALG@name~\thealgorithm\quad ##2}\par}%
       \ifx\relax##1\relax % #1 is \relax
         \addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##2}%
       \else % #1 is not \relax
         \addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##1}%
       \fi
       \vskip1ex\kern2pt\hrule height 1.5pt\kern2pt
     }
  }{% \end{breakablealgorithm}
    \kern2pt\hrule height 1.5pt\vskip0.5\baselineskip
  }
% end algorithm

\newcommand{\monthname}[1]{%
\ifcase#1
\or January%
\or February%
\or March%
\or April%
\or May%
\or June%
\or July%
\or August%
\or September%
\or October%
\or November%
\or December%
\fi}

% The denotation environment
\newenvironment{denotation}[2][4cm]{ % many thanks to THUthesis!
  \chapter*{#2}
  \addcontentsline{toc}{chapter}{#2}
  \chaptermark{#2}
  \noindent\begin{list}{}%
    {\vskip-30bp %\xiaosi[1.6]
     \renewcommand\makelabel[1]{##1\hfil}
     \setlength{\labelwidth}{#1} % 标签盒子宽度
     \setlength{\labelsep}{1cm} % 标签与列表文本距离
     \setlength{\itemindent}{1em} % 标签缩进量
     \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
     \setlength{\rightmargin}{0cm}
     \setlength{\parsep}{0cm} % 段落间距
     \setlength{\itemsep}{0cm} % 标签间距
    \setlength{\listparindent}{0cm} % 段落缩进量
    \setlength{\topsep}{0pt} % 标签与上文的间距
   }}{\end{list}}

\newcommand{\xjtuappendix}{
    \begin{appendix}
    \renewcommand{\thechapter}{附录\arabic{chapter}}
    \chaptermark{附录}
}
\newcommand{\xjtuendappendix}{\end{appendix}}
\newcommand{\xjtuappendixchapter}[1]{
    \stepcounter{chapter}
    \chapter*{\thechapter\quad#1}
    \addcontentsline{toc}{chapter}{\thechapter\quad #1}
}
\newcommand{\xjtuappendixsection}[1]{
    \stepcounter{section}
    \section*{#1}
    \addcontentsline{toc}{section}{\thesection\quad #1}
}
\newcommand{\xjtuappendixsubsection}[1]{
    \stepcounter{subsection}
    \subsection*{#1}
    \addcontentsline{toc}{subsection}{\thesubsection\quad #1}
}
\newcommand{\xjtuappendixsubsubsection}[1]{
    \stepcounter{subsubsection}
    \subsubsection*{#1}
    \addcontentsline{toc}{subsubsection}{\thesubsubsection\quad #1}
}
\newcommand{\xjtuappendixechapter}[1]{
    \echapter*{\thechapter\quad#1}
    \addcontentsline{toe}{chapter}{\thechapter\quad #1}
}
\newcommand{\xjtuappendixesection}[1]{
    \esection*{#1}
    \addcontentsline{toe}{section}{\thesection\quad #1}
}
\newcommand{\xjtuappendixesubsection}[1]{
    \esubsection*{#1}
    \addcontentsline{toe}{subsection}{\thesubsection\quad #1}
}
\newcommand{\xjtuappendixesubsubsection}[1]{
}

\let\oldtableofcontents=\tableofcontents
\def\tableofcontents{
    \oldtableofcontents
}

% The ``compact'' option eliminates the empty pages
\ifxjtu@compact
    \let\oldcleardoublepage=\cleardoublepage
    \def\cleardoublepage{
        \clearpage
    }
\fi



%uuku 自己的计数器定义
\newif\ifxjtu@special
\xjtu@specialfalse
\newcommand{\specialtrue}{\xjtu@specialtrue}
\newcommand{\specialfalse}{\xjtu@specialfalse}
\newif\ifxjtu@specialsection
\xjtu@specialsectionfalse
\newcommand{\specialsectiontrue}{\xjtu@specialsectiontrue}
\newcommand{\specialsectionfalse}{\xjtu@specialsectionfalse}
\newcounter{special}[part]
\renewcommand{\thespecial}{专题\zhnum{special}}
\counterwithin{chapter}{part}
\numberwithin{figure}{chapter}
\renewcommand{\thechapter}{第\zhnum{chapter}章}
\renewcommand{\thesection}{\arabic{chapter}\ifxjtu@special$\varepsilon$\fi.\arabic{section}\ifxjtu@specialsection$\varepsilon$\fi}
\renewcommand{\thesubsection}{\arabic{chapter}\ifxjtu@special$\varepsilon$\fi.\arabic{section}\ifxjtu@specialsection$\varepsilon$\fi.\arabic{subsection}}

%定理定义编号
\newcounter{mytheorem}[section]
\newcounter{mydef}[section]
\newcounter{myproblem}[section]

\renewcommand{\themydef}{\arabic{section}\ifxjtu@specialsection$\varepsilon$\fi.\arabic{mydef}}
\renewcommand{\themytheorem}{\arabic{section}\ifxjtu@specialsection$\varepsilon$\fi.\arabic{mytheorem}}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}

\newcommand{\specialchapter}[1]{
	\refstepcounter{special}
	\setcounter{section}{0}
	\chapter*{\thespecial \quad #1}
	\chaptermark{#1}
	\addcontentsline{toc}{chapter}{\thespecial \quad #1}
}

\newcommand{\specialsection}[1]{
	\stepcounter{section}
	\addtocounter{section}{-1}
	\section*{\quad #1}
	\sectionmark{#1}
	\addcontentsline{toc}{section}{\thesection \quad #1}
}

\newif\ifxjtu@practice
\xjtu@practicefalse
\newcommand{\practicetrue}{\xjtu@practicetrue}
\newcommand{\practicefalse}{\xjtu@practicefalse}



\ifxjtu@bachelor
    % LaTeX and MS word calculate line space differently.
    % Experiments shown that using \linespread{1.175} and \linespread{0.94}
    % will give the same result of using 1.5 and 1.2 line spacing, respectively.
    \ifxjtu@bigskip
      \linespread{1.175} \selectfont
    \else
      \linespread{0.94} \selectfont
    \fi

    \renewcommand\footnoterule{\vspace*{-3pt}% eggache!
        \hrule width 0.25\textwidth height 0.4pt
            \vspace*{2.6pt}}

    \fancypagestyle{plain}{%
      \fancyhf{}
      \fancyhead[CO]{\if@mainmatter\wuhao \ifxjtu@inmainbody\ifxjtu@special\thespecial\else\thechapter\fi\quad\fi \leftmark\fi}
      \fancyhead[CE]{\wuhao \ifxjtu@bachelor
      				uuku 的课程整理
                        \fi}
      \fancyhead[L]{\ifxjtu@inmainbody\hyperref[menu]{\bf Contents}\fi}
      \fancyfoot[OR,EL]{\xiaowu ~\thepage~}
      \renewcommand{\headrulewidth}{\if@mainmatter 0.5pt\else 0pt \fi}
      \renewcommand{\headrule}{\hrule \@height \headrulewidth \@width \headwidth \vskip .5pt
      \hrule \@height \headrulewidth \@width \headwidth \vskip -\headrulewidth}

    }
    \pagestyle{plain}

    \type{本科}
    \renewcommand\xjtucinfopage{
        %\chaptermark{摘\quad 要}
        \chaptermark{}
        \noindent {\bf
        题目： \xjtu@ctitle\\
        作者： \xjtu@cauthor\\
        }

		%\begin{center}
		%	\sanhao
		%	摘\quad 要
		%\end{center}


        \xjtu@cabstract

        \mbox{}

        {\wuhao \noindent
            {\bf 关键词}：
        \xjtu@ckeywords}
        \clearpage
    }
    \renewcommand\xjtueinfopage{
        \chaptermark{ABSTRACT}
        \noindent {\bf
        Title: \xjtu@etitle\\
        Name: \xjtu@eauthor\\
        Supervisor: \xjtu@esupervisor\\
        }

        \begin{center}
          \sanhao
          ABSTRACT
        \end{center}


        {
        \setlength{\parindent}{0em}
        \setlength{\parskip}{1em}
        \xjtu@eabstract
        }

        \mbox{ }

        {\wuhao\noindent
            {\bf KEY WORDS: }
            \xjtu@ekeywords
        }

        \clearpage
    }

    % booktabs parameters
    \setlength\cmidrulewidth {1.0pt}
    \setlength\lightrulewidth{1.0pt}
    \setlength\heavyrulewidth{1.5pt}




    \renewcommand\xjtucontent{
        \cleardoublepage

        \pagenumbering{arabic}
        \titleclass{\part}{top}
        \titleformat{\part}[block]{\bfseries\Huge\centering}{\Huge {Part}\ \thepart}{20pt}{}[]
        \titlespacing*{\part}{0pt}{50pt}{40pt}
        \titleformat{\chapter}[block]{\bfseries\sanhao\centering}{\ifxjtu@inmainbody\ifxjtu@special\thespecial\quad\else\thechapter\quad\fi\else\fi}{0em}{}[]
        \titleformat{\chapter}[block]{\bfseries\sanhao\centering}{\ifxjtu@inmainbody\ifxjtu@special\thespecial\quad\else\thechapter\quad\fi\else\fi}{0em}{}[]
		\titleformat{\section}[hang]{\centering\xiaosan}{}{0em}{\ifxjtu@practice 习题\quad\thesection\else\ifxjtu@inmainbody\S\ \thesection\quad\fi\fi }[\vskip -0.5em]
        \xjtu@inmainbodytrue
    }
    \renewcommand\xjtuendcontent{
        \newpage
        \titleformat{\chapter}[block]{\bfseries\sanhao}{}{0em}{\begin{center}}[\end{center}]
        \titleformat{\section}[hang]{\xiaosan}{}{0em}{\thesection\quad }[\vskip -0.5em]
        \titleformat{\subsection}{\sihao}{}{0em}{\vskip -1.5em \thesubsection\quad{}}
        \titleformat{\subsubsection}{}{}{0em}{\thesubsubsection\quad}[]
        \titlecontents{chapter}[0em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
        \titlecontents{section}[1.5em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
        \titlecontents{subsection}[3.8em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
        \titlespacing{\subsection}{0em}{0.5\baselineskip}{0\baselineskip}
        \titlespacing{\subsubsection}{0em}{0.2\baselineskip}{0\baselineskip}
        \xjtu@inmainbodyfalse
    }

    \newcommand{\xjtubib}[1]{ {
        \clearpage
        \phantomsection % http://www.tex.ac.uk/cgi-bin/texfaq2html?label=tocbibind
        \addcontentsline{toc}{chapter}{参考文献}

        \wuhao
        \bibliographystyle{gbt7714-2005-xjtu}
        \bibliography{#1}
        \clearpage
        } }

   \let\oldfootnote\footnote
   \renewcommand \footnote[1]{\oldfootnote{\xiaowu #1}}

    \renewcommand{\chaptermark}[1]{\markboth{#1}{}}
    \renewcommand{\sectionmark}[1]{\markright{#1}{}}
\else
\fi



\RequirePackage[shortlabels]{enumitem}
\setenumerate[1]{1),fullwidth,itemindent=\parindent,listparindent=\parindent,itemsep=0.05\baselineskip,partopsep=0pt,parsep=0ex,topsep=0.1\baselineskip}
\setenumerate[2]{\qquad(1),itemindent=\parindent,listparindent=\parindent,itemsep=0ex,partopsep=0pt,parsep=0ex,topsep=0\baselineskip}

%\makeatletter
%\renewcommand{\l@chapter}{\@dottedtocline{1}{0em}{1.5em}}
%\makeatother


\titlecontents{chapter}[0em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
\titlecontents{section}[1em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
\titlecontents{subsection}[2em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
