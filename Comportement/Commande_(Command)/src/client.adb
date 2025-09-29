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

with Commande_P;
with Commande_P.Concrete_P;

procedure Client is
   ---------------------------------------------------------------------------
   procedure Executer
      (Commande : in out Commande_P.Commande_T'Class);

   ----------------
   procedure Executer
      (Commande : in out Commande_P.Commande_T'Class)
   is
   begin
      Commande.Execute;
   end Executer;
   ---------------------------------------------------------------------------

   C : Commande_P.Concrete_P.Commande_Concrete_T;
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
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern commande.");
   Ada.Text_IO.Put_Line (Item => "Très similaire à l'idée de callback dans");
   Ada.Text_IO.Put_Line (Item => "les interfaces graphiques.");
   Ada.Text_IO.Put_Line (Item => "On entoure la commande à exécuter pour");
   Ada.Text_IO.Put_Line (Item => "disposer d'une interface générique, mais");
   Ada.Text_IO.Put_Line (Item => "qui permet de faire ce que l'on veux");
   Ada.Text_IO.Put_Line (Item => "derrière.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Executer (Commande => C);

   pragma Unreferenced (C);

   Ada.Text_IO.New_Line (Spacing => 2);
exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
