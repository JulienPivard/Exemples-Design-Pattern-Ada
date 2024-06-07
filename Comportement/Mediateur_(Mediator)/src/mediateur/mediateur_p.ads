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

   type ID_T is private;
   --  Identifiant unique d'un collègue.

   Pas_D_ID : constant ID_T;

   type Mediateur_T is interface;
   --  Version abstraite du médiateur.

   procedure Signaler
      (
         This : in out Mediateur_T;
         ID   : in     ID_T
      )
   is abstract;
   --  Permet à un collègue de signaler qu'un changement est intervenu.
   --  @param This
   --  Le médiateur.
   --  @param ID
   --  L'identifiant de celui qui signal le changement.

private

   type ID_G_T is range 1 .. 2;

   type ID_T (Est_Valide : Boolean := False) is
      record
         case Est_Valide is
            when True  =>
               ID : ID_G_T := ID_G_T'First;
            when False =>
               null;
         end case;
      end record;

   Pas_D_ID : constant ID_T := ID_T'(Est_Valide => False);

end Mediateur_P;
