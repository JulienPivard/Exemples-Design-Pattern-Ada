package body Valeur_P.Operateur_P.Multiplier_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   function Interprete
      (This : in     Multiplier_T)
      return Data_P.Valeur_T
   is
      use type Data_P.Valeur_T;

      Gauche : constant Data_P.Valeur_T :=
         This.Gauche.Element.Interprete;
      Droite : constant Data_P.Valeur_T :=
         This.Droite.Element.Interprete;
   begin
      return Gauche * Droite;
   end Interprete;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Image
      (This : in     Multiplier_T)
      return String
   is
   begin
      return "(" &
         This.Gauche.Element.Image & " * " &
         This.Droite.Element.Image & ")";
   end Image;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Creer
      (
         Gauche : in     Valeur_Abstraite_T'Class;
         Droite : in     Valeur_Abstraite_T'Class
      )
      return Multiplier_T
   is
      Resultat : constant Multiplier_T := Multiplier_T'
         (
            Gauche => Valeur_Stocke_P.To_Holder (New_Item => Gauche),
            Droite => Valeur_Stocke_P.To_Holder (New_Item => Droite)
         );
   begin
      return Resultat;
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Valeur_P.Operateur_P.Multiplier_P;
