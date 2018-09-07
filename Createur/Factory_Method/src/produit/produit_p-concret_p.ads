package Produit_P.Concret_P is

   --  Un produit de type concret.
   type T_Prod_Conc is new T_Produit with private;

   --  Crée un produit concret.
   overriding
   procedure Creer_Produit (Prod : out T_Prod_Conc);

   --  Affiche le produit concret.
   overriding
   procedure Afficher (Prod : in T_Prod_Conc);

private

   type T_Prod_Conc is new T_Produit with
      record
         Contenu : String (1 .. 10);
      end record;

end Produit_P.Concret_P;
