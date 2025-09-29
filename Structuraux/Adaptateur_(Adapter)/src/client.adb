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

with Adaptateur_De_Classe_P;
with Adaptateur_D_Objet_P;

with Classe_Utilisee_P;

procedure Client is
   ---------------------------------------------------------------------------
   procedure Execute
      (Executrice : in out Classe_Utilisee_P.Classe_Utilisee_T'Class);

   -----------------
   procedure Execute
      (Executrice : in out Classe_Utilisee_P.Classe_Utilisee_T'Class)
   is
   begin
      Executrice.Faire;
   end Execute;
   ---------------------------------------------------------------------------

   A : Adaptateur_De_Classe_P.Adaptateur_T;
   O : Adaptateur_D_Objet_P.Adaptateur_T;
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
      (Item => "Démonstration du design pattern adaptateur.");
   Ada.Text_IO.Put_Line (Item => "Une version adaptateur de classe, et");
   Ada.Text_IO.Put_Line (Item => "une version adaptateur d'objet.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line (Item => "--  Exemple avec adaptateur de classe");
   Ada.Text_IO.New_Line (Spacing => 1);
   Execute (Executrice => A);
   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line (Item => "--  Exemple avec adaptateur d'objets");
   Ada.Text_IO.New_Line (Spacing => 1);
   Execute (Executrice => O);

   pragma Unreferenced (A);
   pragma Unreferenced (O);

   Ada.Text_IO.New_Line (Spacing => 2);

exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
