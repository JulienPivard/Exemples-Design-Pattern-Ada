--  @summary
--  Classe abstraite mère des Commandes concrètes.
--  @description
--  Classe abstraite mère des Commandes concrètes.
--  @group Commande
package Commande_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Commande_T is interface;

   procedure Execute
      (This : in out Commande_T)
   is abstract;

end Commande_P;
