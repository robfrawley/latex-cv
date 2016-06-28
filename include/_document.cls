
%-
%- This file is part of the `robfrawley/latex-resume` project.
%-
%- (c) Rob M Frawley 2nd <rmf@src.run>
%-
%- For the full copyright and license information, please view the LICENSE.md
%- file that was distributed with this source code.
%-

%-
%- CLASS DEFINITION
%-
\ProvidesClass{srcv}[2016/05/20 v1.0 SRC-RUN CV Class]

%-
%- INTERPRETER REQUIREMENTS
%-
\NeedsTeXFormat{LaTeX2e}

%-
%- DRAFT/FINAL OPTIONS
%-
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}

%-
%- USE ARTICLE CLASS AS BASE
%-
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

%-
%- EXTERNAL PKG REQUIREMENTS
%-
\RequirePackage{array}                  % Needed to make fixed length table
\RequirePackage{enumitem}               % Needed to handle list environment
\RequirePackage{ragged2e}               % Needed to handle text alignment
\RequirePackage{geometry}               % Needed to configure page layout
\RequirePackage{fancyhdr}               % Needed to make header & footer effeciently
\RequirePackage{xcolor}                 % Needed to manage colors
\RequirePackage{ifxetex}                % Needed to use \ifxetex-\else-\fi statement
\RequirePackage{xifthen}                % Needed to use \if-\then-\else statement
\RequirePackage{etoolbox}               % Needed to use a toolbox of programming tools
\RequirePackage{setspace}               % Needed to change line spacing in specific environment
\RequirePackage[quiet]{fontspec}        % Needed to manage fonts
\defaultfontfeatures{Ligatures=TeX}     % To support LaTeX quoting style
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}    % Needed to manage math fonts
\RequirePackage{FontAwesome}            % Needed to use icons from font-awesome (https://myInfoGithub.com/posquit0/latex-fontawesome)
\RequirePackage{parskip}                % Needed to deal a paragraphs
\RequirePackage[hidelinks]{hyperref}    % Needed to deal hyperlink

%-
%- SETUP HYPERLINK PKG
%-
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}


%-
%- FONT INCLUDE CONFIG
%-
\newcommand*{\fontDirFontAwesome}[1][external/font-font-awesome/]{\def\@fontDirFontAwesome{#1}}
\newcommand*{\fontDirRoboto}[1][external/font-roboto/]{\def\@fontDirRoboto{#1}}
\newcommand*{\fontDirSourceSansPro}[1][external/font-source-sans-pro/]{\def\@fontDirSourceSansPro{#1}}
\fontDirFontAwesome
\fontDirRoboto
\fontDirSourceSansPro

%-
%- PAGE GEOMETRY
%-
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}

%-
%- FANCY HEADER
%-
\fancyhfoffset{0em}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\pagestyle{fancy}


%-
%- BASIC COLOR DEFINITIONS
%-
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

%-
%- FONT COLOR DEFINITIONS
%-
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}

%-
%- Awesome colors
%-
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\colorlet{awesome}{awesome-red}

%-
%- ENABLE SECTION HIGHLIGHTS
%-
\newbool{boolSectionColorHighlight}
\setbool{boolSectionColorHighlight}{true}

%-
%- FONT COLOR DEFINITIONS
%-
\def\@sectioncolor{%
  \ifbool{boolSectionColorHighlight}{\color{awesome}}{}%
}
\def\@sectioncolorthree#1#2#3{%
  \ifbool{boolSectionColorHighlight}{{\color{awesome}#1#2#3}}{#1#2#3}%
}

%-
%- FONT DEFINITIONS
%-
\newfontfamily\fontFamilyHead[
  Path=\@fontDirRoboto,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}
\newfontfamily\fontFamilyHeadLight[
  Path=\@fontDirRoboto,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}
\newfontfamily\fontFamilyFoot[
  Path=\@fontDirSourceSansPro,
  UprightFont=*-Regular,
  ItalicFont=*-It,
  BoldFont=*-Bold
]{SourceSansPro}
\newfontfamily\fontFamilyBody[
  Path=\@fontDirSourceSansPro,
  UprightFont=*-Regular,
  ItalicFont=*-It,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldIt
]{SourceSansPro}
\newfontfamily\fontFamilyBodyLight[
  Path=\@fontDirSourceSansPro,
  UprightFont=*-Light,
  ItalicFont=*-LightIt,
  BoldFont=*-Semibold,
  BoldItalicFont=*-SemiboldIt
]{SourceSansPro}

%-
%- DEFUALT/MAIN FONT
%-
\setmainfont[
  Path=\@fontDirSourceSansPro,
  UprightFont=*-Regular,
  ItalicFont=*-It,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldIt
]{SourceSansPro}


%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\styleHeadFirstName}[1]{{\fontsize{34pt}{1em}\fontFamilyHeadLight\color{graytext} #1}}
\newcommand*{\styleHeadMiddleName}[1]{{\fontsize{34pt}{1em}\fontFamilyHeadLight\color{graytext} #1}}
\newcommand*{\styleHeadLastName}[1]{{\fontsize{34pt}{1em}\fontFamilyHead\bfseries\color{text} #1}}
\newcommand*{\styleHeadSuffix}[1]{{\fontsize{34pt}{1em}\fontFamilyHeadLight\color{graytext} #1}}
\newcommand*{\styleHeadPosition}[1]{{\fontsize{11pt}{1em}\fontFamilyBody\scshape\color{awesome} #1}}
\newcommand*{\styleHeadAddress}[1]{{\fontsize{9pt}{1em}\fontFamilyHead\itshape\color{lighttext} #1}}
\newcommand*{\styleSocial}[1]{{\fontsize{9pt}{1em}\fontFamilyHead\color{darktext} #1}}
\newcommand*{\styleQuote}[2]{{\fontsize{10pt}{1em}\fontFamilyBody\itshape\color{darktext} #1}{\fontsize{8pt}{1em}\fontFamilyBody\itshape\color{darktext} #2}}
\newcommand*{\styleFooter}[1]{{\fontsize{8pt}{1em}\fontFamilyFoot\scshape\color{lighttext} #1}}
\newcommand*{\styleSection}[1]{{\fontsize{14pt}{1em}\fontFamilyBody\bfseries\color{text}\@sectioncolorthree #1}}
\newcommand*{\styleSubSection}[1]{{\fontsize{11pt}{1em}\fontFamilyBody\scshape\textcolor{text}{#1}}}
\newcommand*{\styleParagraph}{\fontsize{9pt}{1em}\fontFamilyBodyLight\upshape\color{text}}

% For elements of entry
\newcommand*{\styleTitle}[1]{{\fontsize{9pt}{1em}\fontFamilyBody\bfseries\color{darktext} #1}}
\newcommand*{\stylePosition}[1]{{\fontsize{8pt}{1em}\fontFamilyBody\scshape\color{graytext} #1}}
\newcommand*{\styleDate}[1]{{\fontsize{8pt}{1em}\fontFamilyBodyLight\slshape\color{graytext} #1}}
\newcommand*{\styleLocation}[1]{{\fontsize{9pt}{1em}\fontFamilyBodyLight\slshape\color{awesome} #1}}
\newcommand*{\styleDescription}[1]{{\fontsize{8pt}{1.2em}\fontFamilyBodyLight\upshape\color{text} #1}}

% For elements of subentry
\newcommand*{\styleSubTitle}[1]{{\fontsize{8pt}{1em}\fontFamilyBody\mdseries\color{graytext} #1}}
\newcommand*{\styleSubPosition}[1]{{\fontsize{7pt}{1em}\fontFamilyBody\scshape\color{graytext} #1}}
\newcommand*{\styleSubDate}[1]{{\fontsize{7pt}{1em}\fontFamilyBodyLight\slshape\color{graytext} #1}}
\newcommand*{\styleSubLocation}[1]{{\fontsize{7pt}{1em}\fontFamilyBodyLight\slshape\color{awesome} #1}}
\newcommand*{\styleSubDescription}[1]{{\fontsize{8pt}{1em}\fontFamilyBodyLight\upshape\color{text} #1}}

% For elements of honor
\newcommand*{\honortitlestyle}[1]{{\fontsize{8pt}{1em}\fontFamilyBody\color{graytext} #1}}
\newcommand*{\honormyPositionstyle}[1]{{\fontsize{8pt}{1em}\fontFamilyBody\bfseries\color{darktext} #1}}
\newcommand*{\honordatestyle}[1]{{\fontsize{8pt}{1em}\fontFamilyBody\color{graytext} #1}}
\newcommand*{\honorlocationstyle}[1]{{\fontsize{8pt}{1em}\fontFamilyBodyLight\slshape\color{awesome} #1}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]{{\fontsize{8pt}{1em}\fontFamilyBody\bfseries\color{darktext} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{8pt}{1em}\fontFamilyBodyLight\color{text} #1}}

\newcommand*{\servicetypestyle}[1]{{\fontsize{8pt}{1em}\fontFamilyBody\bfseries\color{darktext} #1}}
\newcommand*{\servicesetstyle}[1]{{\fontsize{8pt}{1em}\fontFamilyBodyLight\color{text} #1}}

% For elements of the cover letter
\newcommand*{\letterstyleSection}[2]{{\fontsize{14pt}{1em}\fontFamilyBody\bfseries\color{text}\@sectioncolor #1 \color{darktext}#2}}
\newcommand*{\letterRecipientmyAddressstyle}[1]{{\fontsize{9pt}{1em}\fontFamilyBody\scshape\color{graytext} #1}}
\newcommand*{\letterRecipientTitlestyle}[2]{{\fontsize{10pt}{1em}\fontFamilyBody\bfseries\color{darktext} #1}{\fontsize{10pt}{1em}\fontFamilyBody\color{darktext},  #2}}
\newcommand*{\letterTitlestyle}[1]{{\fontsize{9pt}{1em}\fontFamilyBodyLight\bfseries\color{darktext} \underline{#1}}}
\newcommand*{\letterDateStyle}[1]{{\fontsize{9pt}{1em}\fontFamilyBodyLight\slshape\color{graytext} #1}}
\newcommand*{\lettertextstyle}{\fontsize{8pt}{1.4em}\fontFamilyBodyLight\upshape\color{graytext}}
\newcommand*{\letternamestyle}[1]{{\fontsize{9pt}{1em}\fontFamilyBody\bfseries\color{darktext} #1}}

%-
%- Knowledge Styles
%-

\newcommand*{\knowledgeTitleStyle}[1]{%
  {\fontsize{8pt}{1em}\fontFamilyBody\bfseries\color{darktext} #1}%
}

\newcommand*{\knowledgeEntryStyle}[1]{%
  {\fontsize{8pt}{1em}\fontFamilyBodyLight\color{text} #1}%
}

\newcommand*{\knowledgeExtraInfoStyle}[1]{%
  {\fontsize{6pt}{1em}\fontFamilyBodyLight\slshape\color{lightgray} #1}%
}

%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define writer's name
% Usage: \myName{<myFirstName>}{<myLastName>}
% Usage: \myFirstName{<myFirstName>}
% Usage: \myLastName{<myLastName>}
% Usage: \myFamilyName{<myFamilyName>}
\newcommand*{\myName}[4]{\def\@myFirstName{#1}\def\@myMiddleName{#2}\def\@myLastName{#3}\def\@mySuffix{#4}}
\newcommand*{\myFirstName}[1]{\def\@myFirstName{#1}}
\newcommand*{\myMiddleName}[1]{\def\@myMiddleName{#1}}
\newcommand*{\myLastName}[1]{\def\@myLastName{#1}}
\newcommand*{\mySuffix}[1]{\def\@mySuffix{#1}}
\newcommand*{\myFamilyName}[1]{\def\@myLastName{#1}}
\def\@myFamilyName{\@myLastName}

% Define writer's myAddress
% Usage: \myAddress{<myAddress>}
\newcommand*{\myAddress}[1]{\def\@myAddress{#1}}

% Define writer's myPosition
% Usage: \myName{<myPosition>}
\newcommand*{\myPosition}[1]{\def\@myPosition{#1}}

% Defines writer's myInfoMobile (optional)
% Usage: \myInfoMobile{<myInfoMobile number>}
\newcommand*{\myInfoMobile}[1]{\def\@myInfoMobile{#1}}

% Defines writer's myInfoEmail (optional)
% Usage: \myInfoEmail{<myInfoEmail adress>}
\newcommand*{\myInfoEmail}[1]{\def\@myInfoEmail{#1}}

% Defines writer's myInfoHomepage (optional)
% Usage: \myInfoHomepage{<url>}
\newcommand*{\myInfoHomepage}[1]{\def\@myInfoHomepage{#1}}

% Defines writer's myInfoGithub (optional)
% Usage: \myInfoGithub{<myInfoGithub-nick>}
\newcommand*{\myInfoGithub}[1]{\def\@myInfoGithub{#1}}

% Defines writer's myInfoGitlab (optional)
% Usage: \myInfoGitlab{<lab-nick>}
\newcommand*{\myInfoGitlab}[1]{\def\@myInfoGitlab{#1}}

% Defines writer's linked-in (optional)
% Usage: \myInfoLinkedIn{<linked-in-nick>}
\newcommand*{\myInfoLinkedIn}[1]{\def\@myInfoLinkedIn{#1}}

% Usage: \myInfoTwitter{<myInfoTwitter handle>}
\newcommand*{\myInfoTwitter}[1]{\def\@myInfoTwitter{#1}}

% Usage: \myInfoGPlus{<google plus handle>}
\newcommand*{\myInfoGPlus}[1]{\def\@myInfoGPlus{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[2]{\def\@quoteText{#1}\def\@quoteCite{#2}}
\newcommand*{\quoteText}[1]{\def\@quoteText{#1}}
\newcommand*{\quoteCite}[1]{\def\@quoteCite{#1}}

% Defines letterRecipient's information (cover letter only)
% Usage: \letterRecipient{<letterRecipient name>}{<letterRecipient myAddress>}
% Usage: \letterRecipientNameFull{<letterRecipient name>}
% Usage: \letterRecipientmyAddress{<letterRecipient myAddress>}
\newcommand*{\letterRecipient}[3]{\def\@letterRecipientNameFull{#1}\def\@letterRecipientTitle{#2}\def\@letterRecipientmyAddress{#3}}
\newcommand*{\letterRecipientNameFull}[1]{\def\@letterRecipientNameFull{#1}}
\newcommand*{\letterRecipientTitle}[1]{\def\@letterRecipientTitle{#1}}
\newcommand*{\letterRecipientmyAddress}[1]{\def\@letterRecipientmyAddress{#1}}

% Defines the date for letter (cover letter only)
% Usage: \letterDate{<date>}
\newcommand*{\letterDate}[1]{\def\@letterDate{#1}}

% Defines a message of opening for letter (cover letter only)
% Usage: \letterOpening{<message>}
\newcommand*{\letterOpening}[1]{\def\@letterOpening{#1}}

% Defines a message of closing for letter (cover letter only)
% Usage: \letterClosing{<message>}
\newcommand*{\letterClosing}[1]{\def\@letterClosing{#1}}


%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{2mm}
\newcommand{\acvHeaderAftermyPositionSkip}{4mm}
\newcommand{\acvHeaderAftermyAddressSkip}{1mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{7mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}

% Others
\newcommand{\acvSectionTopSkip}{3mm}
\newcommand{\acvSectionContentTopSkip}{2.5mm}


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \sectionHead
\newcommand*{\sectionHead}{%
  \begin{center}
    \styleHeadFirstName{\@myFirstName}%
    \ifthenelse{\isundefined{\@myMiddleName}}{}{\styleHeadMiddleName{{}\acvHeaderNameDelim\@myMiddleName}}%
    \styleHeadLastName{{}\acvHeaderNameDelim\@myLastName}%
    \ifthenelse{\isundefined{\@mySuffix}}{}{\styleHeadSuffix{{}\acvHeaderNameDelim\@mySuffix}}%
    \\[\acvHeaderAfterNameSkip]%
    \ifthenelse{\isundefined{\@myPosition}}{}{\styleHeadPosition{\@myPosition\\[\acvHeaderAftermyPositionSkip]}}%
    \ifthenelse{\isundefined{\@myAddress}}{}{\styleHeadAddress{\@myAddress\\[\acvHeaderAftermyAddressSkip]}}%
    \styleSocial{%
      \newbool{isstart}%
      \setbool{isstart}{true}%
      \ifthenelse{\isundefined{\@myInfoMobile}}%
        {}%
        {%
          \faPhone\acvHeaderIconSep\@myInfoMobile%
          \setbool{isstart}{false}%
        }%
      \ifthenelse{\isundefined{\@myInfoEmail}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{mailto:\@myInfoEmail}{\faEnvelope\acvHeaderIconSep\@myInfoEmail}%
        }%
      \ifthenelse{\isundefined{\@myInfoHomepage}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{http://\@myInfoHomepage}{\faHome\acvHeaderIconSep\@myInfoHomepage}%
        }%
      \ifthenelse{\isundefined{\@myInfoGPlus}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://google.com/\@myInfoGPlus}{\faGoogle\acvHeaderIconSep\@myInfoGPlus}%
        }%
      \ifthenelse{\isundefined{\@myInfoLinkedIn}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.myInfoLinkedIn.com/in/\@myInfoLinkedIn}{\faLinkedinSquare\acvHeaderIconSep\@myInfoLinkedIn}%
        }%
      \ifthenelse{\isundefined{\@myInfoTwitter}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://myInfoTwitter.com/\@myInfoTwitter}{\faTwitter\acvHeaderIconSep\@myInfoTwitter}%
        }%
      \ifthenelse{\isundefined{\@myInfoGithub}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://myInfoGithub.com/\@myInfoGithub}{\faGithubSquare\acvHeaderIconSep\@myInfoGithub}%
        }%
      \ifthenelse{\isundefined{\@myInfoGitlab}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://myInfoGitlab.com/u/\@myInfoGitlab}{\faGithubSquare\acvHeaderIconSep\@myInfoGitlab}%
        }%
    } \\[\acvHeaderAfterSocialSkip]%
    \ifthenelse{\isundefined{\@quoteText}}%
      {}%
      {\styleQuote{\@quoteText}{\ \@quoteCite\\}\vspace{\acvHeaderAfterQuoteSkip}}%
  \end{center}%
}

% Usage: \sectionHead
\newcommand*{\sectionHeadminimal}{%
  \begin{center}
    \styleHeadFirstName{\@myFirstName}%
    \ifthenelse{\isundefined{\@myMiddleName}}{}{\styleHeadMiddleName{{}\acvHeaderNameDelim\@myMiddleName}}%
    \styleHeadLastName{{}\acvHeaderNameDelim\@myLastName}%
    \ifthenelse{\isundefined{\@mySuffix}}{}{\styleHeadSuffix{{}\acvHeaderNameDelim\@mySuffix}}%
    \\[\acvHeaderAfterNameSkip]%
    \ifthenelse{\isundefined{\@myPosition}}{}{\styleHeadPosition{\@myPosition\\[\acvHeaderAftermyPositionSkip]}}%
    \vspace{\acvHeaderAfterQuoteSkip}%
    \vspace{\acvHeaderAfterQuoteSkip}%
    \vspace{\acvHeaderAfterQuoteSkip}%
  \end{center}%
}

%-
%- GENERIC SECTION
%-
\newcommand{\resumeSection}[1]{%
  \vspace{\acvSectionTopSkip}
  \styleSection{#1}
  \phantomsection
  \color{gray}\vhrulefill{0.65pt}
}

\newenvironment{listSection}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
}{%
  \end{center}
}

\newenvironment{listGroupSection}{%
  \vspace{-4.0mm}
  \begin{justify}
  \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
}{%
  \end{itemize}
  \end{justify}
  \vspace{-4.0mm}
}

\newcommand*{\listEntry}[5]{%
  \vspace{-2.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \ifempty{#2#3}
      {\stylePosition{#1} & \styleDate{#4} \\}
      {\styleTitle{#2} & \styleLocation{#3} \\
      \stylePosition{#1} & \styleDate{#4} \\}
    \multicolumn{2}{L{\textwidth}}{\styleDescription{#5}}
  \end{tabular*}%
}

\newcommand*{\listEducationEntry}[5]{%
  \vspace{-2.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \ifempty{#2#3}
      {\stylePosition{#1} & \styleDate{#4} \\}
      {\styleTitle{#2} & \styleLocation{#3} \\
      \stylePosition{#1} & \styleDate{#4} \\}
    \multicolumn{2}{L{\textwidth}}{\styleDescription{#5}}
  \end{tabular*}%
}

\newcommand*{\knowledgeEntry}[2]{%
  \knowledgeTitleStyle{#1} & \knowledgeEntryStyle{#2} \\
}

\newcommand*{\serviceEntry}[2]{%
  \servicetypestyle{#1} & \servicesetstyle{#2} \\
}

\newcommand*{\knowlegeExtra}[1]{%
  \knowledgeExtraInfoStyle{(#1)}
}

\newenvironment{sectionKnowledge}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth * \real{0.9}}}
}{%
    \end{tabular*}
  \end{center}
}

\newenvironment{serviceSection}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth * \real{2}}}
}{%
    \end{tabular*}
  \end{center}
}

% Define an entry of cv information
% Usage: \listEntry{<myPosition>}{<title>}{<location>}{<date>}{<description>}


%-
%- FOOTER
%-
\newcommand*{\sectionFootL}[1]{\def\@sectionFootL{#1}}
\newcommand*{\sectionFootC}[1]{\def\@sectionFootC{#1}}
\newcommand*{\sectionFootR}[1]{\def\@sectionFootR{#1}}
\newcommand*{\sectionFoot}{%
  \fancyfoot{}%
  \fancyfoot[L]{%
    \ifthenelse{\isundefined{\@sectionFootL}}%
      {\styleFooter{\today}}%
      {\styleFooter{\@sectionFootL}}%
  }%
  \fancyfoot[C]{%
    \styleFooter{\@myFirstName\space}%
    \ifthenelse{\isundefined{\@myMiddleName}}%
      {}%
      {\styleFooter{\@myMiddleName\space}}%
    \styleFooter{\@mySuffix\space}%
    \ifthenelse{\isundefined{\@suffixname}}
      {}%
      {\styleFooter{\@suffixname}}%
    \ifthenelse{\isundefined{\@sectionFootC}}%
      {}%
      {\ifthenelse{\equal{\@sectionFootC}{}}
        {}%
        {\styleFooter{~~~·~~~\@sectionFootC}}}%
  }%
  \fancyfoot[R]{%
    \ifthenelse{\isundefined{\@sectionFootR}}%
      {\styleFooter{\thepage}}%
      {\styleFooter{\@sectionFootR}}%
  }%
}

%-
%- LETTER
%-
\newenvironment{letterEnv}{%
  \lettertextstyle
}{%
}

\newcommand*{\letterTitle}{%
  \vspace{8.4mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \letterRecipientTitlestyle{\@letterRecipientNameFull}{\@letterRecipientTitle} & \letterDateStyle{\@letterDate}
  \end{tabular*}
  \begin{singlespace}
    \letterRecipientmyAddressstyle{\@letterRecipientmyAddress} \\
  \end{singlespace}
  \ifthenelse{\isundefined{\@letterTitle}}
    {}
    {\letterTitlestyle{\@letterTitle} \\}
  \lettertextstyle{\@letterOpening}
}

\newcommand{\letterSection}[2]{%
  \par\addvspace{2.5ex}
  \phantomsection{}
  \letterstyleSection{#1}{#2}
  \color{gray}\vhrulefill{0.9pt}
  \par\nobreak\addvspace{0.4ex}
}

\newcommand*{\letterEnd}{%
  \vspace{3.4mm}
  \lettertextstyle{\@letterClosing} \\
  \letternamestyle{\@myFirstName\ \@myMiddleName\ \@myLastName\ \@mySuffix}
}

% Define a section for CV
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{%
  \vspace{\acvSectionTopSkip}
  \styleSection{#1}
  \phantomsection
  \color{gray}\vhrulefill{0.9pt}
}

% Define a subsection for CV
% Usage: \cvsubsection{<subsection-title>}
\newcommand{\cvsubsection}[1]{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \styleSubSection{#1}
  \phantomsection
}

% Define a paragraph for CV
\newenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \styleParagraph
}{%
  \par
  \vspace{2mm}
}

% Define an environment for cventry
\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
}{%
  \end{center}
}
% Define an entry of cv information
% Usage: \cventry{<myPosition>}{<title>}{<location>}{<date>}{<description>}
\newcommand*{\cventry}[5]{%
  \vspace{-2.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \ifempty{#2#3}
      {\stylePosition{#1} & \styleDate{#4} \\}
      {\styleTitle{#2} & \styleLocation{#3} \\
      \stylePosition{#1} & \styleDate{#4} \\}
    \multicolumn{2}{L{\textwidth}}{\styleDescription{#5}}
  \end{tabular*}%
}

% Define an environment for cvsubentry
\newenvironment{cvsubentries}{%
  \begin{center}
}{%
  \end{center}
}
% Define a subentry of cv information
% Usage: \cvsubentry{<myPosition>}{<title>}{<date>}{<description>}
\newcommand*{\cvsubentry}[4]{%
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \setlength\leftskip{0.2cm}
    \styleSubTitle{#2} & \ifthenelse{\equal{#1}{}}
      {\styleSubDate{#3}}{}
    \ifthenelse{\equal{#1}{}}
      {}
      {\styleSubPosition{#1} & \styleSubDate{#3} \\}
    \ifthenelse{\equal{#4}{}}
      {}
      {\multicolumn{2}{L{17.0cm}}{\styleSubDescription{#4}} \\}
  \end{tabular*}
}

% Define an environment for cvhonor
\newenvironment{cvhonors}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2mm}
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}L{\textwidth - 3.50cm} R{2cm}}
}{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(honor, award or something else)
% Usage: \cvhonor{<myPosition>}{<title>}{<location>}{<date>}
\newcommand*{\cvhonor}[3]{%
  \honormyPositionstyle{#1}\ \honortitlestyle{#2} & \honorlocationstyle{#3} \\
}

% Define an environment for cvskill
\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth * \real{0.9}}}
}{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{%
  \skilltypestyle{#1} & \skillsetstyle{#2} \\
}

% Define an environment for cvservices
\newenvironment{cvservices}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}L{\textwidth - 1.60cm} R{1.60cm}}
}{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(service)
% Usage: \cvservice{<}{<skillset>}
\newcommand*{\cvservice}[3]{%
    \textbullet\ \ \honormyPositionstyle{#1}\ \honortitlestyle{#2} & \honorlocationstyle{#3} \\
}

% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{%
  \vspace{-4.0mm}
  \begin{justify}
  \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
}{%
  \end{itemize}
  \end{justify}
  \vspace{-4.0mm}
}


%-------------------------------------------------------------------------------
%                Commands for elements of Cover Letter
%-------------------------------------------------------------------------------
% Define an environment for cvletter
\newenvironment{cvletter}{%
  \lettertextstyle
}{%
}

% Define a section for the cover letter
% Usage: \lettersection{<section-title>}
\newcommand{\lettersection}[2]{%
  \par\addvspace{2.5ex}
  \phantomsection{}
  \letterstyleSection{#1}{#2}
  \color{gray}\vhrulefill{0.9pt}
  \par\nobreak\addvspace{0.4ex}
}



% Define a closing of the cover letter
% Usage: \makeletterClosing
\newcommand*{\makeletterClosing}{%
  \vspace{3.4mm}
  \lettertextstyle{\@letterClosing} \\
  \letternamestyle{\@myFirstName\ \@myMiddleName\ \@myLastName\ \@mySuffix}
  \ifthenelse{\isundefined{\@letterEnclosure}}
    {\\}
    {%
      \\\\
      \letterEnclosurestyle{\@letterEnclosureName: \@letterEnclosure}
    }
}

% EOF %
