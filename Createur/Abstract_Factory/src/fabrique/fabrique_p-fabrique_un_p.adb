with Produit_A_P.Produit_Un_P;
with Produit_B_P.Produit_Un_P;

use  Produit_A_P.Produit_Un_P;
use  Produit_B_P.Produit_Un_P;

package body Fabrique_P.Fabrique_Un_P is

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_A (Fabrique : in Fab_Conc_Un)
      return Produit_A_P.Pointeur_Prod_Abs_A
   is
      pragma Unreferenced (Fabrique);
   begin
      return new Prod_A_Un;
   end Creer_Produit_A;

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_B (Fabrique : in Fab_Conc_Un)
      return Produit_B_P.Pointeur_Prod_Abs_B
   is
      pragma Unreferenced (Fabrique);
   begin
      return new Prod_B_Un;
   end Creer_Produit_B;

end Fabrique_P.Fabrique_Un_P;
