--  @summary
--  Stratégie de résolution concrète du calcul de distance entre deux points.
--  @description
--  Permet de résoudre le problème de la distance entre deux points
--  en ne se préoccupant pas de la représentation des dits points.
--  @group Stratégie
package Calcul_Distance_P.Strategie_P is

   --  La stratégie concrète de résolution du problème.
   type Strategie_T is new Calcul_Distance_T with private;

   overriding
   --  Résout le problème de la distance entre deux points.
   --  @param Strategie
   --  La stratégie qui va résoudre le problème.
   --  @param Probleme
   --  Le problème à résoudre.
   procedure Resoudre
   (
      Strategie : Strategie_T;
      Probleme : in out Probleme_Distance_T'Class
   );

private

   type Strategie_T is new Calcul_Distance_T with null record;

end Calcul_Distance_P.Strategie_P;
