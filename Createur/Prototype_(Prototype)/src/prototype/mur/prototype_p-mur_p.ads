--  @summary
--  Un prototype de mur.
--  @description
--  Un prototype de mur, permet de créer des murs par clonage.
--  @group Prototype Mur
package Prototype_P.Mur_P is

   type Mur_T is new Prototype_T with private;
   --  Un prototype de mur.

   overriding
   function Clone
      (Le_Mur : in     Mur_T)
      return Mur_T;
   --  Permet de cloner l'instance de mur actuelle.
   --  @param Le_Mur
   --  Le mur à cloner.
   --  @return Le clone du mur.

   overriding
   function Est_Trop_Vieux
      (Le_Mur : in     Mur_T)
      return Boolean;
   --  Permet de savoir si le prototype est trop vieux.
   --  @param Le_Mur
   --  Le mur.
   --  @return Le mur est trop vieux.

   overriding
   procedure Changer_Age
      (
         Le_Mur : in out Mur_T;
         Age    : in     Age_T
      );
   --  Permet de changer l'age du mur.
   --  @param Le_Mur
   --  Le mur.
   --  @param Age
   --  L'age à donner au mur.

   overriding
   function Lire_Age
      (Le_Mur : in     Mur_T)
      return Age_T;
   --  Permet de lire l'age du mur.
   --  @param Le_Mur
   --  Le mur.
   --  @return L'age du mur.

   procedure Creer_Mur
      (Le_Mur : in out Mur_T);
   --  Permet d'initialiser un mur vide.
   --  @param Le_Mur
   --  Le mur à initialiser.

private

   type Caracteristique_T is (Normal, Magique, Bois, Papier);

   subtype Indice_Nom_T is Integer range 1 .. 30;
   subtype Nom_T is String (Indice_Nom_T);

   type Mur_T is new Prototype_T with
      record
         Nom   : Nom_T;
         Age   : Age_T;
         Cara  : Caracteristique_T;
      end record;

end Prototype_P.Mur_P;
