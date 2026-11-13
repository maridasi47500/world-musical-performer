\version "2.24.2"

\header {
  title = "Staccato Poussé : Progression par Étapes"
  subtitle = "D'après la Masterclass de Ray Chen"
  composer = "Exercice Technique"
}

\score {
  \relative c'' {
    \key c \major
    \time 4/4
    \clef treble
    \override Score.RehearsalMark.self-alignment-X = #LEFT

    % --- PREMIER TEMPO : 85 à la noire ---
    \tempo 4 = 85

    % Étape 1 : Trémolo lent (8 triples croches par temps)
    \mark \markup { \bold "1. Trémolo dans la moitié supérieure (8 triples croches / temps)" }
    c32^\markup { \italic "moitié sup." } \upbow c \downbow c \upbow c \downbow c \upbow c \downbow c \upbow c \downbow
    c32 \upbow c \downbow c \upbow c \downbow c \upbow c \downbow c \upbow c \downbow
    c32 \upbow c \downbow c \upbow c \downbow c \upbow c \downbow c \upbow c \downbow
    c32 \upbow c \downbow c \upbow c \downbow c \upbow c \downbow c \upbow c \downbow |
    \break

    % Étape 2 : Accentuer les poussés, minimiser les tirés
    \mark \markup { \bold "2. Accentuer les poussés, minimiser les tirés" }
    c32 \upbow \accent c \downbow \p c \upbow \accent c \downbow \p c \upbow \accent c \downbow \p c \upbow \accent c \downbow \p
    c32 \upbow \accent c \downbow \p c \upbow \accent c \downbow \p c \upbow \accent c \downbow \p c \upbow \accent c \downbow \p
    c32 \upbow \accent c \downbow \p c \upbow \accent c \downbow \p c \upbow \accent c \downbow \p c \upbow \accent c \downbow \p
    c32 \upbow \accent c \downbow \p c \upbow \accent c \downbow \p c \upbow \accent c \downbow \p c \upbow \accent c \downbow \p |
    \break

    % Étape 3 : Éliminer les tirés -> Staccato poussé en doubles croches (moitié de la vitesse)
    \mark \markup { \bold "3. Ajouter du poids et éliminer les tirés (doubles croches)" }
    c16 \upbow ( \staccato \mf c \upbow \staccato c \upbow \staccato c \upbow \staccato
    c16 \upbow \staccato c \upbow \staccato c \upbow \staccato c \upbow \staccato
    c16 \upbow \staccato c \upbow \staccato c \upbow \staccato c \upbow \staccato
    c16 \upbow \staccato c \upbow \staccato c \upbow \staccato c \upbow \staccato ) |
    \break

    % --- DEUXIÈME TEMPO : 95 à la noire ---
    \tempo 4 = 95

    % Étape 4 : Trémolo rapide à 95
    \mark \markup { \bold "4. Trémolo rapide (8 triples croches / temps)" }
    c32 \upbow \p c \downbow c \upbow c \downbow c \upbow c \downbow c \upbow c \downbow
    c32 \upbow c \downbow c \upbow c \downbow c \upbow c \downbow c \upbow c \downbow
    c32 \upbow c \downbow c \upbow c \downbow c \upbow c \downbow c \upbow c \downbow
    c32 \upbow c \downbow c \upbow c \downbow c \upbow c \downbow c \upbow c \downbow |
    \break

    % Étape 5 : Staccato poussé rapide en doubles croches (sur une gamme)
    \mark \markup { \bold "5. Staccato poussé rapide (doubles croches)" }
    c16 \upbow ( \staccato \f d \upbow \staccato e \upbow \staccato f \upbow \staccato
    g16 \upbow \staccato a \upbow \staccato b \upbow \staccato c \upbow \staccato
    d16 \upbow \staccato c \upbow \staccato b \upbow \staccato a \upbow \staccato
    g16 \upbow \staccato f \upbow \staccato e \upbow \staccato d \upbow \staccato ) |

    \bar "|."
  }
  \layout {
    indent = 0\mm
    \context {
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/32)
    }
  }
}