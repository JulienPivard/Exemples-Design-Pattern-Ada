package body Prototype_P.Mur_P is

   ---------------------------------------------------------------------------
   procedure Creer_Mur (Le_Mur : in out T_Mur) is
   begin
      Le_Mur.Nom := "                              ";
      Le_Mur.Age := 0;
      Le_Mur.Taille := 5;
      Le_Mur.Cara := Normal;
   end Creer_Mur;

   ---------------------------------------------------------------------------
   overriding
   function Clone (Le_Mur : in T_Mur) return T_Mur is
      m : T_Mur;
   begin
      m.Nom := Le_Mur.Nom;
      m.Age := Le_Mur.Age;
      m.Taille := Le_Mur.Taille;
      m.Cara := Le_Mur.Cara;
      return m;
   end Clone;

   ---------------------------------------------------------------------------
   overriding
   procedure Changer_Age (Le_Mur : out T_Mur; Age : in Integer) is
   begin
      Le_Mur.Age := Age;
   end Changer_Age;

   ---------------------------------------------------------------------------
   overriding
   function Est_Trop_Vieux (Le_Mur : in T_Mur) return Boolean is
   begin
      return Le_Mur.Age > 20;
   end Est_Trop_Vieux;

   ---------------------------------------------------------------------------
   overriding
   function Lire_Age (Le_Mur : in T_Mur) return Integer is
   begin
      return Le_Mur.Age;
   end Lire_Age;

end Prototype_P.Mur_P;
