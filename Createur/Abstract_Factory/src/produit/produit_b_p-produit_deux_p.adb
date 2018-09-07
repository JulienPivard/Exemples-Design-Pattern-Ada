with Ada.Text_IO;

package body Produit_B_P.Produit_Deux_P is

   ---------------------------------------------------------------------------
   overriding
   procedure Presente (Produit : in Produit_Deux_T) is
      pragma Unreferenced (Produit);
   begin
      Ada.Text_IO.Put_Line ("<h1>Classe B 2 ! Pour vous servir.</h1>");
   end Presente;

end Produit_B_P.Produit_Deux_P;
