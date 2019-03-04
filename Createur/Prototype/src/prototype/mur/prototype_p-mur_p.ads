package Prototype_P.Mur_P is

   type Mur_T is new Prototype_T with private;

   --  Permet de cloner l'instance de mur actuelle
   overriding
   function Clone
      (Le_Mur : in Mur_T)
      return Mur_T;

   --  Permet de savoir si le prototype est trop vieux
   overriding
   function Est_Trop_Vieux
      (Le_Mur : in Mur_T)
      return Boolean;

   --  Permet de changer l'age du mur.
   overriding
   procedure Changer_Age
      (
         Le_Mur   : in out Mur_T;
         Age      : in Age_T
      );

   --  Permet de lire l'age du mur.
   overriding
   function Lire_Age
      (Le_Mur : in Mur_T)
      return Age_T;

   --  Permet d'initialiser un mur vide
   procedure Creer_Mur
      (Le_Mur : in out Mur_T);

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
