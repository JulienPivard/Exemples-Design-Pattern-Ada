--  @summary
--  État insertion.
--  @description
--  L'application est dans l'état insertion.
--  @group Etat
package Etat_P.Insertion_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Insertion_T is new Etat_T with private;

   function Creer
      return Insertion_T;

   overriding
   procedure Presse_E
      (This : in out Insertion_T);

   overriding
   procedure Presse_I
      (This : in out Insertion_T);

   overriding
   procedure Presse_Esc
      (This : in out Insertion_T);

   overriding
   function Lire_Id
      (This : in     Insertion_T)
      return Id_Etat_T;

private

   type Insertion_T is new Etat_T with
      record
         null;
      end record;

   function Creer
      return Insertion_T
   is (Insertion_T'(null record));

   overriding
   function Lire_Id
      (This : in     Insertion_T)
      return Id_Etat_T
   is (Insertion);

end Etat_P.Insertion_P;
