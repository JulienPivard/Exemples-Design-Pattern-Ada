package Produit_B_P.Produit_Deux_P is

   type Produit_Deux_T is new Produit_T with private;

   --  Le produit concret b 2 se présente lui même.
   overriding
   procedure Presente (Produit : in Produit_Deux_T);

private

   type Produit_Deux_T is new Produit_T with null record;

end Produit_B_P.Produit_Deux_P;
