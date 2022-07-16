package body Valeurs_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   procedure Modifier
      (
         This : in out Valeurs_Graphe_T;
         Vals : in     Table_Valeurs_T
      )
   is
   begin
      This.Vals := Vals;
   end Modifier;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Lire_Vals
      (This : in     Valeurs_Graphe_T)
      return Table_Valeurs_T
   is
   begin
      return This.Vals;
   end Lire_Vals;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Valeurs_P;
