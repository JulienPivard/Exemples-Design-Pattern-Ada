limited with Strategie_P;

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

   type Probleme_T is tagged private;
   --  Le problème de distance entre deux points à résoudre.

   type Coordonnee_T is new Integer;
   --  Une coordonnée x, y ou z d'un point.

   type Distance_T is new Integer;
   --  La distance entre deux points.

   function Initialiser
      (X1, Y1, X2, Y2 : in Coordonnee_T)
      return Probleme_T;
   --  Initialise le problème avec les données et la stratégie adéquate.
   --  @param X1
   --  La coordonnée X du premier point.
   --  @param Y1
   --  La coordonnée Y du premier point.
   --  @param X2
   --  La coordonnée X du deuxième point.
   --  @param Y2
   --  La coordonnée Y du deuxième point.
   --  @return Le problème initialisé.

   function Lire_X1
      (Probleme : in Probleme_T)
      return Coordonnee_T;
   --  Lit la coordonnée X du premier point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée X du premier point.

   function Lire_Y1
      (Probleme : in Probleme_T)
      return Coordonnee_T;
   --  Lit la coordonnée Y du premier point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée Y du premier point.

   function Lire_X2
      (Probleme : in Probleme_T)
      return Coordonnee_T;
   --  Lit la coordonnée X du deuxième point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée X du deuxième point.

   function Lire_Y2
      (Probleme : in Probleme_T)
      return Coordonnee_T;
   --  Lit la coordonnée Y du deuxième point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée Y du deuxième point.

   procedure Ecrire_Distance
      (
         Probleme : in out Probleme_T;
         Distance : in     Distance_T
      );
   --  Écrit la distance entre les deux points.
   --  @param Probleme
   --  Le problème de distance.
   --  @param Distance
   --  La distance entre les deux points.

   function Lire_Distance
      (Probleme : in Probleme_T)
      return Distance_T;
   --  Lit la distance entre les deux points.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La distance entre les deux points.

   procedure Resoudre
      (
         Probleme  : in out Probleme_T;
         Strategie : in     Strategie_P.Calcul_Distance_T'Class
      );
   --  Lance la résolution de la distance entre les deux points avec
   --  la stratégie adéquate.
   --  @param Strategie
   --  La stratégie.
   --  @param Probleme
   --  Le problème de distance à résoudre.

   function "-"
      (Right, Left : in Coordonnee_T)
      return Distance_T;
   --  Soustraction entre deux coordonnées donne une distance.
   --  @param Right
   --  La coordonnée droite.
   --  @param Left
   --  La coordonnée gauche.
   --  @return La distance entre les deux coordonnées.

private

   type Probleme_T is tagged
      record
         X1, Y1, X2, Y2 : Coordonnee_T;
         Distance       : Distance_T;
      end record;

end Distance_P;
