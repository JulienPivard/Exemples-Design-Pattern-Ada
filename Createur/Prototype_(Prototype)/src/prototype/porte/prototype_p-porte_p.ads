--  @summary
--  Un prototype de porte.
--  @description
--  Un prototype de porte, permet de créer des portes par clonage.
--  @group Prototype Porte
package Prototype_P.Porte_P is

   type Porte_T is new Prototype_T with private;
   --  Un prototype de porte.

   overriding
   function Clone
      (Porte : in     Porte_T)
      return Porte_T;
   --  Permet de cloner la porte.
   --  @param Porte
   --  La porte à cloner.
   --  @return Le clone de la porte.

   overriding
   function Est_Trop_Vieux
      (Porte : in     Porte_T)
      return Boolean;
   --  Permet de savoir si la porte est trop vieille.
   --  @param Porte
   --  La porte.
   --  @return La porte est trop vieille.

   overriding
   procedure Changer_Age
      (
         Porte : in out Porte_T;
         Age   : in     Age_T
      );
   --  Permet de changer l'age de la porte.
   --  @param Porte
   --  La porte.
   --  @param Age
   --  L'age à donner à la porte.

   overriding
   function Lire_Age
      (Porte : in     Porte_T)
      return Age_T;
   --  Permet de lire l'age de la porte.
   --  @param Porte
   --  La porte.
   --  @return L'age de la porte.

   procedure Creer_Porte
      (Porte : in out Porte_T);
   --  Permet de créer une porte à partir de rien.
   --  @param Porte
   --  La porte à initialiser.

private

   type Porte_T is new Prototype_T with
      record
         Age : Age_T;
      end record;

end Prototype_P.Porte_P;
