package body Strategie_P.Calcul_Distance_Washington_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Resoudre
      (
         Strategie   : in     Washington_T;
         Probleme    : in out Distance_P.Probleme_T
      )
   is
      pragma Unreferenced (Strategie);

      use type Distance_P.Coordonnee_T;
      use type Distance_P.Distance_T;

      X1 : constant Distance_P.Coordonnee_T := Probleme.Lire_X1;
      Y1 : constant Distance_P.Coordonnee_T := Probleme.Lire_Y1;
      X2 : constant Distance_P.Coordonnee_T := Probleme.Lire_X2;
      Y2 : constant Distance_P.Coordonnee_T := Probleme.Lire_Y2;

      Distance : Distance_P.Distance_T := 0;
   begin
      Distance := ((X2 - X1) + (Y2 - Y1));
      Probleme.Ecrire_Distance (Distance => Distance);
   end Resoudre;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Strategie_P.Calcul_Distance_Washington_P;
