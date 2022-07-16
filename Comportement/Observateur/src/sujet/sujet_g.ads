with Observateur_G;

generic

   with package Observateur_G_P is new Observateur_G (Etat_G_T => <>);

--  @summary
--  Le sujet qui va être observé.
--  @description
--  Le sujet qui va être observé par un ou plusieurs observateurs.
--  @group Observateur
package Sujet_G is

   pragma Pure;
   pragma Spark_Mode (Off);

   type Sujet_T is interface;
   --  Le sujet observé.

   procedure Attache
      (
         This        : in out Sujet_T;
         Observateur : in     Observateur_G_P.Observateur_T'Class
      )
   is abstract;
   --  Attache un observateur.
   --  @param This
   --  Le sujet observé.
   --  @param Observateur
   --  L'observateur à attacher.

   procedure Detache
      (
         This        : in out Sujet_T;
         Observateur : in     Observateur_G_P.Observateur_T'Class
      )
   is abstract;
   --  Détache un observateur.
   --  @param This
   --  Le sujet observé.
   --  @param Observateur
   --  L'observateur à attacher.

   procedure Notifier
      (This : in out Sujet_T)
   is abstract;
   --  Notifie tous ses observateurs.
   --  @param This
   --  Le sujet modifié.

end Sujet_G;
