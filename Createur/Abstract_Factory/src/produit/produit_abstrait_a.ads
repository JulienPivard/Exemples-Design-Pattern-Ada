package Produit_Abstrait_A is

   --  Produit abstrait de type A.
   type Prod_Abs_A is abstract tagged private;
   --  Pointeur vers un produit de type A
   type Pointeur_Prod_Abs_A is access Prod_Abs_A'Class;

   --  Le produit A s'annonce.
   procedure Annonce (Produit : in Prod_Abs_A) is abstract;

private

   type Prod_Abs_A is abstract tagged null record;

end Produit_Abstrait_A;
