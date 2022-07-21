with Ada.Text_IO;

package body Visiteur_P.Code_Generateur_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Visiter_Code_Class
      (
         This : in out Code_Generateur_T;
         Obj  : in out Uml_P.Code_Class_T'Class
      )
   is
      pragma Unreferenced (This);
      pragma Unreferenced (Obj);
   begin
      Ada.Text_IO.Put_Line (Item => "Classe visitée par code générateur.");
   end Visiter_Code_Class;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Visiteur_P.Code_Generateur_P;
