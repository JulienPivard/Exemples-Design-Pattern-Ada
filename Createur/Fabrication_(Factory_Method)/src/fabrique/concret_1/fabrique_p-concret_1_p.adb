with Produit_P.Concret_1_P;

package body Fabrique_P.Concret_1_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   function Fabriquer
      (Fabrique : in Concret_T)
      return Produit_P.Produit_T'Class
   is
      P : Produit_P.Concret_1_P.Concret_T;

      pragma Unreferenced (Fabrique);
      pragma Unmodified   (P);
   begin
      return P;
   end Fabriquer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Fabrique_P.Concret_1_P;
