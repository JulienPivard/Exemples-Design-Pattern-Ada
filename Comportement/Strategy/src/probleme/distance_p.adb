package body Distance_P is

   ---------------------------------------------------------------------------
   function "-" (Right, Left : Coordonnee_T) return Distance_T is
   begin
      return Distance_T (Integer (Right) - Integer (Left));
   end "-";

end Distance_P;
