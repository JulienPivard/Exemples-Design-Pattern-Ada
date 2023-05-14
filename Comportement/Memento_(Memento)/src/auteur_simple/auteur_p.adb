package body Auteur_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   function Creer
      (Valeur : in     Valeur_P.Valeur_T)
      return Auteur_T
   is

   begin
      return Auteur_T'(Valeur => Valeur);
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Modifier
      (
         This   : in out Auteur_T;
         Valeur : in     Valeur_P.Valeur_T
      )
   is
   begin
      This.Valeur := Valeur;
   end Modifier;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire_Valeur
      (This : in     Auteur_T)
      return Valeur_P.Valeur_T
   is
   begin
      return This.Valeur;
   end Lire_Valeur;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Auteur_P;
