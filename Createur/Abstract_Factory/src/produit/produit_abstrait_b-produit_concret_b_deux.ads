package Produit_Abstrait_B.Produit_Concret_B_Deux is

   type Prod_B_Deux is new Prod_Abs_B with private;

   --  Le produit concret b 2 se présente lui même.
   overriding
   procedure Presente (Produit : in Prod_B_Deux);

private

   type Prod_B_Deux is new Prod_Abs_B with null record;

end Produit_Abstrait_B.Produit_Concret_B_Deux;
