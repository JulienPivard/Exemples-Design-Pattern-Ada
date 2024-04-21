--  @summary
--  Exemple de design pattern Singleton.
--  @description
--  Le singleton descendra d'une classe abstraite, permettant de
--  manipuler ses descendants.
--  @group Créateur
package Singleton_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Singleton_Interface_T is limited interface;
   --  Représente un singleton avec un type discriminant.

   type Accesseur_T
      (Singleton : not null access Singleton_Interface_T'Class)
   is limited private
      with Implicit_Dereference => Singleton;
   --  Accesseur protégeant le pointeur. Aucune déallocation
   --  du pointeur n'est possible puisque le fait que ce soit
   --  un discriminant en fait un pointeur constant. Le contenu
   --  pointé peut, par contre, être modifié.

   procedure Changer_Nom
      (
         This : in out Singleton_Interface_T;
         Nom  : in     String
      )
   is abstract;
   --  Permet de changer l'attribut variable
   --  @param This
   --  Le singleton
   --  @param Nom
   --  La nouvelle valeur de l'attribut.

   procedure Afficher
      (This : in     Singleton_Interface_T)
   is abstract;
   --  Affiche le contenu du singleton.
   --  @param This
   --  Le singleton à afficher.

private

   type Accesseur_T
      (Singleton : not null access Singleton_Interface_T'Class)
   is limited null record;

end Singleton_P;
