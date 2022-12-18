--  @summary
--  Version concrète de la chaine de responsabilité.
--  @description
--  Dans cette version, la chaine ne s'arrête pas une fois qu'un
--  des membres a exécuté une action. Une variante peut s'arrêter
--  quand un des maillon correspond.
--  @group Chaine de Responsabilité
package Gestionnaire_P.Concret_4_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Maillon_T is new Maillon_Abstrait_T with private;

   function Creer
      return Maillon_T;

   overriding
   procedure Faire_Action
      (
         This     : in out Maillon_T;
         Contexte : in     Contexte_P.Action_T
      );

   overriding
   function Faire_Action
      (
         This     : in out Maillon_T;
         Contexte : in     Contexte_P.Action_T
      )
      return Boolean;

private

   type Maillon_T is new Maillon_Abstrait_T with
      record
         Action : Contexte_P.Action_T;
      end record;

end Gestionnaire_P.Concret_4_P;
