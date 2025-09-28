--  @summary
--  Nombre d'arguments.
--  @description
--  Nombre d'arguments.
--  @group Exécuteur
package NB_Args_P
   with
      Pure                    => True,
      Preelaborate            => False,
      Elaborate_Body          => False,
      No_Elaboration_Code_All => True,
      Spark_Mode              => Off
is

   NB_Args_Max : constant := 1_000;
   --  Le nombre d'arguments max.

   type NB_Args_T is range 0 .. NB_Args_Max;
   --  Le nombre d'arguments max.

end NB_Args_P;
