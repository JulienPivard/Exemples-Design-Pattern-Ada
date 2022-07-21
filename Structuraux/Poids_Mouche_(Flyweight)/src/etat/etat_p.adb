package body Etat_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   procedure Modifier_Val
      (
         This : in out Etat_Externe_T;
         Val  : in     Valeur_T
      )
   is
   begin
      This.Valeur := Val;
   end Modifier_Val;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire_Val
      (This : in     Etat_Externe_T)
      return Valeur_T
   is
   begin
      return This.Valeur;
   end Lire_Val;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Etat_P;
