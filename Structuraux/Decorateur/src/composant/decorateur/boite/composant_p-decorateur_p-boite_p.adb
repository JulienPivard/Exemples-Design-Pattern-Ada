with Ada.Strings.Fixed;

package body Composant_P.Decorateur_P.Boite_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter
      (
         This      : in out Boite_T;
         Composant : in     Composant_T'Class
      )
   is
   begin
      This.Composant := Composant_Class_P.To_Holder (New_Item => Composant);
   end Ajouter;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Faire
      (
         This    : in     Boite_T;
         Largeur : in     Largeur_P.Largeur_T
      )
      return Largeur_P.Texte_T
   is
      use type Largeur_P.Largeur_T;
      use type Largeur_P.Nb_Phrases_T;

      subtype Indice_Str_T is Integer range 1 .. Integer (Largeur);

      subtype Str_T is String (Indice_Str_T);

      Largeur_Texte : constant Largeur_P.Largeur_T := Largeur - 4;

      subtype Largeur_Texte_T is Integer range 1 .. Integer (Largeur_Texte);

      Texte : constant Largeur_P.Texte_T :=
         This.Composant.Element.Faire (Largeur => Largeur_Texte);

      Str_Tmp : Str_T := Str_T'(others => ' ');

      Resultat : Largeur_P.Texte_T := Largeur_P.Texte_Vide;
      I : Largeur_P.Nb_Phrases_T := Largeur_P.Nb_Phrases_T'First;
   begin
      Str_Tmp := Str_T'(others => '-');
      Str_Tmp (Str_Tmp'First) := '+';
      Str_Tmp (Str_Tmp'Last) := '+';
      Ada.Strings.Fixed.Move
         (
            Source => Str_Tmp,
            Target => Resultat (I)
         );
      I := I + 1;

      Str_Tmp := Str_T'(others => ' ');

      Boucle_Ajout_Decorateur :
      for P of Texte loop
         Str_Tmp := "| " & P (Largeur_Texte_T) & " |";
         Ada.Strings.Fixed.Move
            (
               Source => Str_Tmp,
               Target => Resultat (I)
            );
         if I /= Largeur_P.Nb_Phrases_T'Last then
            I := I + 1;
         end if;
      end loop Boucle_Ajout_Decorateur;

      Str_Tmp := Str_T'(others => '-');
      Str_Tmp (Str_Tmp'First) := '+';
      Str_Tmp (Str_Tmp'Last) := '+';
      Ada.Strings.Fixed.Move
         (
            Source => Str_Tmp,
            Target => Resultat (I)
         );

      return Resultat;
   end Faire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Composant_P.Decorateur_P.Boite_P;
