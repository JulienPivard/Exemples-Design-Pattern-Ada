with Ada.Text_IO;

package body Produit_B_P.Html_P is

   ---------------------------------------------------------------------------
   overriding
   procedure Presente
      (Produit : in Produit_Html_T)
   is
      pragma Unreferenced (Produit);
   begin
      Ada.Text_IO.Put_Line ("<div>Classe B 2 ! Pour vous servir.</div>");
   end Presente;

end Produit_B_P.Html_P;
