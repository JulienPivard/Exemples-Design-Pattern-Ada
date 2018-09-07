package Produit_A_P.Produit_Deux_P is

   type Produit_Deux_T is new Produit_T with private;

   --  Le produit concret a 2 s'annonce lui même.
   overriding
   procedure Annonce (Produit : in Produit_Deux_T);

private

   type Produit_Deux_T is new Produit_T with null record;

end Produit_A_P.Produit_Deux_P;
