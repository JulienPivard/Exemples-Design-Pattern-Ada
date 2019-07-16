--  @summary
--  Illustration du mécanisme de persistance Shared_Passive
--  @description
--  Stocke automatiquement les valeurs déclaré ici dans un fichier texte
--  et les recharge au lancement du programme.
--  @group Stockage
package Comptage_P is

   pragma Shared_Passive;

   Compteur : Natural := 0;

end Comptage_P;
