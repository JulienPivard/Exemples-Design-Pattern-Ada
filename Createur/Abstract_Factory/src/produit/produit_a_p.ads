package Produit_A_P is

   --  Produit abstrait de type A.
   type Produit_T is abstract tagged private;
   --  Pointeur vers un produit de type A
   type Pointeur_Prod_A_T is access Produit_T'Class;

   --  Le produit A s'annonce.
   procedure Annonce (Produit : in Produit_T) is abstract;

private

   type Produit_T is abstract tagged null record;

end Produit_A_P;
