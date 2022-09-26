private with Ada.Strings.Unbounded;

--  @summary
--  Représentation d'un singleton.
--  @description
--  Le singleton est bloqué en création avec le discriminant.
--  Version sans pointeur. Pour pouvoir créer plusieurs
--  singleton, il suffit de rendre ce package générique.
--  @group Créateur
package Singleton_Bis_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Singleton_T (<>) is tagged limited private;
   --  Représente un singleton avec un type discriminant.

   Unique : constant Singleton_T;
   --  Instance du singleton.

   procedure Changer_Nom
      (
         This : in     Singleton_T;
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
         null;
      end record;

   Unique : constant Singleton_T := Singleton_T'(null record);

   ------------------------------
   protected Singleton_Protege is
      -----------------
      procedure Changer
         (Nom : in     String);
      --  Permet de changer l'attribut variable
      --  @param Nom
      --  La nouvelle valeur de l'attribut.
      procedure Afficher;
      --  Affiche le contenu du singleton.
   private
      Nom : Nom_R.Unbounded_String;
      --  Les données stocké dans le singleton.
   end Singleton_Protege;
   --  Le singleton. À l'épreuve des accès concurrent.

end Singleton_Bis_P;
