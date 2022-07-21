--  @summary
--  Un produit concret.
--  @description
--  Un produit concret.
--  @group Produit
package Produit_P.Concret_2_P
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

   type Etat_T is (Ouvert, Fermee, Bloquee);
   --  Les états que peux prendre le produit.

   type Concret_T is new Produit_T with
      record
         Etat : Etat_T;
         --  Le contenu du produit.
      end record;

   Produit_Vide : constant Concret_T := Concret_T'(Etat => Bloquee);

end Produit_P.Concret_2_P;
