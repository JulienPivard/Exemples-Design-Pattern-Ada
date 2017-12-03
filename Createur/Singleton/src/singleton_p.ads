with Ada.Strings.Unbounded;

--  @summary
--  Représentation d'un singleton.
--  @description
--  Le singleton est bloqué en création avec le discriminant.
--  @group Créateur
package Singleton_P is

   --  Représente un singleton avec un type discriminant.
   type Singleton_T (<>) is tagged limited private;

   --  Permet d'accéder à un singleton avec un pointeur.
   type Singleton_Access_T is access Singleton_T;

   --  Permet de récupérer notre singleton.
   --  @return Le singleton
   function Recuperer_Singleton return Singleton_Access_T;

   --  Permet de changer l'attribut variable
   --  @param Singleton
   --  Le singleton
   --  @param Nom
   --  La nouvelle valeur de l'attribut.
   procedure Changer_Nom
      (
         Singleton : in out Singleton_T;
         Nom : Ada.Strings.Unbounded.Unbounded_String
      );

   --  Affiche le contenu du singleton.
   --  @param Singleton
   --  Le singleton à afficher.
   procedure Afficher (Singleton : Singleton_T);

private

   type Singleton_T (Age : Integer) is tagged limited
      record
         Nom : Ada.Strings.Unbounded.Unbounded_String;
      end record;

   --  Singleton
   Unique : constant Singleton_Access_T := new Singleton_T (Age => 45);

end Singleton_P;
