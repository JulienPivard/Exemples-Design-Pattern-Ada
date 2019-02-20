--  @summary
--  Stratégie de résolution concrète du calcul de distance entre deux points.
--  @description
--  Permet de résoudre le problème de la distance entre deux points
--  en ne se préoccupant pas de la représentation des dits points.
--  @group Stratégie
package Calcul_Distance_P.Strategie_P is

   type Strategie_T is new Calcul_Distance_T with private;
   --  La stratégie concrète de résolution du problème.

   overriding
   procedure Resoudre
      (
         Strategie   : in Strategie_T;
         Probleme    : in out Distance_P.Probleme_T
      );
   --  Résout le problème de la distance entre deux points.
   --  @param Strategie
   --  La stratégie qui va résoudre le problème.
   --  @param Probleme
   --  Le problème à résoudre.

private

   type Strategie_T is new Calcul_Distance_T with null record;

end Calcul_Distance_P.Strategie_P;
