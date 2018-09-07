with Ada.Text_IO;

package body Produit_B_P.Produit_Un_P is

   --  La classe se présente elle même.
   overriding
   procedure Presente (Produit : in Prod_B_Un) is
      pragma Unreferenced (Produit);
   begin
      Ada.Text_IO.Put_Line ("# Classe B 1 ! Pour vous servir.");
   end Presente;

end Produit_B_P.Produit_Un_P;
