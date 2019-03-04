--  @summary
--  Un produit concret.
--  @description
--  Un produit concret.
--  @group Produit
package Produit_P.Concret_P is

   type Concret_T is new Produit_T with private;
   --  Un produit de type concret.

   overriding
   procedure Creer_Produit
      (Produit : out Concret_T);
   --  Crée un produit concret.
   --  @param Produit
   --  Le produit à créer.

   overriding
   procedure Afficher
      (Produit : in Concret_T);
   --  Affiche le produit concret.
   --  @param Produit
   --  Le produit à afficher.

private

   type Concret_T is new Produit_T with
      record
         Contenu : String (1 .. 10);
      end record;

end Produit_P.Concret_P;
