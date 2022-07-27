with Mediateur_P;

--  @summary
--  Pour le médiateur version pointeur.
--  @description
--  Pour le médiateur version pointeur.
--  @group Médiateur
package Accee_P
   with
      Pure           => False,
      Preelaborate   => True,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Mediateur_A is access all Mediateur_P.Mediateur_T'Class
      with Storage_Size => 0;
   --  Pointeur sur un médiateur. Aucune allocation dynamique n'est autorisé.

end Accee_P;
