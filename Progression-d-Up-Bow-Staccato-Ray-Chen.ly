\version "2.24.0"

\header {
  title = "Progression d'Up-Bow Staccato (Ray Chen)"
  subtitle = "De la détente à la pointe jusqu'au staccato poussé"
  tagline = ##f
}

\paper {
  indent = 0\mm
}

\score {
  \new Staff \with {
    instrumentName = "Violon"
  } \relative c'' {
    \clef treble
    \time 4/4
    \tempo 4 = 100

    % Étape 1 : Trémolo à la pointe (léger, sur place)
    d1:32\upbow\p^\markup { \bold "1. Tremolo at the top (à la pointe, léger)" } |

    % Étape 2 : Attaquer le son (premier poussé accentué) + un peu plus fort
    d4:32->\upbow\mp^\markup { \bold "2. Attaquer le son (1er poussé accentué)" }
    d4:32\upbow\<
    d2:32\upbow\mf^\markup { \bold "3. Un peu plus fort" } |

    % Étape 3 : Serrer plus (trémolo forte)
    d1:32\upbow\f^\markup { \bold "4. Serrer plus (tremolo forte)" } |

    % Étape 4 : Only push ups (uniquement les poussés articulés vers le talon)
    d16-.\upbow\f^\markup { \bold "5. Only push ups (ne garder que les poussés)" }(
    d16-. d16-. d16-.
    d16-. d16-. d16-. d16-.
    d16-. d16-. d16-. d16-.
    d16-. d16-. d16-. d16-.) |

    % Exemple appliqué sur la gamme chromatique ascendante (Wieniawski)
    d16-.\upbow\f^\markup { \bold "6. Application chromatique" }(
    dis-. e-. f-.
    fis-. g-. gis-. a-.
    ais-. b-. c-. cis-.
    d4)\downbow \bar "|."
  }
  \layout { }
  \midi { }
}