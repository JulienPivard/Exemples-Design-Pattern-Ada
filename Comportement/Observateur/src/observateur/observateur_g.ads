generic

   type Etat_G_T is private;

--  @summary
--  Observateur en attente de changement de son sujet.
--  @description
--  Observateur en attente de changement de son sujet.
--  @group Observateur
package Observateur_G is

   pragma Pure;
   pragma Spark_Mode (Off);

   type Observateur_T is interface;
   --  L'observateur.

   procedure Mettre_A_Jour
      (
         This : in out Observateur_T;
         Etat : in     Etat_G_T
      )
   is abstract;
   --  Interface pour que le sujet puisse demander à l'observateur
   --  de se mettre à jour.
   --  @param This
   --  L'observateur.
   --  @param Etat
   --  Le nouvel état du sujet.

end Observateur_G;
