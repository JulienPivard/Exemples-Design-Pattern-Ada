with Distance_P;

--  @summary
--  Stratégie de résolution abstraite du calcul de distance entre deux points.
--  @description
--  Permet de résoudre le problème de la distance entre deux points
--  en ne se préoccupant pas de la représentation des dits points.
--  @group Stratégie
package Strategie_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Calcul_Distance_T is abstract tagged private;
   --  Stratégie abstraite de calcul du problème
   --  de distance entre deux points.

   procedure Resoudre
      (
         Strategie   : in     Calcul_Distance_T;
         Probleme    : in out Distance_P.Probleme_T
      )
   is abstract;
   --  Résout le problème de la distance entre deux points.
   --  @param Strategie
   --  La stratégie qui va résoudre le problème.
   --  @param Probleme
   --  Le problème à résoudre.

private

   type Calcul_Distance_T is abstract tagged null record;

end Strategie_P;
