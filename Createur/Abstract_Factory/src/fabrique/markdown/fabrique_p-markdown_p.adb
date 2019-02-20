with Produit_A_P.Markdown_P;
with Produit_B_P.Markdown_P;

package body Fabrique_P.Markdown_P is

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_A
      (Fabrique : in Fabrique_Un_T)
      return Produit_A_P.Produit_T'Class
   is
      pragma Unreferenced (Fabrique);
      P : Produit_A_P.Markdown_P.Produit_Un_T;
   begin
      return P;
   end Creer_Produit_A;

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_B
      (Fabrique : in Fabrique_Un_T)
      return Produit_B_P.Produit_T'Class
   is
      pragma Unreferenced (Fabrique);
      P : Produit_B_P.Markdown_P.Produit_Un_T;
   begin
      return P;
   end Creer_Produit_B;

end Fabrique_P.Markdown_P;
