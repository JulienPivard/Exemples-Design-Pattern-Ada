package Produit_P.Concret_P is

   --  Un produit de type concret.
   type Concret_T is new Produit_T with private;

   --  Crée un produit concret.
   overriding
   procedure Creer_Produit (Produit : out Concret_T);

   --  Affiche le produit concret.
   overriding
   procedure Afficher (Produit : in Concret_T);

private

   type Concret_T is new Produit_T with
      record
         Contenu : String (1 .. 10);
      end record;

end Produit_P.Concret_P;
