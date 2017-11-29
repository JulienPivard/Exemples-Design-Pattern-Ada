package Produit_Abstrait_A.Produit_Concret_A_Deux is

   type Prod_A_Deux is new Prod_Abs_A with private;

   --  Le produit concret a 2 s'annonce lui même.
   overriding
   procedure Annonce (Produit : in Prod_A_Deux);

private

   type Prod_A_Deux is new Prod_Abs_A with null record;

end Produit_Abstrait_A.Produit_Concret_A_Deux;
