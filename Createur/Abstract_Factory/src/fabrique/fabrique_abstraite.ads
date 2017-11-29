with Produit_Abstrait_A;
with Produit_Abstrait_B;

package Fabrique_Abstraite is

   --  Fabrique
   type Fab_Abs is abstract tagged private;

   --  Permet de créer un produit de type A.
   function Creer_Produit_A (Fabrique : in Fab_Abs)
      return Produit_Abstrait_A.Pointeur_Prod_Abs_A is abstract;

   --  Permet de créer un produit de type B.
   function Creer_Produit_B (Fabrique : in Fab_Abs)
      return Produit_Abstrait_B.Pointeur_Prod_Abs_B is abstract;

private

   type Fab_Abs is abstract tagged null record;

end Fabrique_Abstraite;
