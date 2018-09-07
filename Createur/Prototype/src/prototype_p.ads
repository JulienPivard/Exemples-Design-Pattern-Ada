package Prototype_P is

   --  Le type abstrait dont vont descendre tous les type prototypé
   type Prototype_T is interface;

   type Age_T is new Natural;

   --  Permet de créer un clone l'instance.
   function Clone
      (Proto : in Prototype_T)
      return Prototype_T
   is abstract;

   --  Permet de savoir si le prototype est trop vieux
   function Est_Trop_Vieux
      (Proto : in Prototype_T)
      return Boolean
   is abstract;

   --  Permet de changer l'age du prototype.
   procedure Changer_Age
      (
         Proto : out Prototype_T;
         Age : in Age_T
      )
   is abstract;

   --  Permet de lire l'age du prototype.
   function Lire_Age
      (Proto : in Prototype_T)
      return Age_T
   is abstract;

end Prototype_P;
