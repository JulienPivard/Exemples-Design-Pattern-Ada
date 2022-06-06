--  @summary
--  La classe utilisée.
--  @description
--  Classe utilisée par le client.
--  @group Classe utilisée
package Classe_Utilisee_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Classe_Utilisee_T is abstract tagged private;

   procedure Faire
      (This : in out Classe_Utilisee_T)
   is abstract;

private

   type Classe_Utilisee_T is abstract tagged
      record
         null;
      end record;

end Classe_Utilisee_P;
