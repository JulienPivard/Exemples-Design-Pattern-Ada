--  @summary
--  Utilisé par la chaine de responsabilité.
--  @description
--  Le contexte d'exécution qui va permettre aux maillons de la
--  chaine de savoir si ils doivent s'exécuter ou non.
--  @group Contexte
package Contexte_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Action_T is (Action_1, Action_2, Action_3, Action_4, Action_5);

end Contexte_P;
