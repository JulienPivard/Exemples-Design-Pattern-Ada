--  @summary
--  Un produit markdown.
--  @description
--  Un produit B de markdown
--  @group Produit markdown
package Produit_B_P.Markdown_P is

   type Produit_Un_T is new Produit_T with private;
   --  Un produit de type B en version 1.

   overriding
   procedure Presente (Produit : in Produit_Un_T);
   --  Le produit concret B1 se présente elle même.
   --  @param Produit
   --  Le produit.

private

   type Produit_Un_T is new Produit_T with null record;

end Produit_B_P.Markdown_P;
