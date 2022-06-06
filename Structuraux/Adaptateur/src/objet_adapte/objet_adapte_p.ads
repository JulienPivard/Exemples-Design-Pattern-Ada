--  @summary
--  L'objet adapté.
--  @description
--  Objet qui à besoin d'être adapté pour être utilisé par le client.
--  @group Objet adapté
package Objet_Adapte_P
   with
      Pure           => False,
      Preelaborate   => False,
      Elaborate_Body => True,
      Spark_Mode     => Off
is

   type Objet_Adapte_T is tagged private;

   procedure Faire_Action
      (This : in out Objet_Adapte_T);

private

   type Objet_Adapte_T is tagged
      record
         null;
      end record;

end Objet_Adapte_P;
