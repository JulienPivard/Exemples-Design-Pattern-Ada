--  @summary
--  Enfant d'une classe avec itérateur.
--  @description
--  Enfant d'une classe avec itérateur.
--  @group Itérateur
package Structure_P.Enfant_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Enfant_T is new Structure_T with private;

private

   type Enfant_T is new Structure_T with
      record
         null;
      end record;

end Structure_P.Enfant_P;
