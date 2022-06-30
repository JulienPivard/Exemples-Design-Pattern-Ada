--  @summary
--  Fabrique de poids mouches.
--  @description
--  S'occupe de fabriquer les poids mouche à la demande.
--  @group Poids Mouche
package Poids_Mouche_P.Fabrique_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Poids_Mouche_A is access all Poids_Mouche_T'Class;

   type Id_Poids_Mouche_T is (Jeton_1, Jeton_2, Jeton_3, Jeton_4, Jeton_5);

   type Fabrique_De_Poids_Mouche_T is tagged private;

   function Initialiser
      return Fabrique_De_Poids_Mouche_T;

   function Fabriquer
      (
         This : in out Fabrique_De_Poids_Mouche_T;
         Clef : in     Id_Poids_Mouche_T
      )
      return Poids_Mouche_A;

private

   type Fabrique_De_Poids_Mouche_T is tagged
      record
         null;
      end record;

end Poids_Mouche_P.Fabrique_P;
