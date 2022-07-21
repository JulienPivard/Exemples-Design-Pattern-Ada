--  @summary
--  Version concrète de Commande.
--  @description
--  Version concrète de Commande.
--  @group Commande
package Commande_P.Concrete_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Commande_Concrete_T is new Commande_T with private;
   --  Version concrète des commandes.

   overriding
   procedure Execute
      (This : in out Commande_Concrete_T);
   --  Va exécuter la commande.

private

   type Commande_Concrete_T is new Commande_T with
      record
         null;
      end record;

end Commande_P.Concrete_P;
