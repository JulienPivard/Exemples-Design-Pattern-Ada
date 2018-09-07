with Produit_P;

package Fabrique_P.Concret_P is

   --  Fabrique concrète
   type Concret_T is new Fabrique_T with private;

   --  Permet de construire un nouveau produit.
   overriding
   function Fabriquer
      (Fabrique : in Concret_T)
      return Produit_P.Produit_T'Class;

private

   type Concret_T is new Fabrique_T with null record;

end Fabrique_P.Concret_P;
