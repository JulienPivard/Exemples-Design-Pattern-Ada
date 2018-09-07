package Fabrique_P.Fabrique_Deux_P is

   type Fab_Conc_Deux is new Fab_Abs with private;

   --  Permet de créer un produit de type A deux.
   overriding
   function Creer_Produit_A (Fabrique : in Fab_Conc_Deux)
      return Produit_A_P.Pointeur_Prod_Abs_A;

   --  Permet de créer un produit de type B deux.
   overriding
   function Creer_Produit_B (Fabrique : in Fab_Conc_Deux)
      return Produit_B_P.Pointeur_Prod_Abs_B;

private

   type Fab_Conc_Deux is new Fab_Abs with null record;

end Fabrique_P.Fabrique_Deux_P;
