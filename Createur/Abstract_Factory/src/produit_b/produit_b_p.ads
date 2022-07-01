--  @summary
--  Un produit abstrait de type B.
--  @description
--  Une représentation de produit abstrait de type B.
--  @group Produit B
package Produit_B_P is

   type Produit_T is abstract tagged private;
   --  Produit abstrait de type B.

   type Produit_A is access Produit_T'Class;
   --  Pointeur vers un produit de type B.

   procedure Presente
      (Produit : in     Produit_T)
   is abstract;
   --  Le produit B se présente.
   --  @param Produit
   --  Le produit.

private

   type Produit_T is abstract tagged null record;

end Produit_B_P;
