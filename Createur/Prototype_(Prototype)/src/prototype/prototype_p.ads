--  @summary
--  Un prototype.
--  @description
--  Un prototype, permet de créer des prototypes par clonage.
--  @group Prototype
package Prototype_P is

   type Prototype_T is interface;
   --  Le type abstrait dont vont descendre tous les type prototypé.

   type Age_T is new Natural;
   --  L'age d'un prototype.

   function Clone
      (Proto : in     Prototype_T)
      return Prototype_T
   is abstract;
   --  Permet de créer un clone l'instance.
   --  @param Proto
   --  Le prototype à cloner.
   --  @return Le clone du prototype.

   function Est_Trop_Vieux
      (Proto : in     Prototype_T)
      return Boolean
   is abstract;
   --  Permet de savoir si le prototype est trop vieux
   --  @param Proto
   --  Le prototype.
   --  @return Le prototype est trop vieux.

   procedure Changer_Age
      (
         Proto : in out Prototype_T;
         Age   : in     Age_T
      )
   is abstract;
   --  Permet de changer l'age du prototype.
   --  @param Proto
   --  Le prototype.
   --  @param Age
   --  L'age à donner au prototype.

   function Lire_Age
      (Proto : in     Prototype_T)
      return Age_T
   is abstract;
   --  Permet de lire l'age du prototype.
   --  @param Proto
   --  Le prototype.
   --  @return L'age du prototype.

end Prototype_P;
