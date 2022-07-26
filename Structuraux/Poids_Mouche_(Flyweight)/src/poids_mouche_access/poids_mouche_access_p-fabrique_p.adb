with Poids_Mouche_Access_P.Concret_P;
with Poids_Mouche_Access_P.Concret_Non_Partage_P;

package body Poids_Mouche_Access_P.Fabrique_P
   with Spark_Mode => Off
is

   C_1 : aliased Concret_P.Poids_Mouche_Concret_1_T;
   C_2 : aliased Concret_P.Poids_Mouche_Concret_2_T;
   C_3 : aliased Concret_P.Poids_Mouche_Concret_3_T;

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
         Clef : in     Id_Poids_Mouche_T;
         Nom  : in     Nom_T
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
            Resultat := new Concret_Non_Partage_P.Poids_Mouche_Concret_1_T'
               (Concret_Non_Partage_P.Creer (Nom => Nom));
         when Jeton_3 =>
            Resultat := C_2'Access;
         when Jeton_4 =>
            Resultat := C_3'Access;
         when Jeton_5 =>
            Resultat := new Concret_Non_Partage_P.Poids_Mouche_Concret_2_T'
               (Concret_Non_Partage_P.Creer (Nom => Nom));
      end case;

      return Resultat;
   end Fabriquer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Poids_Mouche_Access_P.Fabrique_P;
