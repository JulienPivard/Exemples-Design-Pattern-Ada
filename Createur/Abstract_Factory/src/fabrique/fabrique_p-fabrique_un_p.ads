package Fabrique_P.Fabrique_Un_P is

   type Fab_Conc_Un is new Fab_Abs with private;

   --  Permet de créer un produit de type A un.
   overriding
   function Creer_Produit_A (Fabrique : in Fab_Conc_Un)
      return Produit_A_P.Pointeur_Prod_Abs_A;

   --  Permet de créer un produit de type B un.
   overriding
   function Creer_Produit_B (Fabrique : in Fab_Conc_Un)
      return Produit_B_P.Pointeur_Prod_Abs_B;

private

   type Fab_Conc_Un is new Fab_Abs with null record;

end Fabrique_P.Fabrique_Un_P;
