--  @summary
--  Un produit concret.
--  @description
--  Un produit concret.
--  @group Produit
package Produit_P.Concret_1_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Concret_T is new Produit_T with private;
   --  Un produit de type concret.

   Produit_Vide : constant Concret_T;

   overriding
   procedure Initialiser
      (This : in out Concret_T);
   --  Crée un produit concret.
   --  @param This
   --  Le produit à créer.

   overriding
   procedure Afficher
      (This : in     Concret_T);
   --  Affiche le produit concret.
   --  @param This
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

   Produit_Vide : constant Concret_T := Concret_T'(Contenu => "          ");

end Produit_P.Concret_1_P;
