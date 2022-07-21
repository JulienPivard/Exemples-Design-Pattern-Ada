--  @summary
--  Un produit abstrait de type A.
--  @description
--  Une représentation de produit abstrait de type A.
--  @group Produit A
package Produit_A_P is

   type Produit_T is abstract tagged private;
   --  Produit abstrait de type A.

   procedure Annonce
      (Produit : in     Produit_T)
   is abstract;
   --  Le produit A s'annonce.
   --  @param Produit
   --  Le produit.

private

   type Produit_T is abstract tagged null record;

end Produit_A_P;
