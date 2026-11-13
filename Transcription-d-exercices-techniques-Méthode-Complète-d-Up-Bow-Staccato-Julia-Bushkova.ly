\version "2.24.0"

\header {
  title = "Méthode Complète d'Up-Bow Staccato (Julia Bushkova)"
  subtitle = "Controlled Staccato & Tight-Arm Staccato"
  composer = "Transcription d'exercices techniques"
}

\paper {
  indent = 0\mm
  system-system-spacing.basic-distance = #14
}

\score {
  \new Staff \relative c'' {
    \clef treble
    \time 4/4
    \key d \major

    % =========================================================
    % PARTIE 1 : CONTROLLED STACCATO (Tempo = 40)
    % =========================================================
    \tempo "I. Controlled Staccato (Rester loin du chevalet)" 4 = 40
    
    \mark \markup { \box "1. Simple (1 bite / temps)" }
    a4\upbow->-. a-. a-. a-. |
    \bar "||" \break

    \mark \markup { \box "2. Double (Bite + 1 Echo)" }
    a8\upbow->-. a-. a->-. a-. a->-. a-. a->-. a-. |
    \bar "||" \break

    \mark \markup { \box "3. Triplet (Bite + 2 Echos)" }
    \tuplet 3/2 4 { a8\upbow->-. a-. a-. } \tuplet 3/2 4 { a8->-. a-. a-. } 
    \tuplet 3/2 4 { a8->-. a-. a-. } \tuplet 3/2 4 { a8->-. a-. a-. } |
    \bar "||" \break

    \mark \markup { \box "4. Par 4 dans 1 pulsation (Bite + 3 Echos)" }
    a16\upbow->-. a-. a-. a-. a->-. a-. a-. a-. 
    a->-. a-. a-. a-. a->-. a-. a-. a-. |
    \bar "||" \break

    % =========================================================
    % PARTIE 2 : ACCÉLÉRATION À 80 À LA NOIRE
    % =========================================================
    \tempo "Doublement des bites" 4 = 80
    
    \mark \markup { \box "5. Par 2 dans 1 pulsation (Accent 1 note sur 2)" }
    a8\upbow->-. a-. a->-. a-. a->-. a-. a->-. a-. |
    \bar "||" \break

    \mark \markup { \box "6. Two echos per bite à 80 (Dernier = tiré blanche tout l'archet)" }
    \tuplet 3/2 4 { a8\upbow->-. a-. a-. } \tuplet 3/2 4 { a8->-. a-. a-. } a2\downbow^\markup { \italic "tout l'archet" } |
    \bar "||" \break

    \mark \markup { \box "7. Three echos per bite à 80 (1er accentué, echos sans accent)" }
    a16\upbow->-. a-. a-. a-. a->-. a-. a-. a-. 
    a->-. a-. a-. a-. a->-. a-. a-. a-. |
    \bar "||" \break

    \mark \markup { \box "8. Three echos per bite (Accent 1 note sur 2)" }
    a16\upbow->-. a-. a->-. a-. a->-. a-. a->-. a-. 
    a->-. a-. a->-. a-. a->-. a-. a->-. a-. |
    \bar "||" \break

    % =========================================================
    % PARTIE 3 : ACCÉLÉRATION À 160 À LA NOIRE
    % =========================================================
    \tempo "Tempo rapide" 4 = 160

    \mark \markup { \box "9. Par 2 à 160 (1er = bite accentué, 2e = echo)" }
    a8\upbow->-. a-. a->-. a-. a->-. a-. a->-. a-. |
    \bar "||" \break

    \mark \markup { \box "10. Triplets à 160 (Accent sur la 1ère)" }
    \tuplet 3/2 4 { a8\upbow->-. a-. a-. } \tuplet 3/2 4 { a8->-. a-. a-. } 
    \tuplet 3/2 4 { a8->-. a-. a-. } \tuplet 3/2 4 { a8->-. a-. a-. } |
    \bar "||" \break

    \mark \markup { \box "11. Groupes de 2 ou 3 à 160 avec silence entre chaque" }
    a8\upbow->-. a-. r4 a8\upbow->-. a-. r4 |
    \tuplet 3/2 4 { a8\upbow->-. a-. a-. } r4 \tuplet 3/2 4 { a8\upbow->-. a-. a-. } r4 |
    \bar "||" \break

    % =========================================================
    % PARTIE 4 : TIGHT-ARM STACCATO
    % =========================================================
    \tempo "II. Tight-Arm Staccato (Up-bow / Down-bow)" 4 = 60

    \mark \markup { \column { 
      \box "12. Contraction bras droit (biceps/triceps/avant-bras)" 
      \small "Appuyer assez fort dans la corde, vitesse d'archet très lente" 
    } }
    \repeat unfold 16 { a32\upbow-. } a2\downbow^\markup { \italic "relâcher" } |
    \repeat unfold 16 { a32\downbow-. } a2\upbow^\markup { \italic "relâcher" } |
    \bar "|."
  }
  \layout { }
  \midi { }
}