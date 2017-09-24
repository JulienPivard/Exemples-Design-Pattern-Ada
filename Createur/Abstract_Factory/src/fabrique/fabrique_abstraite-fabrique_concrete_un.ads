package Fabrique_Abstraite.Fabrique_Concrete_Un is

    type Fab_Conc_Un is new Fab_Abs with private;

    --  Permet de créer un produit de type A un.
    overriding
    function Creer_Produit_A (Fabrique : in Fab_Conc_Un)
        return Produit_Abstrait_A.Pointeur_Prod_Abs_A;

    --  Permet de créer un produit de type B un.
    overriding
    function Creer_Produit_B (Fabrique : in Fab_Conc_Un)
        return Produit_Abstrait_B.Pointeur_Prod_Abs_B;

private

    type Fab_Conc_Un is new Fab_Abs with null record;

end Fabrique_Abstraite.Fabrique_Concrete_Un;
