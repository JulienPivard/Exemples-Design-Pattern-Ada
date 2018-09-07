package Fabrique_P.Fabrique_Un_P is

   type Fabrique_Un_T is new Fabrique_T with private;

   --  Permet de créer un produit de type A un.
   overriding
   function Creer_Produit_A (Fabrique : in Fabrique_Un_T)
      return Produit_A_P.Produit_T'Class;

   --  Permet de créer un produit de type B un.
   overriding
   function Creer_Produit_B (Fabrique : in Fabrique_Un_T)
      return Produit_B_P.Produit_T'Class;

private

   type Fabrique_Un_T is new Fabrique_T with null record;

end Fabrique_P.Fabrique_Un_P;
