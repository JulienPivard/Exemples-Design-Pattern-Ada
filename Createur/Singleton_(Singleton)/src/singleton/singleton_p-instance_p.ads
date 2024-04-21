private with Ada.Strings.Unbounded;

--  @summary
--  Exemple de design pattern Singleton.
--  @description
--  Le singleton est bloqué en création avec le discriminant.
--  @group Créateur
package Singleton_P.Instance_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Singleton_T (<>) is new Singleton_Interface_T with private;
   --  Représente un singleton avec un type discriminant.

   function Recuperer_Singleton
      return Accesseur_T;
   --  Permet de récupérer notre singleton.
   --  @return Le singleton

   overriding
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

   overriding
   procedure Afficher
      (This : in     Singleton_T);
   --  Affiche le contenu du singleton.
   --  @param This
   --  Le singleton à afficher.

private

   package Nom_R renames Ada.Strings.Unbounded;

   type Singleton_T is new Singleton_Interface_T with
      record
         Nom : Nom_R.Unbounded_String;
      end record;

   Unique : aliased Singleton_T;
   --  Singleton

end Singleton_P.Instance_P;
