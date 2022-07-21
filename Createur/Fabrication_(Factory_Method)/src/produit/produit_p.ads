--  @summary
--  La classe de produit à fabriquer.
--  @description
--  La classe de produit à fabriquer.
--  @group Fabrication
package Produit_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Produit_T is abstract tagged private;
   --  Produit abstrait

   procedure Creer_Produit
      (Produit : in out Produit_T)
   is abstract;
   --  Permet de créer un produit.
   --  @param Produit
   --  Le produit à créer.

   procedure Afficher
      (Produit : in Produit_T)
   is abstract;
   --  Affiche le produit.
   --  @param Produit
   --  Le produit à afficher.

private

   type Produit_T is abstract tagged null record;

end Produit_P;
