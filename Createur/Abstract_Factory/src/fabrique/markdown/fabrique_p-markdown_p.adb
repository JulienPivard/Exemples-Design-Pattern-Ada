with Produit_A_P.Markdown_P;
with Produit_B_P.Markdown_P;

package body Fabrique_P.Markdown_P is

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_A
      (Fabrique : in     Fabrique_Markdown_T)
      return Produit_A_P.Produit_T'Class
   is
      pragma Unreferenced (Fabrique);

      P : Produit_A_P.Markdown_P.Produit_Markdown_T;
   begin
      return P;
   end Creer_Produit_A;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Creer_Produit_B
      (Fabrique : in     Fabrique_Markdown_T)
      return Produit_B_P.Produit_T'Class
   is
      pragma Unreferenced (Fabrique);

      P : Produit_B_P.Markdown_P.Produit_Markdown_T;
   begin
      return P;
   end Creer_Produit_B;
   ---------------------------------------------------------------------------

end Fabrique_P.Markdown_P;
