--  @summary
--  Le sujet visé par la procuration.
--  @description
--  Le sujet visé par la procuration.
--  @group Procuration
package Sujet_P.Reel_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Sujet_Reel_T is new Sujet_T with private;

   function Creer
      return Sujet_Reel_T;

   overriding
   procedure Operation
      (This : in out Sujet_Reel_T);

private

   type Sujet_Reel_T is new Sujet_T with
      record
         null;
      end record;

end Sujet_P.Reel_P;
