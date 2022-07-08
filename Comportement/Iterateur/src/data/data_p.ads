--  @summary
--  Données stocké dans la structure itérative.
--  @description
--  Données stocké dans la structure itérative.
--  @group Données
package Data_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Element_T is range -2**31 .. 2**31 - 1;
   --  Les éléments stocké.

end Data_P;
