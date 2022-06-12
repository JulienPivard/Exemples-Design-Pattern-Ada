with Largeur_P;

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

   procedure Faire
      (
         This    : in     Composant_T;
         Largeur : in     Largeur_P.Largeur_T
      )
   is abstract;

end Composant_P;
