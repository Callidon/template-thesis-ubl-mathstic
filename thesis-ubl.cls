\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis-ubl}[2019/07/13 Minimal modern thesis class for UBL]

\LoadClass[12pt,a4paper,
  cleardoublepage=empty,
  numbers=noenddot,
  titlepage,
  toc=bibliography,
  toc=index]{memoir}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LaTeX class options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{anglais}{
  \gdef\@isEnglish{1}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{mimosis}}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hyperlinks & bookmarks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[%
  colorlinks = true,
  citecolor  = RoyalBlue,
  linkcolor  = RoyalBlue,
  urlcolor   = RoyalBlue,
  ]{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typesetting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{longtable}
\RequirePackage[usenames,dvipsnames]{xcolor}
\definecolor{RoyalBlue}{RGB}{90, 118, 233}
% \RequirePackage{lmodern}
\ifdefined\@isEnglish
  \RequirePackage[english]{babel}
\else
  \RequirePackage[french]{babel}
\fi
\RequirePackage{ifthen}
\RequirePackage{geometry}
\RequirePackage{etoolbox}
\RequirePackage{eso-pic}
\RequirePackage[binary-units=true]{siunitx}
\DeclareSIUnit\px{px}

\sisetup{%
  detect-all           = true,
  detect-family        = true,
  detect-mode          = true,
  detect-shape         = true,
  detect-weight        = true,
  detect-inline-weight = math,
}

\RequirePackage{textcomp}
\RequirePackage{bookmark}
\RequirePackage{microtype}

% For typesettings algorithms
\RequirePackage{listings}

% Math stuffs
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{stmaryrd}

\newtheorem{definition}{Definition}
\newtheorem{example}{Example}
\newtheorem{theorem}{Theorem}
\newtheorem{lemma}{Lemma}

\RequirePackage[position=bottom]{subfig}
\captionsetup[subfigure]{margin=10px}

\RequirePackage{csquotes}
\RequirePackage{float}
\RequirePackage[defblank]{paralist}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{xcolor}
\RequirePackage{colortbl}
\RequirePackage{multicol}
\usetikzlibrary{positioning,shapes,fit,chains,automata,patterns,arrows}

\RequirePackage[%
  autocite     = plain,
  backend      = bibtex,
  doi          = true,
  url          = true,
  giveninits   = true,
  hyperref     = true,
  maxbibnames  = 99,
  maxcitenames = 99,
  sortcites    = true,
  style        = numeric,
  ]{biblatex}

\newcommand{\ifequals}[3]{\ifthenelse{\equal{#1}{#2}}{#3}{}}
\newcommand{\case}[2]{#1 #2} % Dummy, so \renewcommand has something to overwrite...
\newenvironment{switch}[1]{\renewcommand{\case}{\ifequals{#1}}}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{mathSTIC-Color}{RGB}{233,90,104}
\definecolor{grisfonce}{RGB}{49,49,49}
\definecolor{grisclair}{RGB}{111,111,111}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cover & Back backgrounds
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\BackgroundPic{%
  \put(0,0){%
    \parbox[b][\paperheight]{\paperwidth}{%
    \vfill
    \centering
    \includegraphics[width=\paperwidth,height=\paperheight,%
    keepaspectratio]{cover/MathStic-background.pdf}%
    \vfill
  }
}}
\newcommand\BackpagePic{%
  \put(0,0){%
  \parbox[b][\paperheight]{\paperwidth}{%
    \vfill
    \centering
    \includegraphics[width=\paperwidth,height=\paperheight,%
    keepaspectratio]{cover/MathStic-backpage.pdf}%
    \vfill
  }
}}
\newcommand*\cleartoleftpage{%
   \clearpage
   \ifodd\value{page}\hbox{}\vspace*{\fill}\thispagestyle{empty}\newpage\fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Commands for setting the thesis information (number, date of defense, etc)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\titre}[1]{
  \gdef\@Titre{#1}
}
\titre{Titre de la thèse}

\newcommand{\soutenance}[2]{
  \gdef\@DateSoutenance{#1}
  \gdef\@LieuSoutenance{#2}
}
\soutenance{\today}{Nantes}

\newcommand{\specialite}[1]{
  \gdef\@Specialite{#1}
}
\specialite{??}

\newcommand{\universite}[1]{
  \gdef\@Universite{#1}
}
\universite{Université de Nantes}

\newcommand{\laboratoire}[1]{
  \gdef\@Laboratoire{#1}
}
\laboratoire{Laboratoire des Sciences du Numérique de Nantes}

\newcommand{\thesenum}[1]{
  \gdef\@NumeroThese{#1}
}

\newcommand{\keywords}[1]{
  \gdef\@Keywords{#1}
}
\keywords{from 3 to 16 keywords}

\newcommand{\motscles}[1]{
  \gdef\@MotsCles{#1}
}
\motscles{de 3 à 16 mots-clés}

\newcommand{\Abstract}[1]{
  \gdef\@Abstract{#1}
}
\Abstract{Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.}

\newcommand{\resume}[1]{
  \gdef\@Resume{#1}
}
\resume{Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Commands for setting the thesis school (used for the logo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\etablissement}[1]{
  \begin{switch}{#1}
        \case{UN}{\gdef\@EtablissementLogo{\includegraphics[scale=0.3]{cover/logos/univ-nantes.png}}}
        \case{ULM}{\gdef\@EtablissementLogo{\includegraphics[scale=0.5]{cover/logos/logo_LEMANS_UNIVERSITE.jpg}}}
        \case{UA}{\gdef\@EtablissementLogo{\includegraphics[scale=0.7]{cover/logos/logo_ua_v_couleur.png}}}
        \case{UR1}{\gdef\@EtablissementLogo{\includegraphics[scale=0.15]{cover/logos/logoUR1.png}}}
        \case{UR2}{\gdef\@EtablissementLogo{\includegraphics[scale=0.6]{cover/logos/logo-rennes2.png}}}
        \case{UBS}{\gdef\@EtablissementLogo{\includegraphics[scale=0.6]{cover/logos/logo-UBS.png}}}
        \case{UBO}{\gdef\@EtablissementLogo{\includegraphics[scale=0.6]{cover/logos/logoUBO.png}}}
    \end{switch}
}
\etablissement{UN}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Commands for setting the thesis advisors, jury, etc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Male thesis director
% Usage: \directeur{Firstname Lastname}{Position}{Affiliation}
\newcommand{\directeur}[3]{
  \gdef\@DirecteurName{#1}
  \gdef\@DirecteurPosition{#2}
  \gdef\@DirecteurAffi{#3}
}

% Female thesis director
% Usage: \directrice{Firstname Lastname}{Position}{Affiliation}
\newcommand{\directrice}[3]{
  \gdef\@DirectriceName{#1}
  \gdef\@DirectricePosition{#2}
  \gdef\@DirectriceAffi{#3}
}

% Male thesis co-advisor with HDR
% Usage: \codirecteur{Firstname Lastname}{Position}{Affiliation}
\newcommand{\codirecteur}[3]{
  \gdef\@CoDirecteurName{#1}
  \gdef\@CoDirecteurPosition{#2}
  \gdef\@CoDirecteurAffi{#3}
}

% Female thesis co-advisor with HDR
% Usage: \codirectrice{Firstname Lastname}{Position}{Affiliation}
\newcommand{\codirectrice}[3]{
  \gdef\@CoDirectriceName{#1}
  \gdef\@CoDirectricePosition{#2}
  \gdef\@CoDirectriceAffi{#3}
}

% Male thesis co-advisor without HDR
% Usage: \coencadrant{Firstname Lastname}{Position}{Affiliation}
\newcommand{\coencadrant}[3]{
  \gdef\@CoencadrantName{#1}
  \gdef\@CoencadrantPosition{#2}
  \gdef\@CoencadrantAffi{#3}
}

% Female thesis co-advisor without HDR
% Usage: \coencadrante{Firstname Lastname}{Position}{Affiliation}
\newcommand{\coencadrante}[3]{
  \gdef\@CoencadranteName{#1}
  \gdef\@CoencadrantePosition{#2}
  \gdef\@CoencadranteAffi{#3}
}

% Male jury lead
% Usage: \president{Firstname Lastname}{Position}{Affiliation}
\newcommand{\president}[3]{
  \gdef\@PresidentName{#1}
  \gdef\@PresidentPosition{#2}
  \gdef\@PresidentAffi{#3}
}

% Female jury lead
% Usage: \presidente{Firstname Lastname}{Position}{Affiliation}
\newcommand{\presidente}[3]{
  \gdef\@PresidenteName{#1}
  \gdef\@PresidentePosition{#2}
  \gdef\@PresidenteAffi{#3}
}

% Generic command for setting examiners, up to 2
% Work by setting new macros at each invocation
% Usage: \rapporteur{Firstname Lastname}{Position}{Affiliation}
\newcommand{\rapporteur}[3]{
  \ifdefined\@RapporteurAName
    \rapporteurB{#1}{#2}{#3}
  \else
    \rapporteurA{#1}{#2}{#3}
  \fi
}

% Used internally for setting examiners
% NOT TO USE DIRECTLY (unless you know what you do)
\newcommand{\rapporteurA}[3]{
  \gdef\@RapporteurAName{#1}
  \gdef\@RapporteurAPosition{#2}
  \gdef\@RapporteurAAffi{#3}
}
\newcommand{\rapporteurB}[3]{
  \gdef\@RapporteurBName{#1}
  \gdef\@RapporteurBPosition{#2}
  \gdef\@RapporteurBAffi{#3}
}

% Generic command for setting jury members, up to 7
% Work by setting new macros at each invocation
% Usage: \jury{Firstname Lastname}{Position}{Affiliation}
\newcommand{\jury}[3]{
  \ifdefined\@JuryAName
    \ifdefined\@JuryBName
      \ifdefined\@JuryCName
        \ifdefined\@JuryDName
          \ifdefined\@JuryEName
            \ifdefined\@JuryFName
              \juryG{#1}{#2}{#3}
            \else
              \juryF{#1}{#2}{#3}
            \fi
          \else
            \juryE{#1}{#2}{#3}
          \fi
        \else
          \juryD{#1}{#2}{#3}
        \fi
      \else
        \juryC{#1}{#2}{#3}
      \fi
    \else
      \juryB{#1}{#2}{#3}
    \fi
  \else
    \juryA{#1}{#2}{#3}
  \fi
}

% Used internally for setting jury members
% NOT TO USE DIRECTLY (unless you know what you do)
\newcommand{\juryA}[3]{
  \gdef\@JuryAName{#1}
  \gdef\@JuryAPosition{#2}
  \gdef\@JuryAAffi{#3}
}
\newcommand{\juryB}[3]{
  \gdef\@JuryBName{#1}
  \gdef\@JuryBPosition{#2}
  \gdef\@JuryBAffi{#3}
}
\newcommand{\juryC}[3]{
  \gdef\@JuryCName{#1}
  \gdef\@JuryCPosition{#2}
  \gdef\@JuryCAffi{#3}
}
\newcommand{\juryD}[3]{
  \gdef\@JuryDName{#1}
  \gdef\@JuryDPosition{#2}
  \gdef\@JuryDAffi{#3}
}
\newcommand{\juryE}[3]{
  \gdef\@JuryEName{#1}
  \gdef\@JuryEPosition{#2}
  \gdef\@JuryEAffi{#3}
}
\newcommand{\juryF}[3]{
  \gdef\@JuryFName{#1}
  \gdef\@JuryFPosition{#2}
  \gdef\@JuryFAffi{#3}
}
\newcommand{\juryG}[3]{
  \gdef\@JuryGName{#1}
  \gdef\@JuryGPosition{#2}
  \gdef\@JuryGAffi{#3}
}

% Generic command for setting guest members, up to 3
% Same idea as \jury
% Usage: \invite{Firstname Lastname}{Position}{Affiliation}
\newcommand{\invite}[3]{
  \ifdefined\@InviteAName
    \ifdefined\@InviteBName
      \inviteC{#1}{#2}{#3}
    \else
      \inviteB{#1}{#2}{#3}
    \fi
  \else
    \inviteA{#1}{#2}{#3}
  \fi
}

% Used internally for setting guests
% NOT TO USE DIRECTLY (unless you know what you do)
\newcommand{\inviteA}[3]{
  \gdef\@InviteAName{#1}
  \gdef\@InviteAPosition{#2}
  \gdef\@InviteAAffi{#3}
}
\newcommand{\inviteB}[3]{
  \gdef\@InviteBName{#1}
  \gdef\@InviteBPosition{#2}
  \gdef\@InviteBAffi{#3}
}
\newcommand{\inviteC}[3]{
  \gdef\@InviteCName{#1}
  \gdef\@InviteCPosition{#2}
  \gdef\@InviteCAffi{#3}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cover page content
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
  \AddToShipoutPicture*{\BackgroundPic}
  \frontmatter
  \input{cover/cover}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Backpage content
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtEndDocument{
  \cleartoverso
  \thispagestyle{empty}
  \AddToShipoutPicture*{\BackpagePic}
  \input{./cover/backpage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Chapter/Section/Subsection style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \makechapterstyle{mym}{%
%   \renewcommand\chapnamefont{\normalfont\Large\raggedleft\lsstyle}%
%   \renewcommand\chaptitlefont{\normalfont\color{RoyalBlue}\Huge\lsstyle}%
%   \renewcommand\printchapternonum{}%
%   \renewcommand\printchaptertitle[1]{\chaptitlefont ##1}%
%   \renewcommand\afterchaptertitle{\par\nobreak\bigskip\hrule\vspace{0.5in}}
% }
\renewcommand\thesection{\textcolor{RoyalBlue}{\thechapter.\arabic{section}}}
\renewcommand\thesubsection{\textcolor{RoyalBlue}{\thesection.\arabic{subsection}}}
