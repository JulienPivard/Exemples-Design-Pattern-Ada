with Builder_P;

package Directeur_P is

   type T_Directeur is tagged private;

   procedure Construire
   (
      Directeur : in T_Directeur;
      Monteur : in out Builder_P.T_Monteur'Class
   );

private

   type T_Directeur is tagged null record;

end Directeur_P;
