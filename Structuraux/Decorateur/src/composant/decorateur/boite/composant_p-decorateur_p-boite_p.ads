private with Composant_Class_P;

--  @summary
--  Décore le composant avec une boite autour du texte.
--  @description
--  Décore le composant avec une boite autour du texte.
--  @group Décorateur
package Composant_P.Decorateur_P.Boite_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Boite_T is new Decorateur_T with private;

   overriding
   procedure Ajouter
      (
         This      : in out Boite_T;
         Composant : in     Composant_T'Class
      );

   overriding
   function Faire
      (
         This    : in     Boite_T;
         Largeur : in     Texte_P.Largeur_T
      )
      return Texte_P.Texte_T;

private

   type Boite_T is new Decorateur_T with
      record
         Composant : Composant_Class_P.Holder :=
            Composant_Class_P.Empty_Holder;
      end record;

end Composant_P.Decorateur_P.Boite_P;
