--  @summary
--  Les données du contexte.
--  @description
--  Les données du contexte.
--  @group Données
package Data_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Valeur_T is range -2**31 .. 2**31 - 1;

end Data_P;
