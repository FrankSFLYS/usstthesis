# 上海理工大学本科毕业设计(论文) LaTeX 模板

[![Apache License](https://img.shields.io/badge/LICENSE-Apache-orange.svg)]()  [![Version](https://img.shields.io/badge/version-2.997924-yellow.svg)]()

**作者：[MkSwQi](http://frank.xin)**

[download link]: https://www.lanzous.com/b0e7d3hgb "usstthesis-2.997924-含字体包.zip"

## 注意事项

学校并未规定使用（或不使用）LaTeX 进行论文写作，并且本模板中部分格式暂无法做到与学校给出的 Word 版本完全相同，所以使用本模板类造成（包括但不限于）论文审核不通过等问题作者不负责，请使用时慎酌（**定心丸**：作者已经使用此模板并且通过了毕业论文答辩，而且没有老师看出有任何格式方面的瑕疵）。

部分系统（如 Ubuntu 等）未附带宋体或 Times New Roman 字体，需要使用者自行下载安装。下载地址：[蓝奏云][download link]（字体包.zip），密码：`fnnv`。

文件中的 `resource/egf.png` 来自“上海理工大学本科毕业设计(论文)撰写规范及样本.docx”， `resource/usst-text-cnen.pdf` 来自“上海理工大学视觉校园视觉形象识别系统（VIS）”（访问地址：[校园视觉形象识别系统](http://www.usst.edu.cn/2018/0301/c199a21804/page.htm)），图片版权归上海理工大学所有。

## 目录

-   [上海理工大学本科毕业设计(论文) LaTeX
    模板](#上海理工大学本科毕业设计论文-latex-模板)
    -   [注意事项](#注意事项)
    -   [目录](#目录)
- [上海理工大学本科毕业设计(论文) LaTeX 模板](#上海理工大学本科毕业设计论文-latex-模板)
  - [注意事项](#注意事项)
  - [目录](#目录)
- [引言](#引言)
  - [Windows 平台](#windows-平台)
  - [Linux 平台](#linux-平台)
  - [Overleaf 在线平台](#overleaf-在线平台)
    - [下方内容适用于在 Overleaf 中无法搜索到模板的情况](#下方内容适用于在-overleaf-中无法搜索到模板的情况)
- [已知问题](#已知问题)
- [更多](#更多)
- [使用方法](#使用方法)

# 引言

使用本模板需要具有基本的 LaTeX 使用知识，如果需要，可以查阅 [一份（不太）简短的 LaTeX 2e 介绍](http://mirrors.ctan.org/info/lshort/chinese/lshort-zh-cn.pdf)，以及本模板的 [Github Wiki 页面](<https://github.com/FrankSFLYS/usstthesis/wiki>)（将会持续更新）。其实刚入门，对 LaTeX 了解不多的人也可以很好地使用它，网上也有很多中文资料和答疑，实在搜索不到的问题可以试着去 [LaTeX Stack Excange]([http://tex.stackexchange.com](http://tex.stackexchange.com/)) 搜索英文资源。

由于 LaTeX 编译时会生成很多附加文件，对于不了解的用户造成困扰，所以在 `.gitignore` 中将这些文件忽略了。对于项目中各文件的说明如下：

1. 本项目中最重要的文件就是 `usstthesis.cls`，`cls` 文件即“Class”，模板，如果你要从零开始创建自己的毕业论文项目文件夹，你可以将此文件复制到你的目录中，然后在 LaTeX 主文件（本项目的主文件是 `main.tex`）中使用 

   ```
   \documentclass{usstthesis}
   ```

   指定文档类；

2. 显然，所有的 `ttf` 字体文件一定要在根目录下，并且需要与 `usstthesis.cls` 中声明的文件名相同，否则编译不通过，由于包含了字体的项目压缩包下载较慢，你可以到[蓝奏云][download link]下载，密码 `fnnv`，如果系统中已经安装了对应字体的话，可以试着先编译一次，如果不报错或者显示正常，就无需下载字体包了；

3. `main.tex` 是毕业论文的 LaTeX 主文件，如果使用 TeXworks 等编辑器，请将编译引擎切换到 `XeLaTeX`，或在命令行中使用

   ```
   xelatex main.tex
   ```

   编译此文件，主文件中可以使用 `\include{}` 包含其他 `tex` 文件，具体用法可以参考 [USAGE.md](USAGE.md)。注意文件名和路径不能含有中文或者特殊符号等非 ASCII 字符，否则编译可能出错；

4. 所有的文件夹建议保留，将文档中的元素按照文件夹分类存放有利于查看和整理；

5. `main.pdf` 是编译生成的文件，项目中保留此文件是为了方便查看效果；

6. `字数统计.bat`、`字数统计.sh`、`生成空白项目.bat`、`生成空白项目.sh`、`清理辅助文件.bat`、`清理辅助文件.sh` 是可执行的脚本，`.bat` 和 `.sh` 对应不同平台，具体功能下面有介绍，你可以使用编辑器打开查看里面的内容；

7. `LICENSE` 是项目的开源协议说明，本项目使用 Apache 2.0 协议。

本项目提供了很多脚本，使用方法如下：

## Windows 平台

1. 使用 `git clone` 或者直接下载本项目之后，建议首先在你的电脑上试运行一下，首先解压项目文件，然后在目录中打开终端（不推荐使用 cmd，推荐 Windows Powershell，在文件夹中按住 `Shift` 并右键，然后点击“在此处打开 Powershell 窗口(`S`)”，即可打开 Windows Powershell 窗口，如果你已经正确安装和配置了 LaTeX（否则请搜索或查阅相关资料），在窗口中输入以下内容并且回车。

```powershell
xelatex main
```

2. 如果顺利编译并且生成了 `main.pdf`，证明你的环境没问题，可以进行第 4 步，否则请参阅第 3 步。

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

   说明缺失字体，你可以[下载字体包][download link]，密码 `fnnv`，将缺失的字体解压到项目文件夹中（不需要安装字体），再次编译即可，无需修改源文件。此处未提到的问题你也可以提交 issue。

4. 正确编译之后，就可以生成自己的毕业论文文件夹了，只需要在终端中输入

   ```powershell
   ./生成空白项目.bat
   ```

   就可以在项目文件夹中生成一个 `MyThesis` 的目录，你可以将其复制到你喜欢的地方，然后开始编写你的毕业论文。

5. 在 `MyThesis` 目录中有 `字数统计.bat`，在终端中输入 `./字数统计.bat`（或双击运行）可以统计正文字数（即不包括承诺书、摘要、ABSTRACT、引用、致谢等的字数），格式为

   ```
   SUMWEIGHTS: 0, 1
   121: File: chapter/chapter1.tex
   989: File: chapter/chapter2.tex
   955: File: chapter/chapter3.tex
   1339: File: chapter/chapter4.tex
   3404: Total
   ```

   上面的输出代表 `chapter1.tex` 中字数为 121、`chapter2.tex` 中字数为 989 …… 总字数为 3404。

## Linux 平台

1. 使用 `git clone` 或下载本项目之后解压到一个目录，然后在终端中进入目录文件夹，然后在终端中输入以下内容并回车，测试是否可以正确编译 LaTeX。

   ```shell
   xelatex main
   ```

2. 如果编译成功，说明可以正常使用，继续第 4 步，否则请看第 3 步。

3. 如果提示 `xelatex` 的命令不存在，可能是没有权限，也可能是没有正确设置 LaTeX 的环境变量，你可以搜索或查找文档进行解决，如果提示

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

   可能是因为没有相关字体，你可以[下载字体包][download link]，密码 `fnnv`，将缺失的字体解压到项目文件夹中（不需要安装字体），再次编译即可，无需修改源文件。此处未提到的问题你也可以提交 issue。

4. 正确编译之后就可以生成你自己的项目目录了，在终端中输入

   ```shell
   ./生成空白项目.sh
   ```

   会在当前文件夹中创建一个 `MyThesis` 的目录，将其整体复制到你喜欢的地方，就可以在 `MyThesis` 文件夹中编写你的毕业论文了。

5. 在 `MyThesis` 目录中终端输入 `./字数统计.sh` 可以统计正文字数（即不包括承诺书、摘要、ABSTRACT、引用、致谢等的字数），格式为

   ```
   SUMWEIGHTS: 0, 1
   121: File: chapter/chapter1.tex
   989: File: chapter/chapter2.tex
   955: File: chapter/chapter3.tex
   1339: File: chapter/chapter4.tex
   3404: Total
   ```

   代表 `chapter2.tex` 中有 989 字，一共有 3404 字。

## Overleaf 在线平台

[Overleaf](https://www.overleaf.com?r=cfb571e5&rm=d&rs=b) 是一个网页版的 LaTeX 编辑/编译平台，适合本地编译不方便的情况。使用前需要先注册账号，点击右上方的 Register 注册。

点击编辑界面左上角的右上箭头可以返回上一页，主界面中点击左下角的国旗图标可以切换语言，它也会自动推荐使用中文，点击上方的 “Click here to use Overleaf in Chinese” 即可切换。

在主界面（或个人项目列表）点击 `New Project`（创建新项目），点击列表最下方的 `View All`（预览所有），在 Templates 页面的搜索框中输入 usstthesis 后搜索，第一项 `usstthesis` 即为本项目的模板，打开后点击 `Open as Template`，等待打开即可。

其中，要编译的主文件 `main.tex` 一般只负责文件的引用和组织，主要的内容在 `chapter` 和 `element` 文件夹中的 `tex` 文件中编辑，内容编辑方面请参考[使用方法](USAGE.md)。

### 下方内容适用于在 Overleaf 中无法搜索到模板的情况
首先下载[含字体包的项目压缩文件][download link]，密码 `fnnv`，之后在 Overleaf 网页中点击 `New Project`（创建新项目），选择 `Upload Project`（上传项目），在弹出的窗口中拖入刚才下载的压缩文件，等待上传并处理完成后就会自动跳转到编辑界面。

此时注意在左上角的 `Menu（菜单）-> Compiler（编译器）` 中，选择 `XeLaTeX`，并且注意 `Main Document（主目录）` 选择 `main.tex`，之后点击界面中的 `Recompile（重新编译）`，如果不出意外的话就可以得到 PDF 文件了。

# 已知问题

1. 因为调整间距时产生了未知问题，最终的 section 无法与模板完全一致，但是差别较小可以忽略；
2. 使用 `subfigure` 时可能会出现无法编译的情况，请根据注释在 `usstthesis.cls` 中将 `RequirePackage{subfigure}` 相关行注释掉再编译；
3. 未进行极限情况的测试，例如目录超过 2 页、标题字数太多等情况，如果你在使用时出现了问题，可以提交 issue，我会在之后进行更新修复。

# 更多

关于文档的更多用法，可以查看 `main.tex` 及其附加内容，也可以在其之上修改，直接生成你的文档。本模板仅在 Windows 平台和 Linux 平台的 TeXLive 测试通过，其中，Linux 需要安装有 Times New Roman 字体集。编译时会报字体警告，暂时无法解决，可以忽略。

使用过程中有任何问题或者建议，欢迎提交 issue 或 Pull Request。

# 使用方法
使用方法请参见 [USAGE.md](USAGE.md)
