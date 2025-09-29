------------------------------------------------------------------------------
--                                                                          --
--                          Auteur : PIVARD Julien                          --
--           Dernière modification : Lundi 29 septembre[09] 2025
--                                                                          --
------------------------------------------------------------------------------
with Ada.Command_Line;
with Ada.Exceptions;
with Ada.Text_IO;

with GNAT.Source_Info;

with Version_Compilateur_P;

with Patron_De_Methode_P.Concret_1_P;
with Patron_De_Methode_P.Concret_2_P;
with Patron_De_Methode_P;

procedure Client is
   ---------------------------------------------------------------------------
   procedure Faire
      (Patron : in out Patron_De_Methode_P.Patron_De_Methode_T'Class);

   ---------------
   procedure Faire
      (Patron : in out Patron_De_Methode_P.Patron_De_Methode_T'Class)
   is
   begin
      Patron.Methode_Patron;
   end Faire;
   ---------------------------------------------------------------------------

   C_1 : Patron_De_Methode_P.Concret_1_P.Concret_T;
   C_2 : Patron_De_Methode_P.Concret_2_P.Concret_T;
begin
   Ada.Command_Line.Set_Exit_Status
      (Code => Ada.Command_Line.Success);

   Ada.Text_IO.Put      (Item => "+---------------------+");
   Ada.Text_IO.Put_Line (Item => " - - - - - - - - - - - ");
   Ada.Text_IO.Put      (Item => "| Date de compilation :");
   Ada.Text_IO.Put      (Item => "  ");
   Ada.Text_IO.Put      (Item => GNAT.Source_Info.Compilation_ISO_Date);
   Ada.Text_IO.Put      (Item => " ");
   Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Compilation_Time);
   Ada.Text_IO.Put      (Item => "+---------------------+");
   Ada.Text_IO.Put_Line (Item => " - - - - - - - - - - - ");

   Ada.Text_IO.Put      (Item => "Version du compilateur : ");
   Ada.Text_IO.Put_Line (Item => "[" & Version_Compilateur_P.Version & "]");

   Ada.Text_IO.New_Line (Spacing => 1);

   --  Ada.Text_IO.Put      (Item => "Procédure : [");
   --  Ada.Text_IO.Put      (Item => GNAT.Source_Info.Enclosing_Entity);
   --  Ada.Text_IO.Put      (Item => "], une instance de : ");
   --  Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);

   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line
      (Item => "Démonstration du design pattern patron de méthode.");
   Ada.Text_IO.Put_Line (Item => "La classe mère possède deux méthodes");
   Ada.Text_IO.Put_Line (Item => "abstraites et une méthode patron.");
   Ada.Text_IO.Put_Line (Item => "Deux classes filles vont les implémenter.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Faire (Patron => C_1);
   Ada.Text_IO.New_Line (Spacing => 2);
   Faire (Patron => C_2);

   pragma Unreferenced (C_1);
   pragma Unreferenced (C_2);

   Ada.Text_IO.New_Line (Spacing => 2);

exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
