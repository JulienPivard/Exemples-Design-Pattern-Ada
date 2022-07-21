with Poids_Mouche_P.Concret_P;
with Poids_Mouche_P.Concret_Non_Partage_P;

package body Poids_Mouche_P.Fabrique_P
   with Spark_Mode => Off
is

   C_1 : aliased Concret_P.Poids_Mouche_Concret_1_T;
   C_2 : aliased Concret_P.Poids_Mouche_Concret_2_T;
   C_3 : aliased Concret_P.Poids_Mouche_Concret_3_T;

   ---------------------------------------------------------------------------
   function Initialiser
      return Fabrique_De_Poids_Mouche_T
   is
      F : Fabrique_De_Poids_Mouche_T;
   begin
      return F;
   end Initialiser;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Fabriquer
      (
         This : in out Fabrique_De_Poids_Mouche_T;
         Clef : in     Id_Poids_Mouche_T
      )
      return Poids_Mouche_A
   is
      pragma Unreferenced (This);

      Resultat : Poids_Mouche_A;
   begin
      case Clef is
         when Jeton_1 =>
            Resultat := C_1'Access;
         when Jeton_2 =>
            Resultat :=
               new Concret_Non_Partage_P.Poids_Mouche_Concret_1_T;
         when Jeton_3 =>
            Resultat := C_2'Access;
         when Jeton_4 =>
            Resultat := C_3'Access;
         when Jeton_5 =>
            Resultat :=
               new Concret_Non_Partage_P.Poids_Mouche_Concret_2_T;
      end case;

      return Resultat;
   end Fabriquer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Poids_Mouche_P.Fabrique_P;
