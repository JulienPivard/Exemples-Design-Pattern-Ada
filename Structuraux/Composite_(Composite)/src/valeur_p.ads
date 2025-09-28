--  @summary
--  Une valeur de composant.
--  @description
--  Une valeur de composant.
--  @group Valeur
package Valeur_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Valeur_T is range -100 .. 100;

   Neutre : constant Valeur_T := 0;

end Valeur_P;
