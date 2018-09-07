with Produit_A_P;
with Produit_B_P;

package Fabrique_P is

   --  Fabrique
   type Fabrique_T is abstract tagged private;

   --  Permet de créer un produit de type A.
   function Creer_Produit_A (Fabrique : in Fabrique_T)
      return Produit_A_P.Pointeur_Prod_A_T is abstract;

   --  Permet de créer un produit de type B.
   function Creer_Produit_B (Fabrique : in Fabrique_T)
      return Produit_B_P.Pointeur_Prod_B_T is abstract;

private

   type Fabrique_T is abstract tagged null record;

end Fabrique_P;
