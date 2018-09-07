with Produit_P.Concret_P;

package body Fabrique_P.Concret_P is

   ---------------------------------------------------------------------------
   overriding
   function Fabriquer
      (Fabrique : in Concret_T)
      return Produit_P.Produit_T'Class
   is
      pragma Unreferenced (Fabrique);
      P : Produit_P.Concret_P.Concret_T;
      pragma Unmodified (P);
   begin
      return P;
   end Fabriquer;

end Fabrique_P.Concret_P;
