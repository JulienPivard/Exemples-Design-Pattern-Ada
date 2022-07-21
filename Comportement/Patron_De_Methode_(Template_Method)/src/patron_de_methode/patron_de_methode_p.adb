with Ada.Text_IO;

package body Patron_De_Methode_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   procedure Methode_Patron
      (This : in out Patron_De_Methode_T'Class)
   is
   begin
      Ada.Text_IO.Put_Line (Item => "--  Début du code commun  --");
      Ada.Text_IO.Put_Line (Item => "----------------------------");
      This.Operation_1;
      Ada.Text_IO.Put_Line (Item => "-------------------------------------");
      Ada.Text_IO.Put_Line (Item => "--  Les opérations intermédiaire.  --");
      Ada.Text_IO.Put_Line (Item => "-------------------------------------");
      This.Operation_2;
      Ada.Text_IO.Put_Line (Item => "---------------------------------");
      Ada.Text_IO.Put_Line (Item => "--  Fin du patron de méthode.  --");
   end Methode_Patron;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Patron_De_Methode_P;
