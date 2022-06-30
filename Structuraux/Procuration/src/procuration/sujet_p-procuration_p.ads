with Ada.Containers.Indefinite_Holders;

--  @summary
--  Une petite explication
--  @description
--  Une description plus longue
--  @group Procuration
package Sujet_P.Procuration_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Procuration_T is new Sujet_T with private;

   overriding
   procedure Operation
      (This : in out Procuration_T);

private

   package Conteneur_P is new Ada.Containers.Indefinite_Holders
      (Element_Type => Sujet_T'Class);

   type Procuration_T is new Sujet_T with
      record
         Sujet : Conteneur_P.Holder := Conteneur_P.Empty_Holder;
      end record;

end Sujet_P.Procuration_P;
