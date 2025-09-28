--  @summary
--  Démonstration du pattern Composite.
--  @description
--  Classe concrète qui ne contient aucun enfant, mais une valeur finale.
--  @group Composite
package Composant_P.Feuille_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   E_Ajout_Impossible : exception;

   type Feuille_T is new Composant_T with private;

   function Construire
      (Valeur : in     Valeur_P.Valeur_T)
      return Feuille_T;

   overriding
   function Faire
      (This : in     Feuille_T)
      return Valeur_P.Valeur_T;

   overriding
   procedure Ajouter
      (
         This     : in out Feuille_T;
         Compoant : in     Composant_T'Class;
         Position : in     ID_T
      );

   overriding
   procedure Supprimer
      (
         This     : in out Feuille_T;
         Position : in     ID_T
      );

   overriding
   function Lire_Enfant
      (
         This     : in     Feuille_T;
         Position : in     ID_T
      )
      return Composant_T'Class;

   overriding
   function Lire_NB_Enfants
      (This : in     Feuille_T)
      return NB_Enfants_T;

   overriding
   function Image
      (This : in     Feuille_T)
      return String;

private

   type Feuille_T is new Composant_T with
      record
         Valeur : Valeur_P.Valeur_T := Valeur_P.Valeur_T'First;
      end record;

end Composant_P.Feuille_P;
