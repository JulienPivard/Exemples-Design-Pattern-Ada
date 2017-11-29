with Produit_Abstrait_A.Produit_Concret_A_Deux;
with Produit_Abstrait_B.Produit_Concret_B_Deux;

use  Produit_Abstrait_A.Produit_Concret_A_Deux;
use  Produit_Abstrait_B.Produit_Concret_B_Deux;

package body Fabrique_Abstraite.Fabrique_Concrete_Deux is

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_A (Fabrique : in Fab_Conc_Deux)
      return Produit_Abstrait_A.Pointeur_Prod_Abs_A
   is
      pragma Unreferenced (Fabrique);
   begin
      return new Prod_A_Deux;
   end Creer_Produit_A;

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_B (Fabrique : in Fab_Conc_Deux)
      return Produit_Abstrait_B.Pointeur_Prod_Abs_B
   is
      pragma Unreferenced (Fabrique);
   begin
      return new Prod_B_Deux;
   end Creer_Produit_B;

end Fabrique_Abstraite.Fabrique_Concrete_Deux;
