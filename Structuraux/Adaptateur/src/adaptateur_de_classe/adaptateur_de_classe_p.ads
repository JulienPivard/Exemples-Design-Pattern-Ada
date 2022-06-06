with Classe_Adaptee_P;
with Classe_Utilisee_P;

--  @summary
--  Un adaptateur de classe.
--  @description
--  Adapte une classe vers une autre pour la rendre utilisable,
--  tout en descendant de la classe qu'il faut adapter.
--  @group Adaptateur
package Adaptateur_De_Classe_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Adaptateur_T is new
      Classe_Utilisee_P.Classe_Utilisee_T
      and
      Classe_Adaptee_P.Classe_Adapte_T with private;

   overriding
   procedure Faire
      (This : in out Adaptateur_T);

   overriding
   procedure Faire_Action
      (This : in out Adaptateur_T);

private

   type Adaptateur_T is new
      Classe_Utilisee_P.Classe_Utilisee_T
      and
      Classe_Adaptee_P.Classe_Adapte_T with
      record
         null;
      end record;

end Adaptateur_De_Classe_P;
