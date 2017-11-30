with Distance_P;

--  @summary
--  Stratégie de résolution abstraite du calcul de distance entre deux points.
--  @description
--  Permet de résoudre le problème de la distance entre deux points
--  en ne se préoccupant pas de la représentation des dits points.
--  @group Stratégie
package Calcul_Distance_P is

   pragma Pure;
   use Distance_P;

   --  Stratégie abstraite de calcul du problème
   --  de distance entre deux points.
   type Calcul_Distance_T is abstract tagged private;

   --  Résout le problème de la distance entre deux points.
   --  @param Strategie
   --  La stratégie qui va résoudre le problème.
   --  @param Probleme
   --  Le problème à résoudre.
   procedure Resoudre
   (
      Strategie : Calcul_Distance_T;
      Probleme : in out Probleme_Distance_T'Class
   )
   is abstract;

private

   type Calcul_Distance_T is abstract tagged null record;

end Calcul_Distance_P;
