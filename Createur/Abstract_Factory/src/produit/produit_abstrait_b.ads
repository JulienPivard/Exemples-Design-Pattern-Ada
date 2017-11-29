package Produit_Abstrait_B is

   type Prod_Abs_B is abstract tagged private;
   type Pointeur_Prod_Abs_B is access Prod_Abs_B'Class;

   --  Le produit B se présente.
   procedure Presente (Produit : in Prod_Abs_B) is abstract;

private

   type Prod_Abs_B is abstract tagged null record;

end Produit_Abstrait_B;
