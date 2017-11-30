--  @summary
--  Représentation abstraite du problème de la distance entre deux points.
--  @description
--  Permet de traiter de manière simple et élégante le problème
--  du calcul de la distance entre deux points grâce au
--  design pattern Strategie.
--  @group Probleme
package Distance_P is

   pragma Pure;

   --  Le problème abstrait de distance entre deux points à résoudre.
   type Probleme_Distance_T is abstract tagged private;

   --  Une coordonnée x, y ou z d'un point.
   type Coordonnee_T is new Integer;

   --  La distance entre deux points.
   type Distance_T is new Integer;

   --  Lit la coordonnée X du premier point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée X du premier point.
   function Lire_X1 (Probleme : Probleme_Distance_T)
      return Coordonnee_T is abstract;

   --  Lit la coordonnée Y du premier point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée Y du premier point.
   function Lire_Y1 (Probleme : Probleme_Distance_T)
      return Coordonnee_T is abstract;

   --  Lit la coordonnée X du deuxième point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée X du deuxième point.
   function Lire_X2 (Probleme : Probleme_Distance_T)
      return Coordonnee_T is abstract;

   --  Lit la coordonnée Y du deuxième point.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La coordonnée Y du deuxième point.
   function Lire_Y2 (Probleme : Probleme_Distance_T)
      return Coordonnee_T is abstract;

   --  Écrit la distance entre les deux points.
   --  @param Probleme
   --  Le problème de distance.
   --  @param Distance
   --  La distance entre les deux points.
   procedure Ecrire_Distance
      (Probleme : in out Probleme_Distance_T; Distance : Distance_T)
   is abstract;

   --  Lit la distance entre les deux points.
   --  @param Probleme
   --  Le problème de distance.
   --  @return La distance entre les deux points.
   function Lire_Distance (Probleme : Probleme_Distance_T)
      return Distance_T is abstract;

   --  Lance la résolution de la distance entre les deux points avec
   --  la stratégie adéquate.
   --  @param Probleme
   --  Le problème de distance à résoudre.
   procedure Resoudre (Probleme : in out Probleme_Distance_T) is abstract;

   --  Soustraction entre deux coordonnées donne une distance.
   --  @param Right
   --  La coordonnée droite.
   --  @param Left
   --  La coordonnée gauche.
   --  @return La distance entre les deux coordonnées.
   function "-" (Right, Left : Coordonnee_T) return Distance_T;

private

   type Probleme_Distance_T is abstract tagged null record;

end Distance_P;
