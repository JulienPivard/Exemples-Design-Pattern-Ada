--  @summary
--  Un des implémenteurs concret.
--  @description
--  Un des implémenteurs concret.
--  @group Pont
package Implementeur_P.Motif_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Motif_T is new Implementeur_T with private;

   overriding
   procedure Operation_1
      (This : in out Motif_T);

   overriding
   procedure Operation_2
      (This : in out Motif_T);

   overriding
   procedure Operation_3
      (This : in out Motif_T);

private

   type Motif_T is new Implementeur_T with
      record
         null;
      end record;

end Implementeur_P.Motif_P;
