with Produit_A_P;
with Produit_B_P;

--  @summary
--  Représentation d'un fabrique abstraite.
--  @description
--  Abstraction d'une fabrique de plusieurs produits.
--  @group Fabrique
package Fabrique_P is

   type Fabrique_T is abstract tagged private;
   --  La fabrique de produits.

   function Creer_Produit_A
      (Fabrique : in     Fabrique_T)
      return Produit_A_P.Produit_T'Class
   is abstract;
   --  Permet de créer un produit de type A.
   --  @param Fabrique
   --  La fabrique.
   --  @return Le produit concret.

   function Creer_Produit_B
      (Fabrique : in     Fabrique_T)
      return Produit_B_P.Produit_T'Class
   is abstract;
   --  Permet de créer un produit de type B.
   --  @param Fabrique
   --  La fabrique.
   --  @return Le produit concret.

private

   type Fabrique_T is abstract tagged null record;

end Fabrique_P;
