package Fabrique_P.Fabrique_Un_P is

   type Fabrique_Un_T is new Fabrique_T with private;

   --  Permet de créer un produit de type A un.
   overriding
   function Creer_Produit_A (Fabrique : in Fabrique_Un_T)
      return Produit_A_P.Pointeur_Prod_A_T;

   --  Permet de créer un produit de type B un.
   overriding
   function Creer_Produit_B (Fabrique : in Fabrique_Un_T)
      return Produit_B_P.Pointeur_Prod_B_T;

private

   type Fabrique_Un_T is new Fabrique_T with null record;

end Fabrique_P.Fabrique_Un_P;
