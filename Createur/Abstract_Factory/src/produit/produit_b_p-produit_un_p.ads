package Produit_B_P.Produit_Un_P is

   type Prod_B_Un is new Prod_Abs_B with private;

   --  Le produit concret b 1 se présente elle même.
   overriding
   procedure Presente (Produit : in Prod_B_Un);

private

   type Prod_B_Un is new Prod_Abs_B with null record;

end Produit_B_P.Produit_Un_P;
