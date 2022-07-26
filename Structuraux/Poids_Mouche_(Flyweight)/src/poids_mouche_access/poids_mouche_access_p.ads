with Etat_P;

--  @summary
--  Poids mouche classe abstraite.
--  @description
--  Spécification abstraite du poids mouche. Ce sont ses classes
--  enfants qui définiront des applications concrètes.
--  @group Poids Mouche
package Poids_Mouche_Access_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   subtype Nom_T is String (1 .. 20);
   --  Un nom stocké dans l'instance.

   type Poids_Mouche_T is interface;
   --  Un poids mouche.

   procedure Operation
      (
         This : in     Poids_Mouche_T;
         Etat : in     Etat_P.Etat_Externe_T
      )
   is abstract;
   --  Opération qui peux être réalisé sur un poids mouche, il a besoin de
   --  connaitre l'état du monde externe pour travailler.
   --  @param This
   --  L'instance du poids mouche.
   --  @param Etat
   --  L'état externe.

end Poids_Mouche_Access_P;
