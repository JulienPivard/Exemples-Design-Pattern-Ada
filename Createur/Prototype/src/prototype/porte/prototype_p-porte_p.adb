package body Prototype_P.Porte_P is

   ---------------------------------------------------------------------------
   overriding
   function Clone
      (Porte : in Porte_T)
      return Porte_T
   is
      P : Porte_T;
   begin
      P.Age := Porte.Age;
      return P;
   end Clone;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Est_Trop_Vieux
      (Porte : in Porte_T)
      return Boolean
   is
   begin
      return Porte.Age > 30;
   end Est_Trop_Vieux;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Changer_Age
      (
         Porte : in out Porte_T;
         Age   : in     Age_T
      )
   is
   begin
      Porte.Age := Age;
   end Changer_Age;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Lire_Age
      (Porte : in Porte_T)
      return Age_T
   is
   begin
      return Porte.Age;
   end Lire_Age;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Creer_Porte
      (Porte : in out Porte_T)
   is
   begin
      Porte.Age := 0;
   end Creer_Porte;
   ---------------------------------------------------------------------------

end Prototype_P.Porte_P;
