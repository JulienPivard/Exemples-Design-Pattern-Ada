with Produit_A_P.Html_P;
with Produit_B_P.Html_P;

package body Fabrique_P.Html_P is

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_A
      (Fabrique : in Fabrique_Html_T)
      return Produit_A_P.Produit_T'Class
   is
      pragma Unreferenced (Fabrique);
      P : Produit_A_P.Html_P.Produit_Html_T;
   begin
      return P;
   end Creer_Produit_A;

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_B
      (Fabrique : in Fabrique_Html_T)
      return Produit_B_P.Produit_T'Class
   is
      pragma Unreferenced (Fabrique);
      P : Produit_B_P.Html_P.Produit_Html_T;
   begin
      return P;
   end Creer_Produit_B;

end Fabrique_P.Html_P;
