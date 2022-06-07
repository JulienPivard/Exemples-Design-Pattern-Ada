private with Ada.Containers.Indefinite_Holders;

private with Implementeur_P;

--  @summary
--  L'abstraction qui sera utilisée par le client.
--  @description
--  L'abstraction qui sera utilisée par le client et qui
--  utilisera l'implémentation définie.
--  C'est une conceptualisation d'actions macroscopique utilisable
--  directement par le client. La réalisation concrète de ses « grandes »
--  actions est dédié à un implémenteur invisible du client.
--  @group Pont
package Abstraction_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Abstraction_T is tagged private;

   procedure Operation
      (This : in out Abstraction_T);

private

   use type Implementeur_P.Implementeur_T;

   package Impl_P is new Ada.Containers.Indefinite_Holders
      (Element_Type => Implementeur_P.Implementeur_T'Class);

   type Abstraction_T is tagged
      record
         Implementeur : Impl_P.Holder;
      end record;

end Abstraction_P;
