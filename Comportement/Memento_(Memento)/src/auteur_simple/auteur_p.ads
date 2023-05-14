with Valeur_P;

--  @summary
--  Une autre version du memento.
--  @description
--  Dans cette version l'auteur ne connais rien du memento,
--  toute la logique de sauvegarde est dans le memento et
--  pas dans l'auteur.
--  @group Memento
package Auteur_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Auteur_T is tagged private;

   function Creer
      (Valeur : in     Valeur_P.Valeur_T)
      return Auteur_T;

   procedure Modifier
      (
         This   : in out Auteur_T;
         Valeur : in     Valeur_P.Valeur_T
      );

   function Lire_Valeur
      (This : in     Auteur_T)
      return Valeur_P.Valeur_T;

private

   type Auteur_T is tagged
      record
         Valeur : Valeur_P.Valeur_T;
      end record;

end Auteur_P;
