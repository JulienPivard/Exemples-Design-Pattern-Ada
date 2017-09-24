with Produit_Abstrait_A.Produit_Concret_A_Un;
with Produit_Abstrait_B.Produit_Concret_B_Un;

use  Produit_Abstrait_A.Produit_Concret_A_Un;
use  Produit_Abstrait_B.Produit_Concret_B_Un;

package body Fabrique_Abstraite.Fabrique_Concrete_Un is

    ---------------------------------------------------------------------------
    overriding
    function Creer_Produit_A (Fabrique : in Fab_Conc_Un)
        return Produit_Abstrait_A.Pointeur_Prod_Abs_A
    is
        pragma Unreferenced (Fabrique);
    begin
        return new Prod_A_Un;
    end Creer_Produit_A;

    ---------------------------------------------------------------------------
    overriding
    function Creer_Produit_B (Fabrique : in Fab_Conc_Un)
        return Produit_Abstrait_B.Pointeur_Prod_Abs_B
    is
        pragma Unreferenced (Fabrique);
    begin
        return new Prod_B_Un;
    end Creer_Produit_B;

end Fabrique_Abstraite.Fabrique_Concrete_Un;
