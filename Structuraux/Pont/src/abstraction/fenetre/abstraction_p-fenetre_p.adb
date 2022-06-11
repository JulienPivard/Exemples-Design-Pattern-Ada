package body Abstraction_P.Fenetre_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   procedure Faire_Fenetre
      (This : in out Fenetre_T)
   is
   begin
      This.Implementeur.Reference.Operation_4;
      This.Implementeur.Reference.Operation_5;
   end Faire_Fenetre;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Abstraction_P.Fenetre_P;
