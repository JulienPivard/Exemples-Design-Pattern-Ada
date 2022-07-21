with Ada.Text_IO;

package body Adaptateur_D_Objet_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Faire
      (This : in out Adaptateur_T)
   is
   begin
      Ada.Text_IO.Put_Line (Item => "Utilisation de l'adaptateur d'objets.");
      Ada.Text_IO.Put_Line (Item => "Appel à la procédure de l'objet visé");

      This.Objet.Faire_Action;
   end Faire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Adaptateur_D_Objet_P;
