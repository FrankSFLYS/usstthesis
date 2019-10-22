
-   [使用方法](#使用方法)
-   [文档类提供的额外功能](#文档类提供的额外功能)
-   [文档结构](#文档结构)
-   [图片、表格和代码块](#图片表格和代码块)
    -   [图片](#图片)
    -   [表格](#表格)
    -   [代码](#代码)
-   [参考文献](#参考文献)
-   [致谢](#致谢)
-   [关于盲审和查重](#关于盲审和查重)

# 使用方法

​        在文档（本项目中为 `demo.tex`）的开头直接使用

```latex
\documentclass{usstthesis}
```

即可。使用 `xelatex thesis` 即可编译（为了正确生成交叉引用，可能需要编译 2~3 次），仅在 `xelatex` 下测试通过。如果是 TeXworks 等编辑器，需要手动将编译引擎切换至 `xelatex`。

常用的环境（图片、表格、代码块）都已经设置好了，一般无需使用 `\usepackage{}` 载入。阅读以下的内容了解详细的使用方法。

## 文档类提供的额外功能
​文档类提供了一些额外的宏和命令，可以有助于文档的写作，它们有：

|命令|功能|
|:---|:---|
|`\autoref{ref}`|汉化了 autoref 的文字，根据环境自动在引用中加入“表”、“图”等。常用的如 `表 \ref{table:xx}` 可以直接使用 `\autoref{table:xx}` 代替|
|`\chapref{ref}`|章引用，引用章时代替 `\autoref{}`，可以生成形如"第 2 章"的文字，无需使用 `第 \ref{chap:2} 章` 这样的繁琐表达|
|`\secref{ref}`   `\subsecref{ref}`|节引用、小节引用，用法与 `\chapref{}` 相同|
|`\dif` `\difx` `\dify`|公式环境中使用，分别用于生成直立的微分算子 $\mathrm{d}$、$\mathrm{d}x$、$\mathrm{d}y$（注意，微分算子不要直接使用 `dx`，否则其中的 d 会变成变量的斜体 $dx$，建议使用 `\mathrm{d}x` 或者 `\dif x`，可以得到 $\mathrm{d}x$，更加规范|
|`\tableCapSet` `\figureCapSet` `\codeCapSet`|分别用于调节表格、图、代码标题（caption）和其内容的距离，其中 `\codeCapSet` 已嵌入 `code` 环境，无需显式使用|
|`\includefrontmatter`|输出文档前序固定内容，下文有具体介绍|
# 文档结构

​根据“上海理工大学本科毕业设计(论文)撰写规范及样本”设计了相应的 LaTeX 版本，文档结构与样本中给出的类似，包括：

### 文档前序固定内容
> 封面 
> 承诺书
> 摘要
> 目录
### 正文以及后续内容
> 正文 
> 参考文献 
> 致谢 
> 附录 

​更详细的格式要求参见 demo.pdf。使用时，前序固定内容部分使用 `\includefrontmatter` 命令可以直接输出，无需另外编辑，后续内容像书写普通 LaTeX 文档一样，例如，一个完整的、包括各个内容的主文件 `demo.tex` 如下所示：

```latex
\documentclass{usstthesis}	% 使用 usstthesis 文档类

\usstthesisset{	% 使用此命令设置文档封面等内容
    session=2015,          % 2015 届
    title=中文题目，请勿添加换行符,   % 论文中文题目
    longtitle=中文长标题，仅用于\\ 标题页，支持强制换行,  % 论文长标题，仅用于标题页
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
% 注意，摘要和 ABSTRACT 的内容请在 ./element/abstract.tex 中
% 编辑

\mainmatter % 论文主体内容
\chapter{第一章}
\section{第一节}
\section{第一小节}

\backmatter % 论文附加部分
\begin{citelist}	% 参考文献
    % “机器学习”是在文中引用时使用的，例如 某某某使用了某某某方法\cite{机器学习}。代表引用此条目
    \bibitem{机器学习}刘琴.机器学习[J].武汉工程职业技术学院学报,2001,13(2):41-44.
\end{citelist}

\include{element/thanking} % 致谢

\end{document} % 文档结束
```

​其中，`citelist` 环境是封装了的 `thebibliography`，使用方法与 `thebibliography`相同，并且可以自动将“参考文献”添加到目录中。另外，为了主体结构清晰，将摘要和 ABSTRACT 放在了 `element/abstract.tex` 中，`abstract.tex`的内容如下。**请注意，不要在 `\abstractcn`、`\keywordscn`、`\abstracten` 和 `\keywordsen` 之前回车添加空行（可以使用注释符号 `%` 将空行注释掉），否则编译时会报 “No lines here to end” 错误。**

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

​同时也建议，在文档主体中不直接写内容，而是使用 `\include{<filename>}`命令（注意，不需要添加文件后缀 `.tex`），将文档按照章节分开每个文件，如果以后有不需要输出某些章的需求，可以在导言区使用 `\includeonly{<file1>,<file2>}` 使其只编译 file1 和 file2。例如：

``` latex
\include{chapter/chap1}
\include{chapter/chap2}
```

​其中，`chap*.tex` 中不应该包含 `\begin{document} ` 和 `\end{document}`，而应该直接写正文内容，例如：

```latex
% chapter/chap1.tex
\section{chap1}
\subsection{chap1-section1}
\par Paragraph.
```

​另外，实际使用时建议不要将章节命名为 `chapter1.tex` 等，而是按照其内容命名。

# 图片、表格和代码块

​本文档类提供了 `\figureCapSet` 和 `\tableCapSet`，用于调节 caption 和图片、表格的间距，其使用方法如下。

## 图片

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

## 表格

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

## 代码

​为了方便编译和视觉效果的统一，文档使用 `listings` 宏包插入代码。可以在导言区设置使用的语言，例如使用 C 语言：`\lstset{language=C}`，使用时也可以进行设置，具体用法请参考 `listings` 宏包文档 [listings.pdf](http://mirrors.ctan.org/macros/latex/contrib/listings/listings.pdf)。其基本使用方法如下：
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

# 参考文献

​文档使用默认的参考文献处理方式（使用了 `cite` 宏包），建议将参考文献的内容单独放在 `element/citation.tex` 中，在文中使用 `\include{element/citation}` 包含。参考文献的格式可以参考文件内容，主流的学术搜索网站可以直接生成参考文献内容，复制到 `citation.tex` 中的 `\bibitem{}` 条目中即可。

# 致谢

​致谢的内容请在 `element/thanking.tex` 中编辑，并且在正文中使用 `\include{element/thanking}` 导入。

# 关于盲审和查重

​盲审和查重时要求将正文以外的内容去掉，而且最好使用 docx 格式，所以你可以下载 [pandoc](<https://pandoc.org/installing.html>)，然后在主文件（此处是 `demo.tex` ）中搜索“盲审”，按要求将指定的行注释掉，然后在命令行中使用 `pandoc` ：

```powershell
pandoc -o outputfilename.docx -f latex -t docx demo.tex
```

即将 `demo.tex` 转换为 `outputfilename.docx` 的 doc 文件，虽然转换之后格式没了，但是所有文字都可复制（使用 pdf 可能会出现查重时乱码的情况）。

阅读 pandoc 的说明时发现，它可以指定一个 docx 文件作为模板，生成的文档将会使用指定文件的模板。因此可以将学校的模板作为模板直接生成，省去了很多调整格式的麻烦。例如要作为模板的文档存在当前目录，为 `ref.docx`，在命令行中使用

```powershell
pandoc --reference-doc ref.docx -o DocThesis.docx -f latex -t docx MyFinalThesis.tex
```

就可以直接生成指定模板的文件了，但是有一些格式还需要手动调整。（其实盲审和查重时对格式的要求没有那么高，只需要看起来类似就可以了，这是我的经验）。