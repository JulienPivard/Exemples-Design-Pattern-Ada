with Builder_P;

package Directeur_P is

   type Directeur_T is tagged private;

   procedure Construire
   (
      Directeur : in Directeur_T;
      Monteur : in out Builder_P.Monteur_T'Class
   );

private

   type Directeur_T is tagged null record;

end Directeur_P;
