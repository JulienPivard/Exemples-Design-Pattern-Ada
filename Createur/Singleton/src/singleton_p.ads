with Ada.Strings.Unbounded;

--  @summary
--  Représentation d'un singleton.
--  @description
--  Le singleton est bloqué en création avec le discriminant.
--  @group Créateur
package Singleton_P is

   package Nom_P renames Ada.Strings.Unbounded;

   type Singleton_T (<>) is tagged limited private;
   --  Représente un singleton avec un type discriminant.

   type Singleton_Access_T is access Singleton_T;
   --  Permet d'accéder à un singleton avec un pointeur.

   function Recuperer_Singleton
      return Singleton_Access_T;
   --  Permet de récupérer notre singleton.
   --  @return Le singleton

   procedure Changer_Nom
      (
         Singleton : in out Singleton_T;
         Nom : in Nom_P.Unbounded_String
      );
   --  Permet de changer l'attribut variable
   --  @param Singleton
   --  Le singleton
   --  @param Nom
   --  La nouvelle valeur de l'attribut.

   procedure Afficher
      (Singleton : in Singleton_T);
   --  Affiche le contenu du singleton.
   --  @param Singleton
   --  Le singleton à afficher.

private

   type Age_T is new Natural;
   --  Représentation interne de l'age du jeton

   type Singleton_T (Age : Age_T) is tagged limited
      record
         Nom : Nom_P.Unbounded_String;
      end record;

   Unique : constant Singleton_Access_T :=
      new Singleton_T (Age => 45);
   --  Singleton

end Singleton_P;
