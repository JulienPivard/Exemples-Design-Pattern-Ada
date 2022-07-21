with Ada.Strings.Fixed;

package body Composant_P.Decorateur_P.Ascenseur_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter
      (
         This      : in out Ascenseur_T;
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
         This    : in     Ascenseur_T;
         Largeur : in     Texte_P.Largeur_T;
         Hauteur : in     Texte_P.Nb_Lignes_T
      )
      return Texte_P.Texte_T
   is
      use type Texte_P.Largeur_T;
      use type Texte_P.Nb_Lignes_T;

      subtype Indice_Str_T is Integer range 1 .. Integer (Largeur);

      subtype Str_T is String (Indice_Str_T);

      Largeur_Texte : constant Texte_P.Largeur_T := Largeur - 4;

      subtype Largeur_Texte_T is Integer range 1 .. Integer (Largeur_Texte);

      subtype Nb_Lignes_T is Texte_P.Nb_Lignes_T range 1 .. Hauteur;

      Texte : constant Texte_P.Texte_T := This.Composant.Element.Faire
         (
            Largeur => Largeur_Texte,
            Hauteur => Hauteur
         );

      Str_Tmp : Str_T := Str_T'(others => ' ');

      Resultat : Texte_P.Texte_T := Texte_P.Texte_Vide;
      I : Texte_P.Nb_Lignes_T := Texte_P.Nb_Lignes_T'First;
   begin
      Boucle_Ajout_Decorateur :
      for P of Texte (Nb_Lignes_T) loop
         if    I = Nb_Lignes_T'First then
            Str_Tmp := P (Largeur_Texte_T) & " |^|";
         elsif I = Nb_Lignes_T'Last then
            Str_Tmp := P (Largeur_Texte_T) & " |v|";
         else
            Str_Tmp := P (Largeur_Texte_T) & " | |";
         end if;

         Ada.Strings.Fixed.Move
            (
               Source => Str_Tmp,
               Target => Resultat (I)
            );
         if I /= Texte_P.Nb_Lignes_T'Last then
            I := I + 1;
         end if;
      end loop Boucle_Ajout_Decorateur;

      return Resultat;
   end Faire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Composant_P.Decorateur_P.Ascenseur_P;
