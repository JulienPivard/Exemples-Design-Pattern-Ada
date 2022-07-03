--  @summary
--  Version concrète de la chaine de responsabilité.
--  @description
--  Dans cette version, la chaine ne s'arrête pas une fois qu'un
--  des membres a exécuté une action. Une variante peut s'arrêter
--  quand un des maillon correspond.
--  @group Chaine de Responsabilité
package Gestionnaire_P.Concret_2_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Gestionnaire_Concret_T is new Chaine_De_Responsabilite_T with private;

   function Creer
      (Action : in     Contexte_P.Action_T)
      return Gestionnaire_Concret_T;

   overriding
   procedure Faire_Action
      (
         This     : in out Gestionnaire_Concret_T;
         Contexte : in     Contexte_P.Action_T
      );

private

   type Gestionnaire_Concret_T is new Chaine_De_Responsabilite_T with
      record
         Action : Contexte_P.Action_T;
      end record;

end Gestionnaire_P.Concret_2_P;
