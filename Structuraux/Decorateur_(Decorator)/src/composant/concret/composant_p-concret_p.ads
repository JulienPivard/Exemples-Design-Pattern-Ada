with Ada.Strings.Unbounded;

--  @summary
--  Version concrète de notre composant.
--  @description
--  Affiche du texte en limitant le nombre de caractères.
--  @group Decorateur
package Composant_P.Concret_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Concret_T is new Composant_T with private;

   not overriding
   function Initialiser
      (Text : in     String)
      return Concret_T;

   overriding
   function Faire
      (
         This    : in     Concret_T;
         Largeur : in     Texte_P.Largeur_T;
         Hauteur : in     Texte_P.Nb_Lignes_T
      )
      return Texte_P.Texte_T;

private

   package Str_R renames Ada.Strings.Unbounded;

   type Concret_T is new Composant_T with
      record
         Text : Ada.Strings.Unbounded.Unbounded_String;
      end record;

end Composant_P.Concret_P;
