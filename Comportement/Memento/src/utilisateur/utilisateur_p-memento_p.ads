--  @summary
--  Interface accessible à tout le monde extérieur du mémento.
--  @description
--  Interface accessible à tout le monde extérieur du mémento.
--  @group Mémento
package Utilisateur_P.Memento_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Memento_T is tagged private;
   --  L'instantané de l'utilisateur.

   function Creer
      (Utilisateur : in     Utilisateur_T)
      return Memento_T;
   --  Crée un instantané d'un utilisateur.
   --  @param Utilisateur
   --  L'utilisateur dont on veux créer un instantané.
   --  @return L'instantané.

   procedure Retablir
      (
         This        : in     Memento_T;
         Utilisateur : in out Utilisateur_T
      );
   --  Rétabli l'utilisateur dans l'état mémorisé par le memento.
   --  @param This
   --  L'instantané.
   --  @param Utilisateur
   --  L'utilisateur qui va être rétabli à un état antérieur.

private

   type Memento_T is tagged
      record
         Etat : Utilisateur_T;
         --  L'état mémorisé.
      end record;

end Utilisateur_P.Memento_P;
