--  @summary
--  Implémenteur derrière le pont.
--  @description
--  Implémenteur derrière le pont.
--  @group Pont
package Implementeur_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Implementeur_T is interface;

   procedure Operation_1
      (This : in out Implementeur_T)
   is abstract;

   procedure Operation_2
      (This : in out Implementeur_T)
   is abstract;

   procedure Operation_3
      (This : in out Implementeur_T)
   is abstract;

   procedure Operation_4
      (This : in out Implementeur_T)
   is abstract;

   procedure Operation_5
      (This : in out Implementeur_T)
   is abstract;

end Implementeur_P;
