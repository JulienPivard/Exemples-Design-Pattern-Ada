with P_Produit.Concret;

package body P_Fabrique.Concret is

    ---------------------------------------------------------------------------
    overriding
    function Fabriquer (Fab : in T_Fab_Conc)
        return P_Produit.T_Pointeur_Prod
    is
        pragma Unreferenced (Fab);
    begin
        return new P_Produit.Concret.T_Prod_Conc;
    end Fabriquer;

end P_Fabrique.Concret;
