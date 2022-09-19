--  @summary
--  État commande.
--  @description
--  L'application est dans l'état commande.
--  @group Etat
package Etat_P.Commande_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Commande_T is new Etat_T with private;

   function Creer
      return Commande_T;

   overriding
   procedure Presse_E
      (This : in out Commande_T);

   overriding
   procedure Presse_I
      (This : in out Commande_T);

   overriding
   procedure Presse_V
      (This : in out Commande_T);

   overriding
   procedure Presse_R
      (This : in out Commande_T);

   overriding
   procedure Presse_Esc
      (This : in out Commande_T);

   overriding
   function Lire_Id
      (This : in     Commande_T)
      return Id_Etat_T;

private

   type Commande_T is new Etat_T with
      record
         null;
      end record;

   function Creer
      return Commande_T
   is (Commande_T'(null record));

   overriding
   function Lire_Id
      (This : in     Commande_T)
      return Id_Etat_T
   is (Commande);

end Etat_P.Commande_P;
