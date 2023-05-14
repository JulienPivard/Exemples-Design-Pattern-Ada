with Valeur_P;

limited with Simple_P.Memento_P;

--  @summary
--  L'utilisateur du mémento.
--  @description
--  L'utilisateur du mémento.
--  @group Memento
package Simple_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Utilisateur_T is tagged private;
   --  L'utilisateur qui va avoir besoin de mémoriser des états.

   procedure Modifier
      (
         This   : in out Utilisateur_T;
         Valeur : in     Valeur_P.Valeur_T
      );
   --  Modifie la valeur stocké dans l'utilisateur.
   --  @param This
   --  L'utilisateur.
   --  @param Valeur
   --  La valeur à stocker.

   function Lire_Valeur
      (This : in     Utilisateur_T)
      return Valeur_P.Valeur_T;
   --  Lit la valeur stockée.
   --  @param This
   --  L'utilisateur.
   --  @return La valeur dans l'utilisateur.

   function Memoriser
      (This : in     Utilisateur_T)
      return Memento_P.Memento_T;
   --  Crée un instantané d'un utilisateur.
   --  @param This
   --  L'utilisateur dont on veux créer un instantané.
   --  @return L'instantané.

   procedure Retablir
      (
         This    : in out Utilisateur_T;
         Memento : in     Memento_P.Memento_T
      );
   --  Rétabli l'utilisateur dans l'état mémorisé par le memento.
   --  @param This
   --  L'utilisateur qui va être rétabli à un état antérieur.
   --  @param Memento
   --  L'instantané.

private

   type Utilisateur_T is tagged
      record
         Valeur : Valeur_P.Valeur_T := Valeur_P.Valeur_T'First;
         --  État interne de l'utilisateur.
      end record;

end Simple_P;
