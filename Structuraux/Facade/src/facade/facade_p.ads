--  @summary
--  Exemple de pattern Façade.
--  @description
--  Exemple du pattern Façade. Il est plus
--  simple et pertinent d'utiliser un package.
--  @group Façade
package Facade_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Facade_T is tagged private;

   procedure Executer
      (Facade : in     Facade_T);

private

   type Facade_T is tagged
      record
         null;
      end record;

end Facade_P;
