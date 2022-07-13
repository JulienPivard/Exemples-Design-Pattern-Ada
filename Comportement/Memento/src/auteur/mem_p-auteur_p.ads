private with Mem_P.Etat_P;

--  @summary
--  L'utilisateur du mémento.
--  @description
--  L'utilisateur du mémento.
--  @group Memento
package Mem_P.Auteur_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Memento_T is private;
   --  Mémorise l'état de l'auteur à un moment donné.

   type Auteur_T is tagged private;
   --  L'utilisateur du memento.

   procedure Modifier
      (
         This   : in out Auteur_T;
         Valeur : in     Valeur_T
      );
   --  Modifie la valeur stocké dans l'utilisateur.
   --  @param This
   --  L'utilisateur.
   --  @param Valeur
   --  La valeur à stocker.

   function Lire_Valeur
      (This : in     Auteur_T)
      return Valeur_T;
   --  Lit la valeur stockée.
   --  @param This
   --  L'utilisateur.
   --  @return La valeur dans l'utilisateur.

   function Memoriser
      (This : in     Auteur_T)
      return Memento_T;
   --  Crée un instantané d'un utilisateur.
   --  @param This
   --  L'utilisateur dont on veux créer un instantané.
   --  @return L'instantané.

   procedure Retablir
      (
         This    : in out Auteur_T;
         Memento : in     Memento_T
      );
   --  Rétabli l'utilisateur dans l'état mémorisé par le memento.
   --  @param This
   --  L'utilisateur qui va être rétabli à un état antérieur.
   --  @param Memento
   --  L'instantané.

private

   type Memento_T is
      record
         Etat : Etat_P.Etat_T;
         --  L'état sauvegardé.
      end record;

   type Auteur_T is tagged
      record
         Valeur : Mem_P.Valeur_T;
         --  La structure interne de l'auteur.
      end record;

end Mem_P.Auteur_P;
