--  @summary
--  La classe adaptée.
--  @description
--  Cette classe sera héritée par l'adaptateur de classe.
--  Son interface est incompatible avec la classe appelante.
--  @group Classe adaptée
package Classe_Adaptee_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Classe_Adapte_T is interface;

   procedure Faire_Action
      (This : in out Classe_Adapte_T)
   is abstract;

private

end Classe_Adaptee_P;
