package Produit_A_P.Produit_Un_P is

   type Produit_Un_T is new Produit_T with private;

   --  Le produit concret a 1 s'annonce lui même.
   overriding
   procedure Annonce (Produit : in Produit_Un_T);

private

   type Produit_Un_T is new Produit_T with null record;

end Produit_A_P.Produit_Un_P;
