--  @summary
--  Une autre version du memento.
--  @description
--  Toute la logique de sauvegarde et de restauration sont dans
--  cette classe et pas dans l'auteur. Le memento a un accès direct
--  à la structure interne de l'auteur.
--  @group Memento
package Auteur_P.Memento_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Memento_T is tagged private;

   function Memoriser
      (Auteur : in     Auteur_T)
      return Memento_T;

   procedure Restaurer
      (
         This   : in     Memento_T;
         Auteur : in out Auteur_T
      );

private

   type Memento_T is tagged
      record
         Valeur : Valeur_P.Valeur_T;
      end record;

end Auteur_P.Memento_P;
