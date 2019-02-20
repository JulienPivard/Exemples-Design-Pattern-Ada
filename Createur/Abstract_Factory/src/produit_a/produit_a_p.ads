package Produit_A_P is

   type Produit_T is abstract tagged private;
   --  Produit abstrait de type A.

   type Produit_A is access Produit_T'Class;
   --  Pointeur vers un produit de type A.

   procedure Annonce
      (Produit : in Produit_T)
   is abstract;
   --  Le produit A s'annonce.
   --  @param Produit
   --  Le produit.

private

   type Produit_T is abstract tagged null record;

end Produit_A_P;
