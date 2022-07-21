with Observateur_G;
with Valeurs_P;

--  @summary
--  Observateur en attente de changement de son sujet.
--  @description
--  Observateur en attente de changement de son sujet.
--  @group Observateur
package Observateur_P is new Observateur_G
   (Etat_G_T => Valeurs_P.Table_Valeurs_T);
