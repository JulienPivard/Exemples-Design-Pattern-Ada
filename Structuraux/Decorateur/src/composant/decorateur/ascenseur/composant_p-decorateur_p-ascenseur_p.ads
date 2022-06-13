private with Composant_Class_P;

--  @summary
--  Décore le composant avec un ascenseur à droite du texte.
--  @description
--  Décore le composant avec un ascenseur à droite du texte.
--  @group Décorateur
package Composant_P.Decorateur_P.Ascenseur_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Ascenseur_T is new Decorateur_T with private;

   overriding
   procedure Ajouter
      (
         This      : in out Ascenseur_T;
         Composant : in     Composant_T'Class
      );

   overriding
   function Faire
      (
         This    : in     Ascenseur_T;
         Largeur : in     Largeur_P.Largeur_T
      )
      return Largeur_P.Texte_T;

private

   type Ascenseur_T is new Decorateur_T with
      record
         Composant : Composant_Class_P.Holder :=
            Composant_Class_P.Empty_Holder;
      end record;

end Composant_P.Decorateur_P.Ascenseur_P;
