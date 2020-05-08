%% This is file "usstthesis.cls".
%% !Mode:: "TeX:UTF-8"
%% -----------------------------
%% Author: frank.xin
%% This file is for USST undergraduated
%% thesis.
%% 上海理工大学毕业论文 LaTeX 2e 文档类
%% c = 299792458 m/s
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{usstthesis}
    [2019/01/01 v2.99792 USST Thesis class]
\typeout{USST Thesis}

\LoadClass[twoside, zihao=-4, openright]{ctexbook} % Based on ctexart, twosided

\RequirePackage{xcolor}
\colorlet{darkred}{red!15!black}  % 深红色

\RequirePackage{geometry}   % margin

\geometry{a4paper, top=2.5cm, bottom=2.5cm, inner=3cm, outer=2.5cm}

\RequirePackage{xkeyval}    % key-val sets

\define@cmdkeys{usstthesis}[usstthesis@]{session, title, longtitle, titleen, institute, major, name, number, mentor, date}[none]
\define@key{usstthesis}{session}[某]{\gdef\usstthesis@session{#1}}
\define@key{usstthesis}{title}[你还未设置论文短题目]{\gdef\usstthesis@title{#1}}
\define@key{usstthesis}{longtitle}[你还未设置论文长题目]{\gdef\usstthesis@longtitle{#1}}
\define@key{usstthesis}{titleen}[You have not yet set your English title]{\gdef\usstthesis@titleen{#1}}
\define@key{usstthesis}{institute}[你还未设置学院]{\gdef\usstthesis@institute{#1}}
\define@key{usstthesis}{major}[你还未设置专业]{\gdef\usstthesis@major{#1}}
\define@key{usstthesis}{name}[你的名字]{\gdef\usstthesis@name{#1}}
\define@key{usstthesis}{number}[0000000000]{\gdef\usstthesis@number{#1}}
\define@key{usstthesis}{mentor}[你的导师]{\gdef\usstthesis@mentor{#1}}
\define@key{usstthesis}{date}[2019年1月1日]{\gdef\usstthesis@date{#1}}
\setkeys{usstthesis}{
    session=某,   % 届
    title=你还未设置论文题目,   % 论文题目
    longtitle=请在设置中添加 longtitle 设置项\\ 设置长题目，支持强制折行,
    titleen=You have not yet set your English title,    %论文英文题目
    institute=你还没有设置你的学院名称, % 学院名称
    major=你还未设置专业,   % 专业名称
    name=你的名字,  % 姓名
    number=0000000000,  % 学号
    mentor=你的导师,    % 指导教师
    date=2019年1月1日   % 完成日期
}

\providecommand{\usstthesisset}[1]{\setkeys{usstthesis}{#1}}
\RequirePackage{xeCJK}
% \begingroup\newif\ifmy
% \IfFileExists{\jobname.txt}{}{\mytrue}
% \ifmy
% \begin{filecontents}{\jobname.txt}
%   Hello World
% \end{filecontents}
% \fi\endgroup
\IfFileExists{STZhongsong.ttf}{%
    \newCJKfontfamily\Zhongsong{STZhongsong.ttf}[AutoFakeBold=4] % 使用华文中宋 ttf 文件
    \newCJKfontfamily\ZhongsongNormal{STZhongsong.ttf}[AutoFakeBold=false] % 普通粗细的华文中宋
}{%
    \newCJKfontfamily\Zhongsong{STZhongsong}[AutoFakeBold=4] % 使用系统华文中宋
    \newCJKfontfamily\ZhongsongNormal{STZhongsong}[AutoFakeBold=false] % 普通粗细的华文中宋
}
\IfFileExists{STKaiti.ttf}{%
    \newCJKfontfamily\Kaiti{STKaiti.ttf}[AutoFakeBold=2]     % 使用华文楷体 ttf 文件
    \newfontfamily\bKaiA{STKaiti.ttf}[AutoFakeBold=2]        % 英文楷体
}{%
    \newCJKfontfamily\Kaiti{STKaiti}[AutoFakeBold=2]         % 使用系统华文楷体
    \newfontfamily\bKaiA{STKaiti}[AutoFakeBold=2]            % 英文楷体
}
\setmainfont{Times New Roman}                   % 英文字体
\IfFileExists{STSong.ttf}{%
    \setCJKmainfont[AutoFakeBold=2.6]{STSong.ttf} % 使用华文宋体 ttf 文件
}{%
    \setCJKmainfont[AutoFakeBold=2.6]{STSong}     % 使用系统华文宋体
}

\ctexset {
    contentsname = 目\quad 录,
    chapter = {
        number = \arabic{chapter},
        format = {\Zhongsong\bfseries\centering\zihao{3}},
        numberformat += \bfseries,
        pagestyle = fancy,
        fixskip = true,
        beforeskip = 49pt,
        afterskip = 35pt
    },
    section = {
        format = {\bfseries\zihao{4}},
        numberformat += \bfseries,
        aftername = \hspace{0.5em} ,
        beforeskip = 9pt,
        afterskip = 6pt,
    },
    subsection = {
        format = {\bfseries\zihao{-4}},
        numberformat += \bfseries,
        aftername = \hspace{0.5em} ,
        fixskip = true,
        beforeskip = 13pt,
        afterskip = 9pt,
    },
    subsubsection = {   % （非标准）小小节定义，可以根据需求自己修改
        format = {\bfseries\zihao{-4}},
        name = {,)},
        number = {\arabic{subsubsection}},
        numberformat += \bfseries,
        aftername = \hspace{0.5em},
        fixskip = true,
        beforeskip = 10pt,
        afterskip = 7pt,
    }
}

% issue:#1，遇到与 subfig、subfloat 宏包冲突时，请将下面两行中的 subfigure 注释掉
\RequirePackage{subfigure}
\RequirePackage[subfigure]{tocloft}    % 目录格式定制
%\renewcommand{\cftdot}{$\ldots$}    % 使用密集的小点
\renewcommand{\cfttoctitlefont}{\hfill\Zhongsong\bfseries\zihao{3}}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftdotsep}{0.1}      % 点间距
\setlength{\cftbeforechapskip}{6pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftsecindent}{1em}
\setlength{\cftsubsecindent}{2em}
\setlength{\cftsecnumwidth}{1em}
\setlength{\cftsubsecnumwidth}{2em}
\renewcommand{\cftchapfont}{\bfseries\zihao{-4}}
\renewcommand{\cftsecfont}{\zihao{-4}}
\renewcommand{\cftsubsecfont}{\zihao{-4}}
\renewcommand{\cftchapleader}{\bfseries\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand{\numberline}[1]{%
\settowidth\@tempdimb{#1\hspace{0.5em}}%
\ifdim\@tempdima<\@tempdimb%
  \@tempdima=\@tempdimb%
\fi%
\hb@xt@\@tempdima{\@cftbsnum #1\@cftasnum\hfil}\@cftasnumb}

\RequirePackage{fancyhdr}   % 页眉页脚
\fancyhf{}
\fancyhead[CO]{\zihao{-5}\usstthesis@title}
\fancyhead[CE]{\zihao{-5}上海理工大学本科毕业设计(论文)}
\fancyfoot[RO,LE]{\thepage}
\renewcommand{\headrulewidth}{0.8pt}    % 页眉线粗细
\setlength{\headheight}{16pt}   % 页眉线与顶端距离
\pagestyle{fancy}
\fancypagestyle{plain}{%
    \fancyhead{} %
    \fancyfoot[RO,LE]{\thepage} %
    \renewcommand{\headrulewidth}{0pt}  %
    \renewcommand{\footrulewidth}{0pt}  %
}

\setcounter{secnumdepth}{3}  % 编号的深度, 3 表示到 subsubsection
\setcounter{tocdepth}{2}     % 目录的深度，2 表示到 subsection

\RequirePackage{amsmath}    % \numberwithin{}{}
\numberwithin{equation}{chapter}    % 公式编号以 *.* 为格式
\numberwithin{table}{chapter}
\providecommand*{\dif}{\ensuremath{\mathop{}\!\mathrm{d}}} % 微分算子 d
\providecommand*{\difx}{\ensuremath{\dif x}} % dx
\providecommand*{\dify}{\ensuremath{\dif y}} % dy

\RequirePackage{tabularx}
\RequirePackage{booktabs}   % 三线表 \toprule \midrule \bottomrule
\RequirePackage{boldline}   % \hlineB{num} \clineB{c1-c2}{num}

\RequirePackage{caption}    % \captionsetup
\DeclareCaptionFont{wuhao}{\zihao{5}}
\captionsetup {
    labelsep=quad,
    font = {wuhao}
}

\providecommand{\tableCapSet}{  % 调节表格标题和上下文的间距
\setlength{\abovecaptionskip}{.1cm} %
\setlength{\belowcaptionskip}{0cm} %
}
\providecommand{\figureCapSet}{ % 调节图片标题和上下文的间距
\setlength{\abovecaptionskip}{.1cm} %
\setlength{\belowcaptionskip}{.1cm} %
}
\providecommand{\codeCapSet}{   % 调节代码环境标题和上下文的间距
\setlength{\abovecaptionskip}{.5cm} %
\setlength{\belowcaptionskip}{-.1cm} %
}

\RequirePackage{listings}   % 代码环境
\RequirePackage{newfloat}
\colorlet{codeblue}{blue!25!black}
\colorlet{codegreen}{green!10!black}
\colorlet{codered}{red!15!blue!50!black}
\colorlet{codeyellow}{yellow!15!blue!50!black}
\colorlet{codegray}{red!50!green!50!blue}
\colorlet{codemauve}{red!60!blue!40!black}
% \makeatletter
\lstdefinestyle{mystyle}{
  basicstyle=%
    \ttfamily%
    \lst@ifdisplaystyle\scriptsize\fi
}
% \makeatother
\lstset{ %
	backgroundcolor=\color{white},   % choose the background color
	style=mystyle,        % size of fonts used for the code
	columns=fullflexible,
	breaklines=true,                 % automatic line breaking only at 
	%whitespace
	captionpos=t,                    % sets the caption-position to bottom
	tabsize=4,
	commentstyle=\color{codegreen},    % comment style
	escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
    keywordstyle=\color{codeblue},       % keyword style
    keywordstyle=[2]\color{codered},
    keywordstyle=[3]\color{codeyellow},
	stringstyle=\color{codemauve}\ttfamily,     % string literal style
	frame=single,
	frameround=fttt,
	rulesepcolor=\color{red!20!green!20!blue!20},
	% identifierstyle=\color{red},
	keepspaces=true,
}
\renewcommand{\lstlistingname}{清单}    % 代码环境名称
\RequirePackage{graphicx}

\RequirePackage[super]{cite}
%\setcitestyle{open={\citeleft},close={\citeright}}
\renewcommand\citeform[1]{[#1]}

\RequirePackage[
    colorlinks,
    linkcolor=black,
    citecolor=black]{hyperref}

\def\equationautorefname{式}
\def\footnoteautorefname{注}
\def\itemautorefname{项}
\def\figureautorefname{图}
\def\tableautorefname{表}
\def\partautorefname{篇}
\def\appendixautorefname{附录}
\def\chapterautorefname{章}
\def\sectionautorefname{节}
\def\subsectionautorefname{小小节}
\def\paragraphautorefname{段落}
\def\subparagraphautorefname{子段落}
\def\FancyVerbLineautorefname{行}
\def\theoremautorefname{定理}
\providecommand*{\chapref}[1]{\hyperref[{#1}]{第 \ref*{#1} 章}}
\providecommand*{\secref}[1]{\hyperref[{#1}]{第 \ref*{#1} 节}}
\providecommand*{\subsecref}[1]{\hyperref[{#1}]{第 \ref*{#1} 小节}}

\RequirePackage{enumitem}
\setlist[enumerate,itemize,description]{noitemsep}
\setlist[enumerate,itemize,description,2]{leftmargin=10pt,nosep}

\renewcommand{\labelenumi}{(\theenumi)}
\renewcommand{\theenumii}{\arabic{enumii}}
\renewcommand{\labelenumii}{\theenumii)}

\newenvironment{citelist}{% 参考文献
    \begin{thebibliography}{99}%
    \addcontentsline{toc}{chapter}{参考文献}%
    \phantomsection %
    \zihao{5} %
    \setlength{\itemsep}{0pt} %
    }{%
    \end{thebibliography}%
}

\newenvironment{code}{\codeCapSet}{}

\RequirePackage[absolute]{textpos}  % textblock
\RequirePackage{setspace}   % parbox
\RequirePackage{array}      % tabular
\RequirePackage{etoolbox}   % \patchcmd{}{}{}
\RequirePackage{afterpage}  % \afterpage

\providecommand{\abstractcn}{
    \cleardoublepage
    %\gobbletocpage %
    \addtocontents{toc}{\cftpagenumbersoff{chapter}}
    \chapter{摘\quad{}要}
    \thispagestyle{empty}
    %\restoretocpage %
}
\providecommand{\keywordscn}{
    \afterpage{\thispagestyle{empty}}
    \\\\\noindent{\bfseries 关键词：}
}
\providecommand{\abstracten}{
    \cleardoublepage 
    %\gobbletocpage %
    \chapter{ABSTRACT} 
    \thispagestyle{empty} 
    \addtocontents{toc}{\cftpagenumberson{chapter}}
    %\restoretocpage %
}
\providecommand{\keywordsen}{
    \afterpage{\thispagestyle{empty}}
    \\\\\noindent{\bfseries KEY WORDS: }
}
\providecommand{\includefrontmatter}{
\setlength{\TPHorizModule}{1cm}  % textblock horiz length reference
\setlength{\TPVertModule}{1cm}   % textblock verti length reference
\frontmatter
\thispagestyle{empty}
\begin{titlepage}
\makeatletter
\noindent\hspace{0.3cm}\includegraphics[width=6.4cm]{element/usst-text-cnen.pdf}%
\\[2cm]
\begin{center}
    {\bfseries\Kaiti\fontsize{33}{35}\selectfont 本科毕业设计(论文)} \\[0.19cm]
    {\bfseries FINAL PROJECT/THESIS OF UNDERGRADUATE}   \\[0.9ex]
    {\bfseries\bKaiA\zihao{3} (\usstthesis@session}{\bfseries\Kaiti\zihao{3} 届}{\bfseries\Kaiti\zihao{3} )}   \\
    \rule{0em}{15.4ex} \\
    \parbox{13.2cm}{\centering\bfseries\Zhongsong\zihao{2}\usstthesis@longtitle}  \\
    \rule{0em}{7.2ex} \\
    \parbox{13.2cm}{\centering\bfseries\zihao{-2}\usstthesis@titleen}
    \begin{textblock}{13.2}(3.8,18.5)
        \bfseries\Kaiti\zihao{4}
        \renewcommand\arraystretch{1.3}
        \begin{tabular}{>{\centering\arraybackslash}p{3.8cm}>{\centering\arraybackslash\ZhongsongNormal}p{7.5cm}}
        学\hspace{2\ccwd}院 & \usstthesis@institute \\ \clineB{2-2}{2}
        专\hspace{2\ccwd}业 & \usstthesis@major     \\ \clineB{2-2}{2}
        学生姓名            & \usstthesis@name      \\ \clineB{2-2}{2}
        学\hspace{2\ccwd}号 & \usstthesis@number    \\ \clineB{2-2}{2}
        指导教师            & \usstthesis@mentor    \\ \clineB{2-2}{2}
        完成日期            &  \usstthesis@date     \\ \clineB{2-2}{2}
        \end{tabular}
    \end{textblock}
\end{center}
\makeatother
\end{titlepage}
\thispagestyle{empty}
%\afterpage{thispagestyle{empty}}
\cleardoublepage
\setcounter{page}{1}
\chapter*{承诺书}
\thispagestyle{empty}
\makeatletter
本人郑重承诺：所呈交的毕业论文“\usstthesis@title ”是在导师的指导下，严格按照学校和学院的有关规定由本人独立完成。文中所引用的观点和参考资料均已标注并加以注释。论文研究过程中不存在抄袭他人研究成果和伪造相关数据等行为。如若出现任何侵犯他人知识产权等问题，本人愿意承担相关法律责任。
\makeatother
\\ \rule{0em}{20ex}
\begin{flushright}
    \renewcommand\arraystretch{1.0}
    \begin{tabularx}{9.5cm}{*{2}{>{\raggedleft\arraybackslash}X}}
        承诺人(签名)： &    \\  \cline{2-2}
        & \\
        日期： & 年 \hspace{1\ccwd} 月 \hspace{1\ccwd} 日 \\
    \end{tabularx}
\end{flushright}
\afterpage{\thispagestyle{empty}}
\input{element/abstract.tex}

\cleardoublepage
\pagenumbering{roman}
\tocloftpagestyle{plain}
\tableofcontents
\thispagestyle{plain}
\afterpage{\thispagestyle{plain}}
\cleardoublepage
}

\endinput
