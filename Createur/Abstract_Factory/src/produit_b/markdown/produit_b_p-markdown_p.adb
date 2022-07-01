with Ada.Text_IO;

package body Produit_B_P.Markdown_P is

   ---------------------------------------------------------------------------
   overriding
   procedure Presente
      (Produit : in     Produit_Markdown_T)
   is
      pragma Unreferenced (Produit);
   begin
      Ada.Text_IO.New_Line (Spacing => 1);
      Ada.Text_IO.Put_Line (Item    => "Classe B 1 ! Pour vous servir.");
      Ada.Text_IO.New_Line (Spacing => 1);
   end Presente;
   ---------------------------------------------------------------------------

end Produit_B_P.Markdown_P;
