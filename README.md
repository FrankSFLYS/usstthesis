# 上海理工大学本科毕业设计(论文) LaTeX 文档类

[![Apache License](https://img.shields.io/badge/LICENSE-Apache-orange.svg)]()  [![Version](https://img.shields.io/badge/version-2.99-yellow.svg)]()

**作者：[MkSwQi](http://frank.xin)**

[![Fork me on Gitee](https://gitee.com/MkSwQi/usstthesis/widgets/widget_6.svg)  ](https://gitee.com/MkSwQi/usstthesis) 

## 注意事项

​        学校并未规定使用（或不使用）LaTeX 进行论文写作，并且本文档类中部分格式暂无法做到与学校给出的 Word 版本完全相同，所以使用本模板类造成（包括但不限于）论文审核不通过等问题作者不负责，请使用时慎酌。**部分系统（如 Ubuntu 等）未附带宋体或 Times New Roman 字体，需要使用者自行下载安装**。

​        文件中的 `resource/egf.png` 和 `resource/usst-text.png` 来源于“上海理工大学本科毕业设计(论文)撰写规范及样本.docx”，图片版权归上海理工大学所有。

[TOC]

## 引言

​        使用本文档类需要具有基本的 LaTeX 使用知识，如果需要，可以查阅 [一份（不太）简短的 LaTeX 2e 介绍](http://mirrors.ctan.org/info/lshort/chinese/lshort-zh-cn.pdf)，以及本文档类的 [Github Wiki 页面](<https://github.com/FrankSFLYS/usstthesis/wiki>)（将会持续更新）。其实刚入门，对 LaTeX 了解不多的人也可以很好地使用它，网上也有很多中文资料和答疑，实在搜索不到的问题可以试着去 [LaTeX Stack Excange]([http://tex.stackexchange.com](http://tex.stackexchange.com/)) 搜索英文资源。

​        由于 LaTeX 编译时会生成很多附加文件，对于不了解的用户造成困扰，所以在 `gitignore` 中将这些文件忽略了，并且对于项目的说明如下：

1. 本项目中最重要的文件就是 `usstthesis.cls`，`cls` 文件即“Class”，文档类，如果你要从零开始创建自己的毕业论文项目文件夹，你可以将此文件复制到你的目录中，然后在 LaTeX 主文件中使用 

   ```
   \documentclass{usstthesis}
   ```

   指定文档类；

2. 显然，所有的 `ttf` 字体文件一定要有，并且需要与 `usstthesis.cls` 中声明的文件名相同，否则编译不通过；

3. `demo.tex` 是毕业论文的 LaTeX 主文件，使用

   ```
   xelatex demo.tex
   ```

   即编译此文件，它里面可以使用 `\include{}` 包含其他 `tex` 文件。当然你可以使用其他文件名，但是注意文件名和路径不能含有非 ASCII 字符，否则编译可能出错；

4. 所有的文件夹建议保留，将文档中的元素按照文件夹分类存放有利于查看和整理；

5. `demo.pdf` 即为编译生成的文件，项目中保留此文件是为了方便查看效果；

6. `c.bat`、`c.sh`、`Generate.bat`、`Generate.sh` 下面有介绍，你可以使用编辑器打开查看里面的内容；

7. `LICENSE` 是项目的协议文件。

​        本项目提供了很多脚本，使用方法如下：

### Windows 平台

1. 使用 `git clone` 或者直接下载本项目之后，建议首先在你的电脑上试运行一下，首先解压项目文件，然后在目录中打开终端（不推荐使用 cmd，推荐 Windows Powershell，在文件夹中按住 `Shift` 并右键，然后点击“在此处打开 Powershell 窗口(`S`)”，即可打开 Windows Powershell 窗口，如果你已经正确安装和配置了 LaTeX（否则请搜索或查阅相关资料），在窗口中输入以下内容并且回车。

```powershell
xelatex demo
```

2. 如果顺利编译并且生成了 `demo.pdf`，证明你的环境没问题，可以进行第 4 步，否则请参阅第 3 步。

3. 如果命令行窗口提示“xelatex 不是可用的命令”等，说明你没有正确配置环境变量，你需要将 LaTeX 的 bin 目录添加到环境变量的 path 中；如果 xelatex 正确运行但是报错了，则可以根据报错的内容查看错误来源，如果提示

   ```
   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   !
   ! fontspec error: "font-not-found"
   !
   ! The font "STSong" cannot be found.
   !
   ! See the fontspec documentation for further information.
   !
   ! For immediate help type H <return>.
   !...............................................
   ```

   说明缺失字体，你可以下载字体包，地址：[字体包-v2.997.zip](https://www.lanzous.com/b689722/)，密码 `24qa`，将缺失的字体解压到项目文件夹中，再次编译即可，文档类会自动搜索字体文件。此处未提到的问题你也可以提交 issue。

4. 正确编译之后，就可以生成自己的毕业论文文件夹了，只需要在终端中输入

   ```powershell
   ./Generate.bat
   ```

   就可以在项目目录中生成一个 `MyThesis` 的目录，你可以将其复制到你喜欢的地方，然后开始编写你的毕业论文。

5. 在 `MyThesis` 目录中有 `c.bat`，你可以在终端中直接输入 `./c.bat`（或双击运行）即可直接编译生成 `MyThesis.pdf`，并且在最后还会统计你的正文字数（即不包括承诺书、摘要、ABSTRACT、引用、致谢等的字数），格式为

   ```
   SUMWEIGHTS: 0, 1
   121: File: chapter/chapter1.tex
   989: File: chapter/chapter2.tex
   955: File: chapter/chapter3.tex
   1339: File: chapter/chapter4.tex
   3404: Total
   ```

   即代表 `chapter1.tex` 中字数为 121、`chapter2.tex` 中字数为 989，总字数为 3404。

### Linux 平台

1. 使用 `git clone` 或下载本项目之后解压到一个目录，然后在终端中进入目录文件夹，然后在终端中输入以下内容并回车，测试是否可以正确编译 LaTeX。

   ```shell
   xelatex demo
   ```

2. 如果编译成功，说明可以正常使用，继续第 4 步，否则请看第 3 步。

3. 如果提示 `xelatex` 的命令不存在，可能是缺少权限，也可能是没有正确设置 LaTeX 的环境变量，你可以搜索或查找文档进行解决，如果提示

   ```
   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   !
   ! fontspec error: "font-not-found"
   !
   ! The font "STSong" cannot be found.
   !
   ! See the fontspec documentation for further information.
   !
   ! For immediate help type H <return>.
   !...............................................
   ```

   可能是因为没有相关字体，你可以下载字体包，地址：[字体包-v2.997.zip](https://www.lanzous.com/b689722/)，密码 `24qa`，将缺失的字体解压到项目文件夹中，再次编译即可，文档类会自动搜索字体文件。此处未提到的问题你也可以提交 issue。

4. 正确编译之后就可以生成你自己的项目目录了，在终端中输入

   ```shell
   ./Generate.sh
   ```

   会在当前目录中创建一个 `MyThesis` 的文件夹，将其整体复制到你喜欢的地方，就可以在 `MyThesis` 文件夹中编写你的毕业论文了。

5. 在 `MyThesis` 目录中终端输入 `./c.sh` 可以一步编译生成 `MyThesis.pdf`，并且在最后输入文档的字数统计，字数仅包括正文字数（即不包括承诺书、摘要、ABSTRACT、引用、致谢等的字数），格式为

   ```
   SUMWEIGHTS: 0, 1
   121: File: chapter/chapter1.tex
   989: File: chapter/chapter2.tex
   955: File: chapter/chapter3.tex
   1339: File: chapter/chapter4.tex
   3404: Total
   ```

   代表 `chapter2.tex` 中有 989 字，一共有 3404 字。

### [Overleaf](https://www.overleaf.com/) 在线平台用法将会在之后推出

### 已知问题

1. 本文档类中所使用的华文中宋粗体、宋体粗体要比 Word 模板中的更粗；
2. 由于直接使用了加粗的字体文件，编译时可能出现很多字体的警告，这是由于本文档类的缺陷造成的，暂时无法解决，编译时请注意甄别；
3. 因为调整间距时产生了未知问题，导致 section 无法与模板完全一致；

### 更多

​        关于文档的更多用法，可以参阅 `demo.tex` 及其附加内容，也可以在其之上修改，直接生成你的文档。本文档类仅在 Windows 平台和 Linux 平台的 TeXLive 测试通过，其中，Linux 需要安装有 Times New Roman 字体集。

​        包附带的三种字体使用方法分别为：华文中宋加粗：`{\bZhongsong 华文中宋粗体}`，华文中宋正体：`{\Zhongsong 华文中宋}`，宋体加粗：`{\bSong 宋体粗体}`，楷体加粗：`{\bKai 楷体粗体}`。**注意：** 如果要加粗的字体中同时有中英文，还需要再加上 `\bfseries`，此时编译会报字体警告，可以忽略。

​        使用过程中有任何问题或者建议，欢迎在 Gitee 上提交 issue 或 Pull Request。

由于 Github 和 [frank.xin](https://www.frank.xin) 下载速度太慢，而且 Gitee 下载时需要注册，所以建议到蓝奏云下载，下载地址：[usstthesis-v2.99.zip](https://www.lanzous.com/b689722/)，密码：`24qa`。

## 使用方法

​        在文档（例如 `thesis.tex`）的开头直接使用

```latex
\documentclass{usstthesis}
```

即可。在命令行环境中使用 `xelatex thesis` 即可编译（为了正确生成交叉引用，可能需要编译 2~3 次），仅在 `xelatex` 下测试通过。

常用的环境（图片、表格、代码块）都已经设置好了，一般无需使用 `\usepackage{}` 载入。阅读以下的内容了解详细的使用方法。

### 文档类提供的额外功能
​        文档类提供了一些额外的宏和命令，可以有助于文档的写作，它们有：

```latex
\autoref{ref} - 汉化了 autoref 的文字，常用的形如"表 \ref{table:xx}"可以直接使用"\autoref{table:xx}"代替
\chapref{ref} - 章引用，引用章时代替 \autoref，可以生成形如"第 2 章"的文字。
\secref{ref} \subsecref{ref} - 分别对应 section 和 subsection，使用方法类似于 \chapref
\dif          - 公式环境中使用，用于生成微分算子 d
\tableCapSet \figureCapSet \codeCapSet - 用于调节表格、图、代码标题和其内容的距离，其中 \codeCapSet 已嵌入 code 环境，无需显式使用
\includefrontmatter - 输出文档前序固定内容，下文有具体介绍
```

## 文档结构

​        根据“上海理工大学本科毕业设计(论文)撰写规范及样本”设计了相应的 LaTeX 版本，文档结构与样本中给出的类似，包括：

1. 封面
2. 承诺书
3. 摘要
4. ABSTRACT
5. 目录
6. 正文部分
7. 参考文献
8. 致谢
9. 附录

​        更详细的格式要求参见 demo.pdf。使用时，1~5 部分使用 `\includefrontmatter` 命令可以直接输出，无需另外编辑，后续内容像书写普通 LaTeX 文档一样，例如，一个完整的、包括各个内容的 demo 如下所示：

```latex
\documentclass{usstthesis}	% 使用 usstthesis 文档类

\usstthesisset{	% 使用此命令设置文档封面等内容
    session=2015,          % 2015 届
    title=中文标题,         % 论文中文标题
    titleen=Englist Title  % 论文英文标题
    institute=学院,         % 学院
    major=专业,             % 专业
    name=名字,              % 姓名
    number=1234567,        % 学号
    mentor=指导教师,         % 指导教师
    date=2019年1月1日       % 完成日期
}

\begin{document} % 开始文档
\includefrontmatter % 输出 1~5 的内容
% 注意，摘要和 ABSTRACT 的内容请在 ./chapter/abstract.tex 中
% 编辑

\mainmatter % 论文主体内容
\chapter{第一章}
\section{第一节}
\section{第一小节}

\backmatter % 论文附加部分
\begin{citelist}	% 参考文献
    \bibitem{机器学习}刘琴.机器学习[J].武汉工程职业技术学院学报,2001,13(2):41-44.
\end{citelist}

\include{element/thanking} % 致谢

\end{document} % 文档结束
```

​        其中，`citelist` 环境是封装了的 `thebibliography`，使用方法与 `thebibliography`相同，并且可以自动将“参考文献”添加到目录中。另外，为了主体结构清晰，将摘要和 ABSTRACT 放在了 `chapter/abstract.tex` 中，`abstract.tex`的内容如下：

```latex
% 中文摘要
\abstractcn
\par 中文摘要内容。
% 中文摘要关键词
\keywordscn 关键词1\quad{}关键词2\quad{}关键词3

% 英文摘要
\abstracten
\par This is the abstract in English.
% 英文摘要关键词
\keywordsen Keywords 1\quad{}Keywords 2\quad{}Keywords 3
```

​        同时也建议，在文档主体中不直接写内容，而是使用 `\include{<filename>}`命令（注意，不需要添加文件后缀 `.tex`），将文档按照章节分开每个文件，如果以后有不需要输出某些章的需求，可以在导言区使用 `\includeonly{<file1>,<file2>}` 使其只编译 file1 和 file2。例如：

``` latex
\include{chapter/chap1}
\include{chapter/chap2}
```

​        其中，`chap*.tex` 中不应该包含 `\begin{document} ` 和 `\end{document}`，而应该直接写正文内容，例如：

```latex
% chapter/chap1.tex
\section{chap1}
\subsection{chap1-section1}
\par Paragraph.
```

​        另外，实际使用时建议不要将章节命名为 `chapter1.tex` 等，而是按照其内容命名。

## 图片、表格和代码块

​        本文档类提供了 `\figureCapSet` 和 `\tableCapSet`，用于调节 caption 和图片、表格的间距，其使用方法如下。

### 图片

```latex
% 插图
\begin{figure}[htb]
    \figureCapSet	% 调节图片环境的 caption 间距
    \centering
    \includegraphics[width=.8\linewidth]{figure/egf.png}
    \caption{信息传播模型} % 将 caption 放在 \includegraphics 下方，表示 caption 在图片下方
    \label{figure:model}
\end{figure}
```

### 表格

```latex
% 表格
\begin{table}[htb]
    \tableCapSet    % 调节表格环境的 caption 间距
    \caption{TSP 问题的计算量（计算速度：$10^8/$s）}
    % 将 caption 放在 tabular 上方，表示 caption 在表格上方
    \label{table:tsp calc}
    \centering
    \zihao{5}
    \begin{tabular}{c|c|c}
        \hlineB{3}  % 线宽为3倍的横线
        城市数目 $n$ & 计算量               & 计算时间                \\
        \hlineB{2}  % 线宽为2倍的横线
        10           & $1.8 \times 10^5$    & $1.8 \times 10^{-3}$ 秒 \\
        \hline
        15           & $4.4 \times 10^{10}$ & $7.3$ 小时              \\
        \hline
        20           & $6.0 \times 10^{16}$ & $19$ 年                 \\
        \hline
        25           & $3.1 \times 10^{23}$ & $1.0 \times 10^7$ 世纪  \\
        \hlineB{3}
    \end{tabular}
\end{table}
```

### 代码

​        为了方便编译和视觉效果的统一，文档使用 `listings` 宏包插入代码。可以在导言区设置使用的语言，例如使用 C 语言：`\lstset{language=C}`，使用时也可以进行设置，具体用法请参考 `listings` 宏包文档 [listings.pdf](http://mirrors.ctan.org/macros/latex/contrib/listings/listings.pdf)。其基本使用方法如下：
1. 行内代码，使用 `\lstinline|内容|`（注意在命令的前后插入空格，否则在中文环境中它会和文字连在一起），使用方法和 `\verbatim|内容|` 类似，两个竖线作为和普通文本的分界符，可以替换为其他字符，但是前后一定要相同，例如可以替换为 `\lstinline[内容[`；

2. 代码段，直接在文中插入时，使用 `code` 环境和 `lstlisting` 环境（`code` 环境可以避免 `lstlisting` 环境不闭合，而导致后面段落无首行缩进的问题），并且使用 `\captionof{lstlisting}{标题内容}` 插入标题，例如：

   ```latex
   \begin{code}
   \captionof{lstlisting}{main.h}
   \begin{lstlisting}
   int main(int argc, char* argv[]);
   \end{lstlisting}
   \end{code}
   ```

   会生成如下图所示的文档。

   ![main.h](./element/1550982750053.png)

3. 插入代码文件中的内容，使用 `\lstinputlisting[caption=标题名称]{文件名}` 命令，建议将代码源文件放在 `listing` 文件夹中。

## 参考文献

​        文档使用默认的参考文献处理方式（使用了 `cite` 宏包），建议将参考文献的内容单独放在 `element/citation.tex` 中，在文中使用 `\include{element/citation.tex}` 包含。参考文献的格式可以参考文件内容，主流的学术搜索网站可以直接生成参考文献内容，复制到 `citation.tex` 中的 `\bibitem{}` 条目中即可。

## 致谢

​        致谢的内容请在 `element/thanking.tex` 中编辑，并且在正文中使用 `\include{element/thanking.tex}` 导入。

## 关于盲审和查重

​        盲审和查重时要求将正文以外的内容去掉，而且最好使用 docx 格式，所以你可以下载 [pandoc](<https://pandoc.org/installing.html>)，然后在主文件（此处是 `demo.tex` ）中搜索“盲审”，按要求将指定的行注释掉，然后在命令行中使用 `pandoc` ：

```powershell
pandoc -o outputfilename.docx -f latex -t docx demo.tex
```

即将 `demo.tex` 转换为 `outputfilename.docx` 的 doc 文件，虽然转换之后格式没了，但是所有文字都可复制（使用 pdf 可能会出现查重时乱码的情况）。