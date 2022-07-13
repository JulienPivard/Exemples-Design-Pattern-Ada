--  @summary
--  Package commun au fonctionnement des Memento.
--  @description
--  Package commun au fonctionnement des Memento.
--  @group Mémento package
package Mem_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Valeur_T is range -100 .. 100;
   --  Valeur exemple.

end Mem_P;
