with Ada.Text_IO;

package body Produit_Abstrait_A.Produit_Concret_A_Deux is

   ---------------------------------------------------------------------------
   overriding
   procedure Annonce (Produit : in Prod_A_Deux) is
      pragma Unreferenced (Produit);
   begin
      Ada.Text_IO.Put_Line ("<h1>Je suis la classe A 2</h1>");
   end Annonce;

end Produit_Abstrait_A.Produit_Concret_A_Deux;
