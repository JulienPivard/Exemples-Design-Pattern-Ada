with Ada.Text_IO;

package body Produit_A_P.Markdown_P is

   ---------------------------------------------------------------------------
   overriding
   procedure Annonce
      (Produit : in Produit_Markdown_T)
   is
      pragma Unreferenced (Produit);
   begin
      Ada.Text_IO.Put_Line (Item => "# Je suis la classe A 1");
   end Annonce;
   ---------------------------------------------------------------------------

end Produit_A_P.Markdown_P;
