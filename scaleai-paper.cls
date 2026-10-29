\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scaleai-paper}[2026/05/13 Scale AI paper template]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Core layout and typography.
\RequirePackage[
  top=1.0in,
  bottom=1.0in,
  left=0.82in,
  right=0.82in,
  headheight=20pt,
  headsep=0.34in
]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{mathpazo}
\RequirePackage[scaled=0.92]{helvet}
\RequirePackage{microtype}
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{ragged2e}
\RequirePackage{authblk}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{caption}
\RequirePackage{enumitem}
\RequirePackage[most]{tcolorbox}

% Scale Labs data visualization palette. These xcolor tokens match the
% Scale Labs data-viz palette and are intended for charts, diagrams, tables,
% and semantic emphasis, not for modifying the original logo assets.
\definecolor{scaleBlack}{HTML}{000000}
\definecolor{scaleWhite}{HTML}{FFFFFF}
\definecolor{scaleInk}{HTML}{2E2E2E}
\definecolor{scaleDarkGray}{HTML}{2E2E2E}
\definecolor{scaleGray}{HTML}{7D7D7D}
\definecolor{scaleMediumGray}{HTML}{C7C7C7}
\definecolor{scaleLightGray}{HTML}{EAEAEA}
\definecolor{scalePanel}{HTML}{F7F7F7}
\definecolor{scaleLink}{HTML}{598DD2}

% Categorical data-viz sequence.
\definecolor{scaleTerracotta}{HTML}{E27553}
\definecolor{scaleTeal}{HTML}{65C2B9}
\definecolor{scaleBlue}{HTML}{598DD2}
\definecolor{scaleGold}{HTML}{D1B745}
\definecolor{scalePurple}{HTML}{A37CAD}
\definecolor{scalePink}{HTML}{E072AF}

% Additional vivid colors.
\definecolor{scaleAmber}{HTML}{E09A3B}
\definecolor{scaleSky}{HTML}{6FCBEF}
\definecolor{scaleGreen}{HTML}{79C96E}
\definecolor{scalePeriwinkle}{HTML}{8D86E8}
\definecolor{scaleCoral}{HTML}{D95358}
\definecolor{scaleSalmon}{HTML}{E39CAB}
\definecolor{scaleYellow}{HTML}{EDE272}

% Muted colors.
\definecolor{scaleTan}{HTML}{BD836F}
\definecolor{scaleOlive}{HTML}{A69E66}
\definecolor{scaleForest}{HTML}{62A16E}
\definecolor{scaleSlate}{HTML}{75A4B5}
\definecolor{scaleMauveDark}{HTML}{817EAD}
\definecolor{scaleDustyRose}{HTML}{D97D7C}

% Pastel colors.
\definecolor{scalePeach}{HTML}{EDCCA3}
\definecolor{scaleSand}{HTML}{C7A678}
\definecolor{scaleSage}{HTML}{9AB896}
\definecolor{scalePowderBlue}{HTML}{8FB6EB}
\definecolor{scaleMauve}{HTML}{D1B4C6}
\definecolor{scaleLavender}{HTML}{DDB5EB}

% Semantic state aliases.
\definecolor{scalePositive}{HTML}{79C96E}
\definecolor{scaleNeutral}{HTML}{EDE272}
\definecolor{scaleNegative}{HTML}{D95358}

% Common 82% color-over-white tints, matching the plotting helper's fill colors.
\colorlet{scaleTerracottaFill}{scaleTerracotta!82!white}
\colorlet{scaleTealFill}{scaleTeal!82!white}
\colorlet{scaleBlueFill}{scaleBlue!82!white}
\colorlet{scaleGoldFill}{scaleGold!82!white}
\colorlet{scalePurpleFill}{scalePurple!82!white}
\colorlet{scalePinkFill}{scalePink!82!white}
\colorlet{scaleTanFill}{scaleTan!82!white}
\colorlet{scaleSlateFill}{scaleSlate!82!white}

% Backward-compatible aliases used by older Scale templates.
\colorlet{scaleEvergreen}{scaleTerracotta}
\colorlet{scaleEvergreenLine}{scaleTerracotta}
\colorlet{scaleEvergreenFill}{scaleTerracottaFill}
\colorlet{scaleAtlas}{scaleTeal}
\colorlet{scaleAtlasLine}{scaleTeal}
\colorlet{scaleAtlasFill}{scaleTealFill}
\colorlet{scaleTanLine}{scaleTan}
\colorlet{scalePurpleLine}{scalePurple}
\colorlet{scaleSlateLine}{scaleSlate}

\newcommand{\ScaleAILogoPath}{assets/logo_horizontal.png}
\newcommand{\ScaleAIPartnerLogoPath}{}
\newcommand{\ScaleAIHeaderLogoHeight}{0.18in}
\newcommand{\ScaleAIPartnerLogoHeight}{0.28in}
\newcommand{\ScaleAIPaperType}{Scale AI Research}
\newcommand{\ScaleAIContact}{}
\newcommand{\scaleailogopath}[1]{\renewcommand{\ScaleAILogoPath}{#1}}
\newcommand{\partnerlogopath}[1]{\renewcommand{\ScaleAIPartnerLogoPath}{#1}}
\newcommand{\headerlogoheight}[1]{\renewcommand{\ScaleAIHeaderLogoHeight}{#1}}
\newcommand{\partnerlogoheight}[1]{\renewcommand{\ScaleAIPartnerLogoHeight}{#1}}
\newcommand{\papertype}[1]{\renewcommand{\ScaleAIPaperType}{#1}}
\newcommand{\contact}[1]{\renewcommand{\ScaleAIContact}{#1}}
\newcommand{\placeholder}[1]{\textcolor{scaleGray}{\textit{#1}}}

\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt}
\setlength{\emergencystretch}{2em}
\linespread{1.03}

\pagestyle{fancy}
\fancyhf{}
% \fancyhead[L]{\includegraphics[height=\ScaleAIHeaderLogoHeight]{\ScaleAILogoPath}}
\fancyhead[R]{\footnotesize\textcolor{scaleGray}{}}
\fancyfoot[C]{\footnotesize\textcolor{scaleGray}{\thepage}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyfoot[C]{\footnotesize\textcolor{scaleGray}{\thepage}}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

\renewcommand\Authfont{\normalsize\bfseries}
\renewcommand\Affilfont{\footnotesize\mdseries\color{scaleGray}}
\renewcommand\Authands{, }

\makeatletter
\newif\ifscaleai@firstauthor
\newif\ifscaleai@firstaffil
\scaleai@firstauthortrue
\scaleai@firstaffiltrue
\newcommand{\scaleai@authors}{}
\newcommand{\scaleai@affiliations}{}
\newcommand{\scaleai@titlelogos}{%
  \includegraphics[height=0.28in]{\ScaleAILogoPath}%
  \ifx\ScaleAIPartnerLogoPath\@empty
  \else
    \hspace{1.0em}%
    {\color{scaleMediumGray}\vrule width 0.35pt height 0.28in depth 0pt}%
    \hspace{1.0em}%
    \includegraphics[height=\ScaleAIPartnerLogoHeight]{\ScaleAIPartnerLogoPath}%
  \fi
}
\newcommand{\scaleai@superscript}[1]{%
  \edef\scaleai@temp{\detokenize{#1}}%
  \ifx\scaleai@temp\@empty
  \else
    \textsuperscript{\normalfont #1}%
  \fi
}
\renewcommand{\author}[2][]{%
  \ifscaleai@firstauthor
    \gdef\scaleai@authors{#2\scaleai@superscript{#1}}%
    \global\scaleai@firstauthorfalse
  \else
    \g@addto@macro\scaleai@authors{, #2\scaleai@superscript{#1}}%
  \fi
}
\renewcommand{\affil}[2][]{%
  \ifscaleai@firstaffil
    \gdef\scaleai@affiliations{\scaleai@superscript{#1}#2}%
    \global\scaleai@firstaffilfalse
  \else
    \g@addto@macro\scaleai@affiliations{, \scaleai@superscript{#1}#2}%
  \fi
}

\renewcommand{\maketitle}{%
  \thispagestyle{plain}%
  \vspace*{-0.35in}%
  \begin{flushleft}
    \scaleai@titlelogos\par
    \vspace{1.0em}
    {\bfseries\fontsize{25}{30}\selectfont\color{scaleBlack}\@title\par}
    \vspace{0.85em}
    {\Authfont\scaleai@authors\par}
    \ifx\scaleai@affiliations\@empty
    \else
      \vspace{0.22em}
      {\noindent\Affilfont\scaleai@affiliations\par}
    \fi
    \ifx\ScaleAIContact\@empty
    \else
      \vspace{0.35em}
      {\small\color{scaleGray}\ScaleAIContact\par}
    \fi
  \end{flushleft}
  \vspace{0.75em}
}
\makeatother

\renewenvironment{abstract}{%
  \vspace{0.6em}
  \begin{tcolorbox}[
    enhanced,
    breakable,
    colback=scaleLightGray!34!white,
    colframe=scaleMediumGray!70!white,
    boxrule=0.55pt,
    arc=3pt,
    left=9pt,
    right=9pt,
    top=8pt,
    bottom=8pt
  ]
  \noindent{\bfseries\large Abstract}\par
  \vspace{0.3em}
  \noindent\justifying
}{%
  \end{tcolorbox}
  \vspace{0.75em}
}

\titleformat{\section}
  {\Large\bfseries\color{scaleBlack}}
  {\thesection}{0.6em}{}
\titleformat{\subsection}
  {\large\bfseries\color{scaleInk}}
  {\thesubsection}{0.55em}{}
\titleformat{\subsubsection}
  {\normalsize\bfseries\color{scaleInk}}
  {\thesubsubsection}{0.5em}{}

\titlespacing*{\section}{0pt}{2.2ex plus 0.8ex minus 0.2ex}{1.0ex}
\titlespacing*{\subsection}{0pt}{1.8ex plus 0.6ex minus 0.2ex}{0.8ex}
\titlespacing*{\subsubsection}{0pt}{1.5ex plus 0.5ex minus 0.2ex}{0.6ex}

\captionsetup{
  font=small,
  labelfont=bf,
  labelsep=period,
  skip=6pt
}

\setlist[itemize]{leftmargin=*, itemsep=2pt, topsep=3pt}
\setlist[enumerate]{leftmargin=*, itemsep=2pt, topsep=3pt}

\endinput
