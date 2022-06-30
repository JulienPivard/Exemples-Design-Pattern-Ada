private

--  @summary
--  Poids mouche concret mais avec un état non partagé.
--  @description
--  Poids mouche concret mais avec un état non partagé.
--  @group Poids Mouche
package Poids_Mouche_P.Concret_Non_Partage_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Poids_Mouche_Concret_1_T is new Poids_Mouche_T with private;

   overriding
   procedure Operation
      (
         This : in out Poids_Mouche_Concret_1_T;
         Etat : in     Etat_P.Etat_Externe_T
      );

   type Poids_Mouche_Concret_2_T is new Poids_Mouche_T with private;

   overriding
   procedure Operation
      (
         This : in out Poids_Mouche_Concret_2_T;
         Etat : in     Etat_P.Etat_Externe_T
      );

private

   type Poids_Mouche_Concret_1_T is new Poids_Mouche_T with
      record
         null;
      end record;

   type Poids_Mouche_Concret_2_T is new Poids_Mouche_T with
      record
         null;
      end record;

end Poids_Mouche_P.Concret_Non_Partage_P;
