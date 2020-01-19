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
      (Produit : in out Concret_T);
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

   subtype Index_Contenu_T is Integer range 1 .. 10;
   --  Taille du contenant.
   subtype Contenu_T       is String  (Index_Contenu_T);
   --  Le contenant.

   type Concret_T is new Produit_T with
      record
         Contenu : Contenu_T;
         --  Le contenu du produit.
      end record;

end Produit_P.Concret_P;
