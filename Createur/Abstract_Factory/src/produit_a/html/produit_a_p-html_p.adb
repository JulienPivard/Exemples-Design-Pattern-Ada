with Ada.Text_IO;

package body Produit_A_P.Html_P is

   ---------------------------------------------------------------------------
   overriding
   procedure Annonce
      (Produit : in Produit_Deux_T)
   is
      pragma Unreferenced (Produit);
   begin
      Ada.Text_IO.Put_Line ("<h1>Je suis la classe A 2</h1>");
   end Annonce;

end Produit_A_P.Html_P;
