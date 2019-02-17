package Fabrique_P.Fabrique_Deux_P is

   type Fabrique_Deux_T is new Fabrique_T with private;
   --  Une fabrique de produit en version deux.

   overriding
   function Creer_Produit_A
      (Fabrique : in Fabrique_Deux_T)
      return Produit_A_P.Produit_T'Class;
   --  Permet de créer un produit de type A version 2.
   --  @param Fabrique
   --  La fabrique.
   --  @return Le produit concret.

   overriding
   function Creer_Produit_B
      (Fabrique : in Fabrique_Deux_T)
      return Produit_B_P.Produit_T'Class;
   --  Permet de créer un produit de type B version 2.
   --  @param Fabrique
   --  La fabrique.
   --  @return Le produit concret.

private

   type Fabrique_Deux_T is new Fabrique_T with null record;

end Fabrique_P.Fabrique_Deux_P;
