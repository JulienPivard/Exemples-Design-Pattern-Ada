with Ada.Text_IO;

package body Produit_B_P.Markdown_P is

   ---------------------------------------------------------------------------
   overriding
   procedure Presente
      (Produit : in Produit_Markdown_T)
   is
      pragma Unreferenced (Produit);
   begin
      Ada.Text_IO.Put_Line ("# Classe B 1 ! Pour vous servir.");
   end Presente;

end Produit_B_P.Markdown_P;
