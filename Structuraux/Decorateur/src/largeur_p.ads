--  @summary
--  La largeur autorisé pour l'affichage.
--  @description
--  La largeur autorisé pour l'affichage.
--  @group Largeur
package Largeur_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   Largeur : constant := 100;

   type Largeur_T is range 0 .. Largeur;

   subtype Nb_Char_T is Integer range 1 .. Largeur;

   subtype Phrase_T is String (Nb_Char_T);

   Nb_Phrases : constant := 20;

   type Nb_Phrases_T is range 1 .. Nb_Phrases;

   type Texte_T is array (Nb_Phrases_T) of Phrase_T;

   Texte_Vide : constant Texte_T :=
      Texte_T'(others => Phrase_T'(others => ' '));

end Largeur_P;
