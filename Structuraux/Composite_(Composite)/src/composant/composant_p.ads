--  @summary
--  Démonstration du pattern Composite.
--  @description
--  Démonstration du pattern Composite.
--  Classe abstraite qui définira la base de la structure.
--  @group Composite
package Composant_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Composant_T is interface;

   procedure Faire
      (This : in     Composant_T)
   is abstract;

   type ID_T is range 1 .. 2;

   procedure Ajouter
      (
         This     : in out Composant_T;
         Compoant : in     Composant_T'Class;
         Position : in     ID_T
      )
   is abstract;

   procedure Supprimer
      (
         This     : in out Composant_T;
         Position : in     ID_T
      )
   is abstract;

   function Lire_Enfant
      (
         This     : in     Composant_T;
         Position : in     ID_T
      )
      return Composant_T'Class
   is abstract;

   type Nb_Enfants_T is range 0 .. 2**31 - 1;

   function Lire_Nb_Enfants
      (This : in     Composant_T)
      return Nb_Enfants_T
   is abstract;

end Composant_P;
