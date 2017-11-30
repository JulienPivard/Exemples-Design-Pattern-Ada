package body Distance_P.Probleme_P is

   ---------------------------------------------------------------------------
   procedure Initialiser
      (
         Probleme : out Probleme_T;
         X1, Y1, X2, Y2 : Coordonnee_T;
         Strategie : access Calcul_Distance_T'Class
      )
   is
   begin
      Probleme.X1 := X1;
      Probleme.Y1 := Y1;
      Probleme.X2 := X2;
      Probleme.Y2 := Y2;
      Probleme.Distance := 0;
      Probleme.Strategie := Strategie;
   end Initialiser;

   ---------------------------------------------------------------------------
   overriding
   function Lire_X1 (Probleme : Probleme_T)
      return Coordonnee_T
   is
   begin
      return Probleme.X1;
   end Lire_X1;

   ---------------------------------------------------------------------------
   overriding
   function Lire_Y1 (Probleme : Probleme_T)
      return Coordonnee_T
   is
   begin
      return Probleme.Y1;
   end Lire_Y1;

   ---------------------------------------------------------------------------
   overriding
   function Lire_X2 (Probleme : Probleme_T)
      return Coordonnee_T
   is
   begin
      return Probleme.X2;
   end Lire_X2;

   ---------------------------------------------------------------------------
   overriding
   function Lire_Y2 (Probleme : Probleme_T)
      return Coordonnee_T
   is
   begin
      return Probleme.Y2;
   end Lire_Y2;

   ---------------------------------------------------------------------------
   overriding
   procedure Ecrire_Distance
      (Probleme : in out Probleme_T; Distance : Distance_T)
   is
   begin
      Probleme.Distance := Distance;
   end Ecrire_Distance;

   ---------------------------------------------------------------------------
   overriding
   function Lire_Distance (Probleme : Probleme_T) return Distance_T is
   begin
      return Probleme.Distance;
   end Lire_Distance;

   ---------------------------------------------------------------------------
   overriding
   procedure Resoudre (Probleme : in out Probleme_T) is
   begin
      Probleme.Strategie.all.Resoudre (Probleme);
   end Resoudre;

end Distance_P.Probleme_P;
