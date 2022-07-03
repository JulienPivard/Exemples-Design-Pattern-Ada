with Ada.Containers.Indefinite_Holders;

with Contexte_P;

--  @summary
--  Classe abstraite de la chaine de responsabilité.
--  @description
--  Classe abstraite de la chaine de responsabilité.
--  @group Chaine de Responsabilité
package Gestionnaire_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Gestionnaire_T is interface;

   procedure Ajouter_Successeur
      (
         This       : in out Gestionnaire_T;
         Successeur : in     Gestionnaire_T'Class
      )
   is abstract;

   function Possede_Successeur
      (This : in     Gestionnaire_T)
      return Boolean
   is abstract;

   function Lire_Successeur
      (This : in     Gestionnaire_T)
      return Gestionnaire_T'Class
   is abstract;

   procedure Remplacer
      (
         This       : in out Gestionnaire_T;
         Successeur : in     Gestionnaire_T'Class
      )
   is abstract;

   procedure Faire_Action
      (
         This     : in out Gestionnaire_T;
         Contexte : in     Contexte_P.Action_T
      )
   is abstract;

   procedure Gerer_Requete
      (
         This     : in out Gestionnaire_T'Class;
         Contexte : in     Contexte_P.Action_T
      );

   type Chaine_De_Responsabilite_T is abstract new Gestionnaire_T with private;

   overriding
   procedure Ajouter_Successeur
      (
         This       : in out Chaine_De_Responsabilite_T;
         Successeur : in     Gestionnaire_T'Class
      );

   overriding
   function Possede_Successeur
      (This : in     Chaine_De_Responsabilite_T)
      return Boolean;

   overriding
   function Lire_Successeur
      (This : in     Chaine_De_Responsabilite_T)
      return Gestionnaire_T'Class;

   overriding
   procedure Remplacer
      (
         This       : in out Chaine_De_Responsabilite_T;
         Successeur : in     Gestionnaire_T'Class
      );

   overriding
   procedure Faire_Action
      (
         This     : in out Chaine_De_Responsabilite_T;
         Contexte : in     Contexte_P.Action_T
      )
   is abstract;

private

   package Successeur_P is new Ada.Containers.Indefinite_Holders
      (Element_Type => Gestionnaire_T'Class);

   subtype Successeur_T is Successeur_P.Holder;

   type Chaine_De_Responsabilite_T is abstract new Gestionnaire_T with
      record
         Successeur : Successeur_T := Successeur_P.Empty_Holder;
      end record;

end Gestionnaire_P;
