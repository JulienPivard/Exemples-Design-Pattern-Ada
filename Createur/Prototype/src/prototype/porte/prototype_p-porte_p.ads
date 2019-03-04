package Prototype_P.Porte_P is

   --  Le type porte
   type Porte_T is new Prototype_T with private;

   --  Permet de cloner la porte.
   overriding
   function Clone
      (Porte : in Porte_T)
      return Porte_T;

   --  Permet de savoir si la porte est trop vieille.
   overriding
   function Est_Trop_Vieux
      (Porte : in Porte_T)
      return Boolean;

   --  Permet de changer l'age de la porte.
   overriding
   procedure Changer_Age
      (
         Porte : in out Porte_T;
         Age   : in Age_T
      );

   --  Permet de lire l'age de la porte.
   overriding
   function Lire_Age
      (Porte : in Porte_T)
      return Age_T;

   --  Permet de créer une porte à partir de rien.
   procedure Creer_Porte
      (Porte : in out Porte_T);

private

   type Porte_T is new Prototype_T with
      record
         Age : Age_T;
      end record;

end Prototype_P.Porte_P;
