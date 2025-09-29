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

with Fabrique_P.Concret_1_P;
with Fabrique_P.Concret_2_P;
with Fabrique_P;
with Produit_P;

procedure Client is
   ---------------------------------------------------------------------------
   procedure Utiliser
      (Fabrique : in     Fabrique_P.Fabrique_T'Class);

   ------------------
   procedure Utiliser
      (Fabrique : in     Fabrique_P.Fabrique_T'Class)
   is
      P : Produit_P.Produit_T'Class := Fabrique.Fabriquer;
   begin
      P.Initialiser;
      P.Afficher;
   end Utiliser;
   ---------------------------------------------------------------------------

   F_1 : Fabrique_P.Concret_1_P.Concret_T;
   F_2 : Fabrique_P.Concret_2_P.Concret_T;
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
      (Item => "Démonstration du design pattern Fabrication.");
   Ada.Text_IO.Put_Line (Item => "Définit une interface de création d'objets");
   Ada.Text_IO.Put_Line (Item => "mais laisse à ses filles le soins de");
   Ada.Text_IO.Put_Line (Item => "créer les instances concrète du produit.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Utiliser (Fabrique => F_1);
   Ada.Text_IO.New_Line (Spacing => 1);
   Utiliser (Fabrique => F_2);

   Ada.Text_IO.New_Line (Spacing => 2);

exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
