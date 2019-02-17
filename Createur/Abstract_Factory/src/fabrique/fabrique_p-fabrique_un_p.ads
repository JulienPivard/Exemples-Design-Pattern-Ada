package Fabrique_P.Fabrique_Un_P is

   type Fabrique_Un_T is new Fabrique_T with private;
   --  Une fabrique de produit en version un.

   overriding
   function Creer_Produit_A
      (Fabrique : in Fabrique_Un_T)
      return Produit_A_P.Produit_T'Class;
   --  Permet de créer un produit de type A version 1.
   --  @param Fabrique
   --  La fabrique.
   --  @return Le produit concret.

   overriding
   function Creer_Produit_B
      (Fabrique : in Fabrique_Un_T)
      return Produit_B_P.Produit_T'Class;
   --  Permet de créer un produit de type B version 1.
   --  @param Fabrique
   --  La fabrique.
   --  @return Le produit concret.

private

   type Fabrique_Un_T is new Fabrique_T with null record;

end Fabrique_P.Fabrique_Un_P;
