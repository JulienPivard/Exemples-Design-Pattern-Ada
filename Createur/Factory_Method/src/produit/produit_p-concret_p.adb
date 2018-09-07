with Ada.Text_IO;

package body Produit_P.Concret_P is

   ---------------------------------------------------------------------------
   overriding
   procedure Creer_Produit (Prod : out T_Prod_Conc) is
   begin
      Prod.Contenu := "Coucou ttt";
   end Creer_Produit;

   ---------------------------------------------------------------------------
   overriding
   procedure Afficher (Prod : in T_Prod_Conc) is
   begin
      Ada.Text_IO.Put_Line (Prod.Contenu);
   end Afficher;

end Produit_P.Concret_P;
