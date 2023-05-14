--  @summary
--  Valeurs possible à utiliser dans les exemples de memento.
--  @description
--  Valeurs possible à utiliser dans les exemples de memento.
--  @group Valeur
package Valeur_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Valeur_T is range -100 .. 100;

end Valeur_P;
