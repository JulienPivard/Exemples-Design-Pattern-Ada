--  @summary
--  Le médiateur qui va gérer les relations entre classes collègues.
--  @description
--  Le médiateur qui va gérer les relations entre classes collègues.
--  @group Médiateur
package Mediateur_P
   with
      Pure           => False,
      Preelaborate   => True,
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

   type Mediateur_A is access all Mediateur_T'Class
      with Storage_Size => 0;
   --  Pointeur sur un médiateur. Aucune allocation dynamique n'est autorisé.

end Mediateur_P;
