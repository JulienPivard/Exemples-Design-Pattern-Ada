package Fabrique_Abstraite.Fabrique_Concrete_Deux is

   type Fab_Conc_Deux is new Fab_Abs with private;

   --  Permet de créer un produit de type A deux.
   overriding
   function Creer_Produit_A (Fabrique : in Fab_Conc_Deux)
      return Produit_Abstrait_A.Pointeur_Prod_Abs_A;

   --  Permet de créer un produit de type B deux.
   overriding
   function Creer_Produit_B (Fabrique : in Fab_Conc_Deux)
      return Produit_Abstrait_B.Pointeur_Prod_Abs_B;

private

   type Fab_Conc_Deux is new Fab_Abs with null record;

end Fabrique_Abstraite.Fabrique_Concrete_Deux;
