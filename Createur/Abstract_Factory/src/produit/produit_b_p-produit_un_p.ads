package Produit_B_P.Produit_Un_P is

   type Produit_Un_T is new Produit_T with private;

   --  Le produit concret b 1 se présente elle même.
   overriding
   procedure Presente (Produit : in Produit_Un_T);

private

   type Produit_Un_T is new Produit_T with null record;

end Produit_B_P.Produit_Un_P;
