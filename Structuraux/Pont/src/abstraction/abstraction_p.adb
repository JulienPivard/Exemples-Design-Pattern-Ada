package body Abstraction_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   procedure Operation
      (This : in out Abstraction_T)
   is
   begin
      This.Implementeur.Reference.Operation_1;
      This.Implementeur.Reference.Operation_2;
      This.Implementeur.Reference.Operation_3;
   end Operation;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Abstraction_P;
