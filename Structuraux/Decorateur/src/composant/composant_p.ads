with Texte_P;

--  @summary
--  Représentation d'un composant.
--  @description
--  Un composant dont on pourra étendre les capacités en lui
--  ajoutant un décorateur.
--  @group Decorateur
package Composant_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Composant_T is interface;

   function Faire
      (
         This    : in     Composant_T;
         Largeur : in     Texte_P.Largeur_T
      )
      return Texte_P.Texte_T
   is abstract;

end Composant_P;
