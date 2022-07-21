--  @summary
--  Une petite explication
--  @description
--  Une description plus longue
--  @group Un nom de groupe
package Abstraction_P.Fenetre_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Fenetre_T is new Abstraction_T with private;

   procedure Faire_Fenetre
      (
         This : in out Fenetre_T
      );

private

   type Fenetre_T is new Abstraction_T with
      record
         null;
      end record;

end Abstraction_P.Fenetre_P;
