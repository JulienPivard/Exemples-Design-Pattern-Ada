--  @summary
--  Un produit html.
--  @description
--  Un produit B d'html
--  @group Produit html
package Produit_B_P.Html_P is

   type Produit_Html_T is new Produit_T with private;
   --  Un produit de type B en version 2.

   overriding
   procedure Presente
      (Produit : in     Produit_Html_T);
   --  Le produit concret B2 se présente lui même.
   --  @param Produit
   --  Le produit.

private

   type Produit_Html_T is new Produit_T with null record;

end Produit_B_P.Html_P;
