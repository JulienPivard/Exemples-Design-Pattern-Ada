with Produit_Abstrait_A;
with Produit_Abstrait_B;

package body Executeur is

    procedure Construire (Fabrique : access Fab_Abs'Class) is
        produit_a : Produit_Abstrait_A.Pointeur_Prod_Abs_A;
        produit_b : Produit_Abstrait_B.Pointeur_Prod_Abs_B;
    begin
        produit_a := Fabrique.all.Creer_Produit_A;
        produit_a.all.Annonce;

        produit_b := Fabrique.all.Creer_Produit_B;
        produit_b.all.Presente;
    end Construire;

end Executeur;
