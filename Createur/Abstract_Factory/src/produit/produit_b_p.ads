package Produit_B_P is

   type Produit_T is abstract tagged private;
   type Pointeur_Prod_B_T is access Produit_T'Class;

   --  Le produit B se présente.
   procedure Presente (Produit : in Produit_T) is abstract;

private

   type Produit_T is abstract tagged null record;

end Produit_B_P;
