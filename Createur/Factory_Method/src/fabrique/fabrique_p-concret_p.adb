with Produit_P.Concret_P;

package body Fabrique_P.Concret_P is

   ---------------------------------------------------------------------------
   overriding
   function Fabriquer (Fab : in T_Fab_Conc)
      return Produit_P.T_Pointeur_Prod
   is
      pragma Unreferenced (Fab);
   begin
      return new Produit_P.Concret_P.T_Prod_Conc;
   end Fabriquer;

end Fabrique_P.Concret_P;
