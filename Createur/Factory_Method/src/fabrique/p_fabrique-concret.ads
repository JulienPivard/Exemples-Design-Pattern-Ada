with P_Produit;

package P_Fabrique.Concret is

   --  Fabrique concrète
   type T_Fab_Conc is new P_Fabrique.T_Fabrique with private;

   --  Permet de construire un nouveau produit.
   overriding
   function Fabriquer (Fab : in T_Fab_Conc) return P_Produit.T_Pointeur_Prod;

private

   type T_Fab_Conc is new P_Fabrique.T_Fabrique with null record;

end P_Fabrique.Concret;
