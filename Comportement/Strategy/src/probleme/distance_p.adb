with Calcul_Distance_P;

package body Distance_P is

   ---------------------------------------------------------------------------
   function Initialiser
      (X1, Y1, X2, Y2 : in Coordonnee_T)
      return Probleme_T
   is
      Resultat : Probleme_T;
   begin
      Resultat.X1        := X1;
      Resultat.Y1        := Y1;
      Resultat.X2        := X2;
      Resultat.Y2        := Y2;
      Resultat.Distance  := 0;
      return Resultat;
   end Initialiser;

   ---------------------------------------------------------------------------
   function Lire_X1
      (Probleme : in Probleme_T)
      return Coordonnee_T
   is
   begin
      return Probleme.X1;
   end Lire_X1;

   ---------------------------------------------------------------------------
   function Lire_Y1
      (Probleme : in Probleme_T)
      return Coordonnee_T
   is
   begin
      return Probleme.Y1;
   end Lire_Y1;

   ---------------------------------------------------------------------------
   function Lire_X2
      (Probleme : in Probleme_T)
      return Coordonnee_T
   is
   begin
      return Probleme.X2;
   end Lire_X2;

   ---------------------------------------------------------------------------
   function Lire_Y2
      (Probleme : in Probleme_T)
      return Coordonnee_T
   is
   begin
      return Probleme.Y2;
   end Lire_Y2;

   ---------------------------------------------------------------------------
   procedure Ecrire_Distance
      (
         Probleme : in out Probleme_T;
         Distance : in Distance_T
      )
   is
   begin
      Probleme.Distance := Distance;
   end Ecrire_Distance;

   ---------------------------------------------------------------------------
   function Lire_Distance
      (Probleme : in Probleme_T)
      return Distance_T
   is
   begin
      return Probleme.Distance;
   end Lire_Distance;

   ---------------------------------------------------------------------------
   procedure Resoudre
      (
         Probleme  : in out Probleme_T;
         Strategie : in Calcul_Distance_P.Calcul_Distance_T'Class
      )
   is
   begin
      Strategie.Resoudre (Probleme);
   end Resoudre;

   ---------------------------------------------------------------------------
   function "-"
      (Right, Left : in Coordonnee_T)
      return Distance_T
   is
   begin
      return Distance_T (Right) - Distance_T (Left);
   end "-";

end Distance_P;
