--  @summary
--  Le sujet qui sera utilisé.
--  @description
--  Le sujet qui sera utilisé.
--  @group Procuration
package Sujet_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Sujet_T is interface;

   procedure Operation
      (This : in out Sujet_T)
   is abstract;

end Sujet_P;
