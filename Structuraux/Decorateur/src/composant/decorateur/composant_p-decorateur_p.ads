--  @summary
--  Classe abstraite des décorateurs.
--  @description
--  Décorateur utilisable sur le texte pour le modifier.
--  @group Décorateur
package Composant_P.Decorateur_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Decorateur_T is interface and Composant_T;

   procedure Ajouter
      (
         This      : in out Decorateur_T;
         Composant : in     Composant_T'Class
      )
   is abstract;

   overriding
   function Faire
      (
         This    : in     Decorateur_T;
         Largeur : in     Texte_P.Largeur_T;
         Hauteur : in     Texte_P.Nb_Lignes_T
      )
      return Texte_P.Texte_T
   is abstract;

private

end Composant_P.Decorateur_P;
