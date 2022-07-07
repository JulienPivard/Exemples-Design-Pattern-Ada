package body Valeur_P.Operateur_P.Soustraction_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   function Interprete
      (This : in     Soustraction_T)
      return Data_P.Valeur_T
   is
      use type Data_P.Valeur_T;

      Gauche : constant Data_P.Valeur_T :=
         This.Gauche.Element.Interprete;
      Droite : constant Data_P.Valeur_T :=
         This.Droite.Element.Interprete;
   begin
      return Gauche - Droite;
   end Interprete;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Image
      (This : in     Soustraction_T)
      return String
   is
   begin
      return "(" &
         This.Gauche.Element.Image & " - " &
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
      return Soustraction_T
   is
      Resultat : constant Soustraction_T := Soustraction_T'
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

end Valeur_P.Operateur_P.Soustraction_P;
