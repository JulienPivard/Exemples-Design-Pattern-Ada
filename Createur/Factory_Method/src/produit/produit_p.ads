package Produit_P is

   type Produit_T is abstract tagged private;
   --  Produit abstrait

   type Produit_A is access Produit_T'Class;
   --  Pointeur de classe vers un produit.

   procedure Creer_Produit
      (Produit : in out Produit_T)
   is abstract;
   --  Permet de créer un produit.
   --  @param Produit
   --  Le produit à créer.

   procedure Afficher
      (Produit : in Produit_T)
   is abstract;
   --  Affiche le produit.
   --  @param Produit
   --  Le produit à afficher.

private

   type Produit_T is abstract tagged null record;

end Produit_P;
