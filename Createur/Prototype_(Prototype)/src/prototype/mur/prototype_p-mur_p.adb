package body Prototype_P.Mur_P is

   ---------------------------------------------------------------------------
   procedure Creer_Mur
      (Le_Mur : in out Mur_T)
   is
   begin
      Le_Mur.Nom  := "                              ";
      Le_Mur.Age  := 0;
      Le_Mur.Cara := Normal;
   end Creer_Mur;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Clone
      (Le_Mur : in Mur_T)
      return Mur_T
   is
      M : Mur_T;
   begin
      M.Nom    := Le_Mur.Nom;
      M.Age    := Le_Mur.Age;
      M.Cara   := Le_Mur.Cara;
      return M;
   end Clone;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Changer_Age
      (
         Le_Mur   : in out Mur_T;
         Age      : in     Age_T
      )
   is
   begin
      Le_Mur.Age := Age;
   end Changer_Age;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Est_Trop_Vieux
      (Le_Mur : in Mur_T)
      return Boolean
   is
   begin
      return Le_Mur.Age > 20;
   end Est_Trop_Vieux;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Lire_Age
      (Le_Mur : in Mur_T)
      return Age_T
   is
   begin
      return Le_Mur.Age;
   end Lire_Age;
   ---------------------------------------------------------------------------

end Prototype_P.Mur_P;
