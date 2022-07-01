--  @summary
--  Un produit markdown.
--  @description
--  Un produit markdown de type A.
--  @group Produit markdown
package Produit_A_P.Markdown_P is

   type Produit_Markdown_T is new Produit_T with private;
   --  Un produit de type A en version 1.

   overriding
   procedure Annonce
      (Produit : in     Produit_Markdown_T);
   --  Le produit concret A1 s'annonce lui même.
   --  @param Produit
   --  Le produit.

private

   type Produit_Markdown_T is new Produit_T with null record;

end Produit_A_P.Markdown_P;
