with Produit_A_P.Produit_Deux_P;
with Produit_B_P.Produit_Deux_P;

package body Fabrique_P.Fabrique_Deux_P is

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_A (Fabrique : in Fabrique_Deux_T)
      return Produit_A_P.Pointeur_Prod_A_T
   is
      pragma Unreferenced (Fabrique);
   begin
      return new Produit_A_P.Produit_Deux_P.Produit_Deux_T;
   end Creer_Produit_A;

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_B (Fabrique : in Fabrique_Deux_T)
      return Produit_B_P.Pointeur_Prod_B_T
   is
      pragma Unreferenced (Fabrique);
   begin
      return new Produit_B_P.Produit_Deux_P.Produit_Deux_T;
   end Creer_Produit_B;

end Fabrique_P.Fabrique_Deux_P;
