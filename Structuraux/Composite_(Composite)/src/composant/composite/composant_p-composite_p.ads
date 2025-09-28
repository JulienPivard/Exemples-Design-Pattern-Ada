private with Ada.Containers.Indefinite_Holders;

--  @summary
--  Démonstration du pattern Composite.
--  @description
--  Classe concrète qui contiendra deux enfants.
--  @group Composite
package Composant_P.Composite_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Composite_T is new Composant_T with private;

   overriding
   procedure Faire
      (This : in     Composite_T);

   overriding
   procedure Ajouter
      (
         This   : in out Composite_T;
         Valeur : in     Valeur_P.Valeur_T
      );

   overriding
   procedure Supprimer
      (
         This   : in out Composite_T;
         Valeur : in     Valeur_P.Valeur_T
      );

   overriding
   function Lire_Enfant
      (
         This     : in     Composite_T;
         Position : in     ID_T
      )
      return Composant_T'Class;

   overriding
   function Lire_Nb_Enfants
      (This : in     Composite_T)
      return Nb_Enfants_T;

private

   package Enfant_P is new Ada.Containers.Indefinite_Holders
      (Element_Type => Composant_T'Class);

   type Composite_T is new Composant_T with
      record
         Enfant_1 : Enfant_P.Holder := Enfant_P.Empty_Holder;
         Enfant_2 : Enfant_P.Holder := Enfant_P.Empty_Holder;
      end record;

end Composant_P.Composite_P;
