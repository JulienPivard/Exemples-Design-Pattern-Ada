with Produit_A_P.Produit_Deux_P;
with Produit_B_P.Produit_Deux_P;

use  Produit_A_P.Produit_Deux_P;
use  Produit_B_P.Produit_Deux_P;

package body Fabrique_P.Fabrique_Deux_P is

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_A (Fabrique : in Fab_Conc_Deux)
      return Produit_A_P.Pointeur_Prod_Abs_A
   is
      pragma Unreferenced (Fabrique);
   begin
      return new Prod_A_Deux;
   end Creer_Produit_A;

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_B (Fabrique : in Fab_Conc_Deux)
      return Produit_B_P.Pointeur_Prod_Abs_B
   is
      pragma Unreferenced (Fabrique);
   begin
      return new Prod_B_Deux;
   end Creer_Produit_B;

end Fabrique_P.Fabrique_Deux_P;
