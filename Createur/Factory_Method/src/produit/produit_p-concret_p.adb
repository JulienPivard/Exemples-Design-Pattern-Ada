with Ada.Text_IO;

package body Produit_P.Concret_P is

   ---------------------------------------------------------------------------
   overriding
   procedure Creer_Produit
      (Produit : in out Concret_T)
   is
   begin
      Produit.Contenu := "Coucou ttt";
   end Creer_Produit;

   ---------------------------------------------------------------------------
   overriding
   procedure Afficher
      (Produit : in Concret_T)
   is
   begin
      Ada.Text_IO.Put_Line (Produit.Contenu);
   end Afficher;

end Produit_P.Concret_P;
