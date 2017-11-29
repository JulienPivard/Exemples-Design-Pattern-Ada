with Ada.Text_IO;

package body Produit_Abstrait_A.Produit_Concret_A_Un is

   --  La classe s'annonce elle même.
   overriding
   procedure Annonce (Produit : in Prod_A_Un) is
      pragma Unreferenced (Produit);
   begin
      Ada.Text_IO.Put_Line ("# Je suis la classe A 1");
   end Annonce;

end Produit_Abstrait_A.Produit_Concret_A_Un;
