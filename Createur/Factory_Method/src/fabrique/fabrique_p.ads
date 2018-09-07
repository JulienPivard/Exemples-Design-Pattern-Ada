with Produit_P;

package Fabrique_P is

   --  Fabrique abstraite
   type Fabrique_T is abstract tagged private;

   --  Fabrique un produit
   function Fabriquer (Fabrique : in Fabrique_T)
      return Produit_P.Produit_T'Class is abstract;

private

   type Fabrique_T is abstract tagged null record;

end Fabrique_P;
