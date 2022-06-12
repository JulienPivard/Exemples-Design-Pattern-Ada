with Ada.Strings.Fixed;
with Ada.Text_IO;

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
   procedure Faire
      (
         This    : in     Concret_T;
         Largeur : in     Largeur_P.Largeur_T
      )
   is
      Str : constant String  := Str_R.To_String (Source => This.Text);

      Fin_Du_Texte : constant Integer := Str'Last;

      Debut : Integer := Str'First;
      Fin   : Integer;

      Quitter : Boolean := False;
   begin
      Boucle_Decoupage_Str :
      loop
         Bloc_Calcul_Fin :
         declare
            Fin_Tmp : constant Integer := Debut + Integer (Largeur) - 1;
         begin
            Fin := (if Fin_Tmp < Fin_Du_Texte then Fin_Tmp else Fin_Du_Texte);
         end Bloc_Calcul_Fin;

         Bloc_Trouver_Saut_De_Ligne :
         declare
            Pos : constant Integer := Ada.Strings.Fixed.Index
               (
                  Source  => Str (Debut .. Fin),
                  Pattern => "" & ASCII.LF
               );
         begin
            if Pos /= 0 then
               Fin := Pos;
            end if;
         end Bloc_Trouver_Saut_De_Ligne;

         Quitter := Fin >= Fin_Du_Texte;

         Ada.Text_IO.Put_Line (Item => Str (Debut .. Fin));

         exit Boucle_Decoupage_Str when Quitter;

         Debut := Fin + 1;
      end loop Boucle_Decoupage_Str;
   end Faire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Composant_P.Concret_P;
