limited with Calcul_Distance_P;

--  @summary
--  Représentation concrète du problème de la distance entre deux points.
--  @description
--  Permet de traiter de manière simple et élégante le problème
--  du calcul de la distance entre deux points grâce au
--  design pattern Strategie.
--  La résolution de ce problème utilise la stratégie de calcul
--  abstraite calcul_distance.
--  @group Probleme
package Distance_P is

   pragma Pure;

   --  Le problème de distance entre deux points à résoudre.
   type Probleme_T is tagged private;

   --  Une coordonnée x, y ou z d'un point.
   type Coordonnee_T is new Integer;

   --  La distance entre deux points.
   type Distance_T is new Integer;

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
      Probleme       : out Probleme_T;
      X1, Y1, X2, Y2 : in Coordonnee_T;
      Strategie : access Calcul_Distance_P.Calcul_Distance_T'Class
   );

   --  Lit la coordonnée X du premier point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée X du premier point.
   function Lire_X1
      (Probleme : in Probleme_T)
      return Coordonnee_T;

   --  Lit la coordonnée Y du premier point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée Y du premier point.
   function Lire_Y1
      (Probleme : in Probleme_T)
      return Coordonnee_T;

   --  Lit la coordonnée X du deuxième point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée X du deuxième point.
   function Lire_X2
      (Probleme : in Probleme_T)
      return Coordonnee_T;

   --  Lit la coordonnée Y du deuxième point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée Y du deuxième point.
   function Lire_Y2
      (Probleme : in Probleme_T)
      return Coordonnee_T;

   --  Écrit la distance entre les deux points.
   --  @param Probleme
   --  Le problème de distance.
   --  @param Distance
   --  La distance entre les deux points.
   procedure Ecrire_Distance
      (
         Probleme : in out Probleme_T;
         Distance : in Distance_T
      );

   --  Lit la distance entre les deux points.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La distance entre les deux points.
   function Lire_Distance
      (Probleme : in Probleme_T)
      return Distance_T;

   --  Lance la résolution de la distance entre les deux points avec
   --  la stratégie adéquate.
   --  @param Probleme
   --  Le problème de distance à résoudre.
   procedure Resoudre (Probleme : in out Probleme_T);

   --  Soustraction entre deux coordonnées donne une distance.
   --  @param Right
   --  La coordonnée droite.
   --  @param Left
   --  La coordonnée gauche.
   --  @return La distance entre les deux coordonnées.
   function "-"
      (Right, Left : in Coordonnee_T)
      return Distance_T;

private

   type Probleme_T is tagged
      record
         X1, Y1, X2, Y2 : Coordonnee_T;
         Distance : Distance_T;
         Strategie : access Calcul_Distance_P.Calcul_Distance_T'Class;
      end record;

end Distance_P;
