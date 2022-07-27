--  @summary
--  Le médiateur qui va gérer les relations entre classes collègues.
--  @description
--  Le médiateur qui va gérer les relations entre classes collègues.
--  @group Médiateur
package Mediateur_P
   with
      Pure           => True,
      Preelaborate   => False,
      Elaborate_Body => False,
      Spark_Mode     => Off
is

   type Id_T is range 1 .. 2;
   --  Identifiant unique d'un collègue.

   type Mediateur_T is interface;
   --  Version abstraite du médiateur.

   procedure Signaler
      (
         This : in out Mediateur_T;
         Id   : in     Id_T
      )
   is abstract;
   --  Permet à un collègue de signaler qu'un changement est intervenu.
   --  @param This
   --  Le médiateur.
   --  @param Id
   --  L'identifiant de celui qui signal le changement.

end Mediateur_P;
