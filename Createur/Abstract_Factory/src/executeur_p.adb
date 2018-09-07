with Produit_A_P;
with Produit_B_P;

package body Executeur_P is

   procedure Construire (Fabrique : Fabrique_P.Fabrique_T'Class) is
      produit_a : constant Produit_A_P.Produit_T'Class :=
         Fabrique.Creer_Produit_A;
      produit_b : constant Produit_B_P.Produit_T'Class :=
         Fabrique.Creer_Produit_B;
   begin
      produit_a.Annonce;
      produit_b.Presente;
   end Construire;

end Executeur_P;
