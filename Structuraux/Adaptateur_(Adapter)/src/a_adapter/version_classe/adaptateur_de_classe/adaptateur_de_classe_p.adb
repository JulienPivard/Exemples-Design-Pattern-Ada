with Ada.Text_IO;

package body Adaptateur_De_Classe_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Faire
      (This : in out Adaptateur_T)
   is
   begin
      Ada.Text_IO.Put_Line (Item => "Utilisation de l'adaptateur de classe.");
      Ada.Text_IO.Put_Line (Item => "Appel à la procédure visée");

      This.Faire_Action;
   end Faire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Faire_Action
      (This : in out Adaptateur_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line
         (Item => "Appel à la procédure de la classe adaptée.");
   end Faire_Action;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Adaptateur_De_Classe_P;
