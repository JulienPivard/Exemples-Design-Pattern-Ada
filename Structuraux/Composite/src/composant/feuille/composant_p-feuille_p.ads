--  @summary
--  Démonstration du pattern Composite.
--  @description
--  Classe concrète qui ne contient aucun enfant, mais une valeur finale.
--  @group Composite
package Composant_P.Feuille_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   E_Ajout_Impossible       : exception;
   E_Suppression_Impossible : exception;

   type Feuille_T is new Composant_T with private;

   function Construire
      (Valeur : in     Valeur_P.Valeur_T)
      return Feuille_T;

   overriding
   procedure Faire
      (This : in     Feuille_T);

   overriding
   procedure Ajouter
      (
         This   : in out Feuille_T;
         Valeur : in     Valeur_P.Valeur_T
      );

   overriding
   procedure Supprimer
      (
         This   : in out Feuille_T;
         Valeur : in     Valeur_P.Valeur_T
      );

   overriding
   function Lire_Enfant
      (
         This     : in     Feuille_T;
         Position : in     Id_T
      )
      return Composant_T'Class;

   overriding
   function Lire_Nb_Enfants
      (This : in     Feuille_T)
      return Nb_Enfants_T;

private

   type Feuille_T is new Composant_T with
      record
         Valeur : Valeur_P.Valeur_T := Valeur_P.Valeur_T'First;
      end record;

end Composant_P.Feuille_P;
