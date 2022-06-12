--  @summary
--  Illustration du mécanisme de persistance Shared_Passive
--  @description
--  Stocke automatiquement les valeurs déclaré ici dans un fichier texte
--  et les recharge au lancement du programme.
--  @group Stockage
package Comptage_P is

   pragma Shared_Passive;

   pragma Annotate
      (
         gnatcheck,
         Exempt_On,
         "Global_Variables",
         "Expérimentation avec les paquet partagé passivement"
      );
   Compteur : Natural := 0;
   pragma Annotate
      (
         gnatcheck,
         Exempt_Off,
         "Global_Variables"
      );

end Comptage_P;
