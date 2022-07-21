with Produit_P.Concret_1_P;

package body Fabrique_P.Concret_1_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   function Fabriquer
      (This : in     Concret_T)
      return Produit_P.Produit_T'Class
   is
      P : constant Produit_P.Concret_1_P.Concret_T :=
         Produit_P.Concret_1_P.Produit_Vide;

      pragma Unreferenced (This);
   begin
      return P;
   end Fabriquer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Fabrique_P.Concret_1_P;
