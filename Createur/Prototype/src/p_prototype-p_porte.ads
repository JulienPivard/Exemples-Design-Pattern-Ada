package P_Prototype.P_Porte is

   --  Le type porte
   type T_Porte is new T_Prototype with private;

   --  Permet de cloner la porte.
   overriding
   function Clone (Porte : in T_Porte) return T_Porte;

   --  Permet de savoir si la porte est trop vieille.
   overriding
   function Est_Trop_Vieux (Porte : in T_Porte) return Boolean;

   --  Permet de changer l'age de la porte.
   overriding
   procedure Changer_Age (Porte : out T_Porte; Age : in Integer);

   --  Permet de lire l'age de la porte.
   overriding
   function Lire_Age (Porte : in T_Porte)
      return Integer;

   --  Permet de créer une porte à partir de rien.
   procedure Creer_Porte (Porte : out T_Porte);

private

   type T_Porte is new T_Prototype with
      record
         Age : Integer;
      end record;

end P_Prototype.P_Porte;
