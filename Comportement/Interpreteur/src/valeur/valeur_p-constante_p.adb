package body Valeur_P.Constante_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   function Interprete
      (This : in     Constante_T)
      return Data_P.Valeur_T
   is
   begin
      return This.Valeur;
   end Interprete;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Image
      (This : in     Constante_T)
      return String
   is
      Str : constant String := Data_P.Valeur_T'Image (This.Valeur);
   begin
      return
         (
            if Str (Str'First .. Str'First) = " " then
               Str (Str'First + 1 .. Str'Last)
            else
               Str
         );
   end Image;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Creer
      (Valeur : in     Data_P.Valeur_T)
      return Constante_T
   is
      Resultat : constant Constante_T := Constante_T'(Valeur => Valeur);
   begin
      return Resultat;
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Valeur_P.Constante_P;
