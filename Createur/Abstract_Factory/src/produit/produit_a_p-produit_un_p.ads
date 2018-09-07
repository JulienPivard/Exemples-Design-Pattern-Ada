package Produit_A_P.Produit_Un_P is

   type Prod_A_Un is new Prod_Abs_A with private;

   --  Le produit concret a 1 s'annonce lui même.
   overriding
   procedure Annonce (Produit : in Prod_A_Un);

private

   type Prod_A_Un is new Prod_Abs_A with null record;

end Produit_A_P.Produit_Un_P;
