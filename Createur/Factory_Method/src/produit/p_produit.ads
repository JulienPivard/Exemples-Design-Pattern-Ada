package P_Produit is

    --  Produit abstrait
    type T_Produit is abstract tagged private;
    --  Pointeur de classe vers un produit.
    type T_Pointeur_Prod is access T_Produit'Class;

    --  Permet de créer un produit.
    procedure Creer_Produit (Prod : out T_Produit) is abstract;

    --  Affiche le produit.
    procedure Afficher (Prod : in T_Produit) is abstract;

private

    type T_Produit is abstract tagged null record;

end P_Produit;
