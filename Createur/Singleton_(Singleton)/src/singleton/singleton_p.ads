private with Ada.Strings.Unbounded;

--  @summary
--  Représentation d'un singleton.
--  @description
--  Le singleton est bloqué en création avec le discriminant.
--  @group Créateur
package Singleton_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Singleton_T (<>) is tagged limited private;
   --  Représente un singleton avec un type discriminant.

   type Accesseur_T
      (Singleton : not null access Singleton_T)
   is limited private
      with Implicit_Dereference => Singleton;
   --  Accesseur protégeant le pointeur. Aucune déallocation
   --  du pointeur n'est possible puisque le fait que ce soit
   --  un discriminant en fait un pointeur constant. Le contenu
   --  pointé peut, par contre, être modifié.

   function Recuperer_Singleton
      return Accesseur_T;
   --  Permet de récupérer notre singleton.
   --  @return Le singleton

   procedure Changer_Nom
      (
         This : in out Singleton_T;
         Nom  : in     String
      );
   --  Permet de changer l'attribut variable
   --  @param This
   --  Le singleton
   --  @param Nom
   --  La nouvelle valeur de l'attribut.

   procedure Afficher
      (This : in     Singleton_T);
   --  Affiche le contenu du singleton.
   --  @param This
   --  Le singleton à afficher.

private

   package Nom_R renames Ada.Strings.Unbounded;

   type Singleton_T is tagged limited
      record
         Nom : Nom_R.Unbounded_String;
      end record;

   Unique : aliased Singleton_T;
   --  Singleton

   type Accesseur_T
      (Singleton : not null access Singleton_T)
   is limited null record;

end Singleton_P;
