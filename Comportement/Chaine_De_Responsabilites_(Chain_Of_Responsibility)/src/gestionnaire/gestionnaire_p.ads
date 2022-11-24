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

   type Chaine_De_Responsabilite_T is interface;

   procedure Ajouter
      (
         This       : in out Chaine_De_Responsabilite_T;
         Successeur : in     Chaine_De_Responsabilite_T'Class
      )
   is abstract;

   function Possede_Successeur
      (This : in     Chaine_De_Responsabilite_T)
      return Boolean
   is abstract;

   function Lire_Successeur
      (This : in     Chaine_De_Responsabilite_T)
      return Chaine_De_Responsabilite_T'Class
   is abstract;

   procedure Remplacer
      (
         This       : in out Chaine_De_Responsabilite_T;
         Successeur : in     Chaine_De_Responsabilite_T'Class
      )
   is abstract;

   procedure Faire_Action
      (
         This     : in out Chaine_De_Responsabilite_T;
         Contexte : in     Contexte_P.Action_T
      )
   is abstract;

   procedure Gerer_Requete
      (
         This     : in out Chaine_De_Responsabilite_T'Class;
         Contexte : in     Contexte_P.Action_T
      );

   subtype Parent_T is Chaine_De_Responsabilite_T;

   type Maillon_Abstrait_T is abstract new Parent_T with private;

   overriding
   procedure Ajouter
      (
         This       : in out Maillon_Abstrait_T;
         Successeur : in     Chaine_De_Responsabilite_T'Class
      );

   overriding
   function Possede_Successeur
      (This : in     Maillon_Abstrait_T)
      return Boolean;

   overriding
   function Lire_Successeur
      (This : in     Maillon_Abstrait_T)
      return Chaine_De_Responsabilite_T'Class;

   overriding
   procedure Remplacer
      (
         This       : in out Maillon_Abstrait_T;
         Successeur : in     Chaine_De_Responsabilite_T'Class
      );

   overriding
   procedure Faire_Action
      (
         This     : in out Maillon_Abstrait_T;
         Contexte : in     Contexte_P.Action_T
      )
   is abstract;

private

   package Successeur_P is new Ada.Containers.Indefinite_Holders
      (Element_Type => Chaine_De_Responsabilite_T'Class);

   subtype Successeur_T is Successeur_P.Holder;

   type Maillon_Abstrait_T is abstract new Chaine_De_Responsabilite_T with
      record
         Successeur : Successeur_T := Successeur_P.Empty_Holder;
      end record;

end Gestionnaire_P;
