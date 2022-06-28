with Ada.Text_IO;

package body Facade_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   procedure Executer
      (Facade : in     Facade_T)
   is
   begin
      Ada.Text_IO.Put_Line (Item => "Appel premier objet complexe");
      Ada.Text_IO.Put_Line (Item => "Appel deuxième objet complexe");
      Ada.Text_IO.Put_Line (Item => "Appel troisième objet complexe");
   end Executer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Facade_P;
