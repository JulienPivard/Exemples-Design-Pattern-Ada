with Produit_P;

package Fabrique_P is

   --  Fabrique abstraite
   type T_Fabrique is abstract tagged private;

   --  Fabrique un produit
   function Fabriquer (Fab : in T_Fabrique)
      return Produit_P.T_Pointeur_Prod is abstract;

private

   type T_Fabrique is abstract tagged null record;

end Fabrique_P;
