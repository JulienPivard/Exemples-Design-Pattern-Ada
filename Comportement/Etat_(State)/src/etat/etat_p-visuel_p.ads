--  @summary
--  État visuel.
--  @description
--  L'application est dans l'état sélection visuel.
--  @group Etat
package Etat_P.Visuel_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Visuel_T is new Etat_T with private;

   function Creer
      return Visuel_T;

   overriding
   procedure Presse_E
      (This : in out Visuel_T);

   overriding
   procedure Presse_I
      (This : in out Visuel_T);

   overriding
   procedure Presse_V
      (This : in out Visuel_T);

   overriding
   procedure Presse_R
      (This : in out Visuel_T);

   overriding
   procedure Presse_Esc
      (This : in out Visuel_T);

   overriding
   function Lire_ID
      (This : in     Visuel_T)
      return ID_Etat_T;

private

   type Visuel_T is new Etat_T with
      record
         null;
      end record;

   function Creer
      return Visuel_T
   is (Visuel_T'(null record));

   overriding
   function Lire_ID
      (This : in     Visuel_T)
      return ID_Etat_T
   is (Visuel);

end Etat_P.Visuel_P;
