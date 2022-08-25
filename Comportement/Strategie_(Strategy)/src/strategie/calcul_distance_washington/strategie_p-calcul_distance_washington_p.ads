--  @summary
--  Stratégie de résolution concrète du calcul de distance entre deux points.
--  @description
--  Permet de résoudre le problème de la distance entre deux points
--  en ne se préoccupant pas de la représentation des dits points.
--  @group Stratégie
package Strategie_P.Calcul_Distance_Washington_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Washington_T is new Strategie_T with private;
   --  La stratégie concrète de résolution du problème.

   overriding
   procedure Resoudre
      (
         Strategie : in     Washington_T;
         Probleme  : in out Distance_P.Probleme_T
      );
   --  Résout le problème de la distance entre deux points.
   --  @param Strategie
   --  La stratégie qui va résoudre le problème.
   --  @param Probleme
   --  Le problème à résoudre.

private

   type Washington_T is new Strategie_T with null record;

end Strategie_P.Calcul_Distance_Washington_P;
