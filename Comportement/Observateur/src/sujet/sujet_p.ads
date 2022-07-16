with Observateur_P;
with Sujet_G;

--  @summary
--  Le sujet qui va être observé.
--  @description
--  Le sujet qui va être observé par un ou plusieurs observateurs.
--  @group Observateur
package Sujet_P is new Sujet_G
   (Observateur_G_P => Observateur_P);
