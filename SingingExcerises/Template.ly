%%--------------------------------------------------------------------
% Mutopia Project
% LilyPond template for keyboard solo piece
% for new additions
%%--------------------------------------------------------------------

\version "2.18.2"

%---------------------------------------------------------------------
%--Paper-size setting must be commented out or deleted upon submission.
%--LilyPond engraves to paper size A4 by default.
%--Uncomment the setting below to validate your typesetting
%--in "letter" sizing.
%--Mutopia publishes both A4 and letter-sized versions.
%---------------------------------------------------------------------
% #(set-default-paper-size "letter")

%--Default staff size is 20
#(set-global-staff-size 20)

\paper {
    top-margin = 8\mm                              %-minimum top-margin: 8mm
    top-markup-spacing.basic-distance = #6         %-dist. from bottom of top margin to the first markup/title
    markup-system-spacing.basic-distance = #5      %-dist. from header/title to first system
    top-system-spacing.basic-distance = #12        %-dist. from top margin to system in pages with no titles
    %last-bottom-spacing.basic-distance = #12      %-pads music from copyright block on one-page scores only
    ragged-bottom = ##f
    ragged-last-bottom = ##f
}

%---------------------------------------------------------------------
%--Refer to http://www.mutopiaproject.org/contribute.html
%--for usage and possible values for header variables.
%---------------------------------------------------------------------
\header {
%    title = "Title of Piece"
    %composer = "John Doe (1685-1750)"
    %opus = "Opus 0"
    %%piece = "Left-aligned header"
    %date = "1741"
    %style = "Baroque"
    %source = "Bach-Gesellschaft Edition 1853 Band 3"
%
    %maintainer = "Eric Contributor"
    %maintainerEmail = "eric (at) domain.com"
    %license = "Creative Commons Attribution-ShareAlike 4.0"
%
    %mutopiatitle = "Title of Piece"
    %mutopiaopus = "Op.0"
    %mutopiacomposer = "DoeJ"
    %%--A list of instruments can be found at http://www.mutopiaproject.org/browse.html#byInstrument
    %%--Multiple instruments are separated by a comma
    %mutopiainstrument = "Piano"

}

%--------Definitions
global = {
  \key a \minor
  \time 4/4
}

upperStaff =   \relative c'' {
  \repeat unfold 50 c1         %sample music
}

lowerStaff = \relative c {
  \repeat unfold 50 c1         %sample music
}

%-------Typeset music and generate midi
\score {
    \context PianoStaff <<
        %-Midi instrument values at 
        % http://lilypond.org/doc/v2.18/Documentation/snippets/midi#midi-demo-midiinstruments
        \set PianoStaff.midiInstrument = "acoustic grand"
        \new Staff = "upper" { \clef treble \global \upperStaff }
        \new Staff = "lower" { \clef bass \global \lowerStaff }
    >>
    \layout{ }
    \midi  { \tempo 4 = 70 }
}
