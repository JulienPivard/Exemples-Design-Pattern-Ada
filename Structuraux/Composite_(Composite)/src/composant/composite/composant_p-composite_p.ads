private with Composant_P.Holder_P;

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
   function Faire
      (This : in     Composite_T)
      return Valeur_P.Valeur_T;

   overriding
   procedure Ajouter
      (
         This     : in out Composite_T;
         Compoant : in     Composant_T'Class;
         Position : in     ID_T
      );

   overriding
   procedure Supprimer
      (
         This     : in out Composite_T;
         Position : in     ID_T
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

   overriding
   function Image
      (This : in     Composite_T)
      return String;

private

   type Composite_T is new Composant_T with
      record
         Enfant_1 : Holder_P.Holder := Holder_P.Empty_Holder;
         Enfant_2 : Holder_P.Holder := Holder_P.Empty_Holder;
      end record;

   function Lire_Gauche
      (This : in     Composite_T)
      return String;

   function Lire_Droite
      (This : in     Composite_T)
      return String;

end Composant_P.Composite_P;
