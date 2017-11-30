with Calcul_Distance_P;

--  @summary
--  Représentation concrète du problème de la distance entre deux points.
--  @description
--  Permet de traiter de manière simple et élégante le problème
--  du calcul de la distance entre deux points grâce au
--  design pattern Strategie.
--  La résolution de ce problème utilise la stratégie de calcul
--  abstraite calcul_distance.
--  @group Probleme
package Distance_P.Probleme_P is

   pragma Pure;
   use Calcul_Distance_P;

   --  Le problème de distance entre deux points à résoudre.
   type Probleme_T is new Probleme_Distance_T with private;

   --  Initialise le problème avec les données et la stratégie adéquate.
   --  @param Probleme
   --  Le problème de distance.
   --  @param X1
   --  La coordonnée X du premier point.
   --  @param Y1
   --  La coordonnée Y du premier point.
   --  @param X2
   --  La coordonnée X du deuxième point.
   --  @param Y2
   --  La coordonnée Y du deuxième point.
   --  @param Strategie
   --  La stratégie pour résoudre le calcul de la distance entre deux points.
   procedure Initialiser
   (
      Probleme : out Probleme_T;
      X1, Y1, X2, Y2 : Coordonnee_T;
      Strategie : access Calcul_Distance_T'Class
   );

   overriding
   --  Lit la coordonnée X du premier point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée X du premier point.
   function Lire_X1 (Probleme : Probleme_T) return Coordonnee_T;

   overriding
   --  Lit la coordonnée Y du premier point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée Y du premier point.
   function Lire_Y1 (Probleme : Probleme_T) return Coordonnee_T;

   overriding
   --  Lit la coordonnée X du deuxième point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée X du deuxième point.
   function Lire_X2 (Probleme : Probleme_T) return Coordonnee_T;

   overriding
   --  Lit la coordonnée Y du deuxième point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée Y du deuxième point.
   function Lire_Y2 (Probleme : Probleme_T) return Coordonnee_T;

   overriding
   --  Écrit la distance entre les deux points.
   --  @param Probleme
   --  Le problème de distance.
   --  @param Distance
   --  La distance entre les deux points.
   procedure Ecrire_Distance
      (Probleme : in out Probleme_T; Distance : Distance_T);

   overriding
   --  Lit la distance entre les deux points.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La distance entre les deux points.
   function Lire_Distance (Probleme : Probleme_T) return Distance_T;

   overriding
   --  Lance la résolution de la distance entre les deux points avec
   --  la stratégie adéquate.
   --  @param Probleme
   --  Le problème de distance à résoudre.
   procedure Resoudre (Probleme : in out Probleme_T);

private

   type Probleme_T is new Probleme_Distance_T with
      record
         X1, Y1, X2, Y2 : Coordonnee_T;
         Distance : Distance_T;
         Strategie : access Calcul_Distance_T'Class;
      end record;

end Distance_P.Probleme_P;
