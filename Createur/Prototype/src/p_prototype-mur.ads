package P_Prototype.Mur is

   type T_Mur is new T_Prototype with private;

   --  Permet de cloner l'instance de mur actuelle
   overriding
   function Clone (Le_Mur : in T_Mur) return T_Mur;

   --  Permet de savoir si le prototype est trop vieux
   overriding
   function Est_Trop_Vieux (Le_Mur : in T_Mur) return Boolean;

   --  Permet de changer l'age du mur.
   overriding
   procedure Changer_Age (Le_Mur : out T_Mur; Age : in Integer);

   --  Permet de lire l'age du mur.
   overriding
   function Lire_Age (Le_Mur : in T_Mur)
      return Integer;

   --  Permet d'initialiser un mur vide
   procedure Creer_Mur (Le_Mur : in out T_Mur);

private

   type T_Caracteristique is (Normal, Magique, Bois, Papier);

   type T_Mur is new T_Prototype with
      record
         Nom : String (1 .. 30);
         Age : Integer;
         Taille : Integer;
         Cara : T_Caracteristique;
      end record;

end P_Prototype.Mur;
