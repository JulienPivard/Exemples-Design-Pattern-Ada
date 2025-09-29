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

with Observateur_Chiffre_P;
with Observateur_Graphe_P;
with Valeurs_P.Concret_P;

procedure Client is
   G : constant Observateur_Graphe_P.Graphe_T   := Observateur_Graphe_P.Creer;
   C : constant Observateur_Chiffre_P.Chiffre_T := Observateur_Chiffre_P.Creer;

   V : Valeurs_P.Concret_P.Sujet_T;
   T : Valeurs_P.Table_Valeurs_T;
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
      (Item => "Démonstration du design pattern observateur.");
   Ada.Text_IO.Put_Line (Item => "Observateur sans pointeur, mais qui");
   Ada.Text_IO.Put_Line (Item => "nécessite de passer par un singleton,");
   Ada.Text_IO.Put_Line (Item => "dans les coulisses, pour faire référence");
   Ada.Text_IO.Put_Line (Item => "à un même objet si il y a besoin.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line (Item => "On attache un observateur de [graphe]");
   V.Attache (Observateur => C);
   Ada.Text_IO.Put_Line (Item => "On attache un observateur de [valeurs]");
   V.Attache (Observateur => G);

   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line
      (Item => "  Modification des valeurs de l'objet surveillé");
   Ada.Text_IO.Put_Line
      (Item => "  Provoque La mise à jour des observateurs :");
   T := Valeurs_P.Table_Valeurs_T'
      (
         1 => 4,
         2 => 32,
         3 => 9,
         4 => 55,
         5 => 0
      );
   V.Modifier (Vals => T);

   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line
      (Item => "  Modification des valeurs de l'objet surveillé");
   Ada.Text_IO.Put_Line
      (Item => "  Provoque La mise à jour des observateurs :");
   T := Valeurs_P.Table_Valeurs_T'
      (
         1 => 32,
         2 => 0,
         3 => 55,
         4 => 4,
         5 => 9
      );
   V.Modifier (Vals => T);

   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line
      (Item => "  Modification des valeurs de l'objet surveillé");
   Ada.Text_IO.Put_Line
      (Item => "  Provoque La mise à jour des observateurs :");
   T := Valeurs_P.Table_Valeurs_T'
      (
         1 => 9,
         2 => 36,
         3 => 4,
         4 => 19,
         5 => 32
      );
   V.Modifier (Vals => T);

   pragma Unreferenced (V);

   Ada.Text_IO.New_Line (Spacing => 2);

exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
