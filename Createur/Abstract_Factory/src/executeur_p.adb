with Produit_A_P;
with Produit_B_P;

package body Executeur_P is

   procedure Construire (Fabrique : Fabrique_P.Fabrique_T'Class) is
      produit_a : Produit_A_P.Pointeur_Prod_A_T;
      produit_b : Produit_B_P.Pointeur_Prod_B_T;
   begin
      produit_a := Fabrique.Creer_Produit_A;
      produit_a.all.Annonce;

      produit_b := Fabrique.Creer_Produit_B;
      produit_b.all.Presente;
   end Construire;

end Executeur_P;
