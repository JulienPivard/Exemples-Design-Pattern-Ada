with Ada.Strings.Fixed;

package body Composant_P.Concret_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   function Initialiser
      (Text : in     String)
      return Concret_T
   is
      Resultat : constant Concret_T := Concret_T'
         (
            Text => Str_R.To_Unbounded_String (Source => Text)
         );
   begin
      return Resultat;
   end Initialiser;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Faire
      (
         This    : in     Concret_T;
         Largeur : in     Texte_P.Largeur_T;
         Hauteur : in     Texte_P.Nb_Lignes_T
      )
      return Texte_P.Texte_T
   is
      use type Texte_P.Nb_Lignes_T;

      Str : constant String := Str_R.To_String (Source => This.Text);

      Fin_Du_Texte : constant Integer := Str'Last;

      Debut : Integer := Str'First;
      Fin   : Integer;

      I : Texte_P.Nb_Lignes_T := Texte_P.Nb_Lignes_T'First;

      Resultat : Texte_P.Texte_T := Texte_P.Texte_Vide;
   begin
      Boucle_Decoupage_Str :
      loop
         Bloc_Calcul_Position_Fin :
         declare
            Fin_Tmp : constant Integer := Debut + Integer (Largeur) - 1;
         begin
            Fin := (if Fin_Tmp < Fin_Du_Texte then Fin_Tmp else Fin_Du_Texte);
         end Bloc_Calcul_Position_Fin;

         Bloc_Trouver_Saut_De_Ligne :
         declare
            Pos : constant Integer := Ada.Strings.Fixed.Index
               (
                  Source  => Str (Debut .. Fin),
                  Pattern => "" & ASCII.LF
               );
         begin
            if Pos /= 0 then
               Fin := (if Pos = Debut then Pos else Pos - 1);
            end if;
         end Bloc_Trouver_Saut_De_Ligne;

         if Fin = Debut and then Str (Debut) = ASCII.LF then
            Resultat (I) := Texte_P.Ligne_T'(others => ' ');
         else
            Ada.Strings.Fixed.Move
               (
                  Source => Str (Debut .. Fin),
                  Target => Resultat (I)
               );
         end if;

         exit Boucle_Decoupage_Str when Fin >= Fin_Du_Texte;

         if I /= Texte_P.Nb_Lignes_T'Last then
            I := I + 1;
         end if;

         Debut := Fin + 1;
      end loop Boucle_Decoupage_Str;

      return Resultat;
   end Faire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Composant_P.Concret_P;
