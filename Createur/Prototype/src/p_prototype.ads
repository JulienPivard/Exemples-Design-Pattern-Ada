package P_Prototype is

   --  Le type abstrait dont vont descendre tous les type prototypé
   type T_Prototype is abstract tagged private;

   --  Permet de créer un clone l'instance.
   function Clone (Proto : in T_Prototype)
      return T_Prototype is abstract;

   --  Permet de savoir si le prototype est trop vieux
   function Est_Trop_Vieux (Proto : in T_Prototype)
      return Boolean is abstract;

   --  Permet de changer l'age du prototype.
   procedure Changer_Age (Proto : out T_Prototype; Age : in Integer)
      is abstract;

   --  Permet de lire l'age du prototype.
   function Lire_Age (Proto : in T_Prototype)
      return Integer is abstract;

private

   type T_Prototype is abstract tagged null record;

end P_Prototype;
