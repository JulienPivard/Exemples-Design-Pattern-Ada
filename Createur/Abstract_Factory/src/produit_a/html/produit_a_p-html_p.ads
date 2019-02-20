--  @summary
--  Un produit html.
--  @description
--  Un produit html de type A.
--  @group Produit html
package Produit_A_P.Html_P is

   type Produit_Html_T is new Produit_T with private;
   --  Un produit de type A en version 2.

   overriding
   procedure Annonce
      (Produit : in Produit_Html_T);
   --  Le produit concret A2 s'annonce lui même.
   --  @param Produit
   --  Le produit.

private

   type Produit_Html_T is new Produit_T with null record;

end Produit_A_P.Html_P;
