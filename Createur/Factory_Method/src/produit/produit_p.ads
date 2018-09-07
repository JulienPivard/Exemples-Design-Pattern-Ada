package Produit_P is

   --  Produit abstrait
   type Produit_T is abstract tagged private;
   --  Pointeur de classe vers un produit.
   type Pointeur_Produit_T is access Produit_T'Class;

   --  Permet de créer un produit.
   procedure Creer_Produit (Produit : out Produit_T) is abstract;

   --  Affiche le produit.
   procedure Afficher (Produit : in Produit_T) is abstract;

private

   type Produit_T is abstract tagged null record;

end Produit_P;
