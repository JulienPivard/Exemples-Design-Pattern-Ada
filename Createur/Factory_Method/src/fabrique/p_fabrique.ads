with P_Produit;

package P_Fabrique is

    --  Fabrique abstraite
    type T_Fabrique is abstract tagged private;

    --  Fabrique un produit
    function Fabriquer (Fab : in T_Fabrique)
        return P_Produit.T_Pointeur_Prod is abstract;

private

    type T_Fabrique is abstract tagged null record;

end P_Fabrique;
