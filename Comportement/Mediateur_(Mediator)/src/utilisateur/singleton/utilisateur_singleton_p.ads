with Collegue_Abstrait_P;
with Utilisateur_Abstrait_P;

--  @summary
--  Une petite explication
--  @description
--  Une description plus longue
--  @group Utilisateur
package Utilisateur_Singleton_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Utilisateur_T is abstract new
      Utilisateur_Abstrait_P.Utilisateur_T and
      Collegue_Abstrait_P.Collegue_T with private;

private

   type Utilisateur_T is abstract new
      Utilisateur_Abstrait_P.Utilisateur_T and
      Collegue_Abstrait_P.Collegue_T with null record;

end Utilisateur_Singleton_P;
