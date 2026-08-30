with Ada.Text_IO;

package body Objet_Adapte_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   procedure Faire_Action
      (This : in out Objet_Adapte_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => "Faire action de l'objet adapté.");
   end Faire_Action;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Objet_Adapte_P;
