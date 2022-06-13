--  @summary
--  La largeur autorisé pour l'affichage.
--  @description
--  La largeur autorisé pour l'affichage.
--  @group Largeur
package Texte_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   Largeur : constant := 100;

   type Largeur_T is range 0 .. Largeur;

   subtype Nb_Char_T is Integer range 1 .. Largeur;

   subtype Ligne_T is String (Nb_Char_T);

   Nb_Lignes : constant := 20;

   type Nb_Lignes_T is range 1 .. Nb_Lignes;

   type Texte_T is array (Nb_Lignes_T) of Ligne_T;

   Texte_Vide : constant Texte_T :=
      Texte_T'(others => Ligne_T'(others => ' '));

end Texte_P;
