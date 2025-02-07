--  @summary
--  État remplacement.
--  @description
--  L'application est dans l'état remplacement.
--  @group Etat
package Etat_P.Remplacement_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Remplacement_T is new Etat_T with private;

   function Creer
      return Remplacement_T;

   overriding
   procedure Presse_E
      (This : in out Remplacement_T);

   overriding
   procedure Presse_I
      (This : in out Remplacement_T);

   overriding
   procedure Presse_V
      (This : in out Remplacement_T);

   overriding
   procedure Presse_R
      (This : in out Remplacement_T);

   overriding
   procedure Presse_Esc
      (This : in out Remplacement_T);

   overriding
   function Lire_ID
      (This : in     Remplacement_T)
      return ID_Etat_T;

private

   type Remplacement_T is new Etat_T with
      record
         null;
      end record;

   function Creer
      return Remplacement_T
   is (Remplacement_T'(null record));

   overriding
   function Lire_ID
      (This : in     Remplacement_T)
      return ID_Etat_T
   is (Remplacement);

end Etat_P.Remplacement_P;
