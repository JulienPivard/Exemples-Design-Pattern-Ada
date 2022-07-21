with Produit_P;

--  @summary
--  Une fabrique concrète.
--  @description
--  Une fabrique de produits concret.
--  @group Fabrique
package Fabrique_P.Concret_1_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Concret_T is new Fabrique_T with private;
   --  Fabrique concrète.

   overriding
   function Fabriquer
      (This : in     Concret_T)
      return Produit_P.Produit_T'Class;
   --  Permet de construire un nouveau produit.
   --  @param This
   --  Une fabrique d'objet.
   --  @return Un produit.

private

   type Concret_T is new Fabrique_T with null record;

end Fabrique_P.Concret_1_P;
