private

--  @summary
--  Poids mouche concret.
--  @description
--  Chaque poids_mouche_t est un record vide qui n'est la que
--  pour servir de proxy vers le véritable objet. On évite les
--  pointeurs et le cout n'est pas plus élevé que dans le cas
--  d'un pointeur.
--  @group Poids Mouche
package Poids_Mouche_P.Concret_P
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
         This : in     Poids_Mouche_Concret_1_T;
         Etat : in     Etat_P.Etat_Externe_T
      );

   type Poids_Mouche_Concret_2_T is new Poids_Mouche_T with private;

   overriding
   procedure Operation
      (
         This : in     Poids_Mouche_Concret_2_T;
         Etat : in     Etat_P.Etat_Externe_T
      );

   type Poids_Mouche_Concret_3_T is new Poids_Mouche_T with private;

   overriding
   procedure Operation
      (
         This : in     Poids_Mouche_Concret_3_T;
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

   type Poids_Mouche_Concret_3_T is new Poids_Mouche_T with
      record
         null;
      end record;

end Poids_Mouche_P.Concret_P;
