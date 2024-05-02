private with Ada.Strings.Unbounded;

--  @summary
--  Représentation d'un singleton.
--  @description
--  Le singleton est bloqué en création avec le discriminant.
--  Version à l'épreuve de la concurrence. Pour pouvoir créer
--  plusieurs singleton, il suffit de rendre ce package générique.
--  @group Créateur
package Singleton_P.Protege_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Singleton_T (<>) is synchronized
      new Singleton_Interface_T with private;
   --  Représente un singleton avec un type discriminant.

   function Recuperer_Singleton
      return Accesseur_T;
   --  Permet de récupérer l'instance notre singleton.
   --  @return Le singleton

private

   package Nom_R renames Ada.Strings.Unbounded;

   ------------------------------
   protected type Singleton_T is new Singleton_Interface_T with
      -----------------
      overriding
      procedure Changer_Nom
         (Nom : in     String);
      --  Permet de changer l'attribut variable
      --  @param Nom
      --  La nouvelle valeur de l'attribut.
      overriding
      procedure Afficher;
      --  Affiche le contenu du singleton.
   private
      Nom : Nom_R.Unbounded_String;
      --  Les données stocké dans le singleton.
   end Singleton_T;
   --  Le singleton. À l'épreuve des accès concurrent.

   Unique : aliased Singleton_T;
   --  Singleton

end Singleton_P.Protege_P;
