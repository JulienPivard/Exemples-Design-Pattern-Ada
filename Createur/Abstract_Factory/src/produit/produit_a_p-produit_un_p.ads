package Produit_A_P.Produit_Un_P is

   type Produit_Un_T is new Produit_T with private;
   --  Un produit de type A en version 1.

   overriding
   procedure Annonce
      (Produit : in Produit_Un_T);
   --  Le produit concret A1 s'annonce lui même.
   --  @param Produit
   --  Le produit.

private

   type Produit_Un_T is new Produit_T with null record;

end Produit_A_P.Produit_Un_P;
