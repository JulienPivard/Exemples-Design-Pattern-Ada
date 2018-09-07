with Produit_P;

package Fabrique_P.Concret_P is

   --  Fabrique concrète
   type T_Fab_Conc is new T_Fabrique with private;

   --  Permet de construire un nouveau produit.
   overriding
   function Fabriquer
      (Fab : in T_Fab_Conc)
      return Produit_P.T_Pointeur_Prod;

private

   type T_Fab_Conc is new T_Fabrique with null record;

end Fabrique_P.Concret_P;
