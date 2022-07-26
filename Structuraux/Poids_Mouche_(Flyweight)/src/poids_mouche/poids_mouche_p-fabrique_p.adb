with Poids_Mouche_P.Concret_P;
with Poids_Mouche_P.Concret_Non_Partage_P;

package body Poids_Mouche_P.Fabrique_P
   with Spark_Mode => Off
is

   C_1 : Concret_P.Poids_Mouche_Concret_1_T;
   C_2 : Concret_P.Poids_Mouche_Concret_2_T;
   C_3 : Concret_P.Poids_Mouche_Concret_3_T;

   ---------------------------------------------------------------------------
   function Initialiser
      return Fabrique_De_Poids_Mouche_T
   is
   begin
      return Fabrique_De_Poids_Mouche_T'(null record);
   end Initialiser;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Fabriquer
      (
         This : in out Fabrique_De_Poids_Mouche_T;
         Clef : in     Id_Poids_Mouche_T
      )
      return Poids_Mouche_T'Class
   is
      pragma Unreferenced (This);

      Resultat : Poids_Mouche_T'Class :=
         (
            case Clef is
               when Jeton_1 => C_1,
               when Jeton_2 => Concret_Non_Partage_P.Poids_Mouche_Concret_1_T,
               when Jeton_3 => C_2,
               when Jeton_4 => C_3,
               when Jeton_5 => Concret_Non_Partage_P.Poids_Mouche_Concret_2_T
         );
   begin
      return Resultat;
   end Fabriquer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Poids_Mouche_P.Fabrique_P;
