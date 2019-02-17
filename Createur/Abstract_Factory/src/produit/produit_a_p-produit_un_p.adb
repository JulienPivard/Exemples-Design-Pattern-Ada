with Ada.Text_IO;

package body Produit_A_P.Produit_Un_P is

   ---------------------------------------------------------------------------
   overriding
   procedure Annonce
      (Produit : in Produit_Un_T)
   is
      pragma Unreferenced (Produit);
   begin
      Ada.Text_IO.Put_Line ("# Je suis la classe A 1");
   end Annonce;

end Produit_A_P.Produit_Un_P;
