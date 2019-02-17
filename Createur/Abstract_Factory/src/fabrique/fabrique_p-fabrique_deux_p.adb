with Produit_A_P.Produit_Deux_P;
with Produit_B_P.Produit_Deux_P;

package body Fabrique_P.Fabrique_Deux_P is

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_A
      (Fabrique : in Fabrique_Deux_T)
      return Produit_A_P.Produit_T'Class
   is
      pragma Unreferenced (Fabrique);
      P : Produit_A_P.Produit_Deux_P.Produit_Deux_T;
   begin
      return P;
   end Creer_Produit_A;

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_B
      (Fabrique : in Fabrique_Deux_T)
      return Produit_B_P.Produit_T'Class
   is
      pragma Unreferenced (Fabrique);
      P : Produit_B_P.Produit_Deux_P.Produit_Deux_T;
   begin
      return P;
   end Creer_Produit_B;

end Fabrique_P.Fabrique_Deux_P;
