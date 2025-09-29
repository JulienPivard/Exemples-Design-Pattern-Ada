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

with Etat_P;
with Poids_Mouche_Access_P.Fabrique_P;
with Poids_Mouche_P.Fabrique_P;

procedure Client is
   package Fab_Access_P renames Poids_Mouche_Access_P.Fabrique_P;

   ---------------------------------------------------------------------------
   procedure Consomer_Jeton
      (
         Fabrique : in out Fab_Access_P.Fabrique_De_Poids_Mouche_T;
         Jeton    : in     Fab_Access_P.Id_Poids_Mouche_T;
         Etat_Ext : in     Etat_P.Etat_Externe_T
      );

   procedure Consomer_Jeton
      (
         Fabrique : in out Fab_Access_P.Fabrique_De_Poids_Mouche_T;
         Jeton    : in     Fab_Access_P.Id_Poids_Mouche_T;
         Etat_Ext : in     Etat_P.Etat_Externe_T
      )
   is
      P : constant Fab_Access_P.Poids_Mouche_A :=
         Fabrique.Fabriquer (Clef => Jeton, Nom => "Truite              ");
   begin
      P.all.Operation (Etat => Etat_Ext);
      Ada.Text_IO.New_Line (Spacing => 1);
   end Consomer_Jeton;
   ---------------------------------------------------------------------------

   package Fab_P renames Poids_Mouche_P.Fabrique_P;

   ---------------------------------------------------------------------------
   procedure Consomer_Jeton
      (
         Fabrique : in out Fab_P.Fabrique_De_Poids_Mouche_T;
         Jeton    : in     Fab_P.Id_Poids_Mouche_T;
         Etat_Ext : in     Etat_P.Etat_Externe_T
      );

   procedure Consomer_Jeton
      (
         Fabrique : in out Fab_P.Fabrique_De_Poids_Mouche_T;
         Jeton    : in     Fab_P.Id_Poids_Mouche_T;
         Etat_Ext : in     Etat_P.Etat_Externe_T
      )
   is
      P : constant Poids_Mouche_P.Poids_Mouche_T'Class :=
         Fabrique.Fabriquer (Clef => Jeton, Nom => "Saumon              ");
   begin
      P.Operation (Etat => Etat_Ext);
      Ada.Text_IO.New_Line (Spacing => 1);
   end Consomer_Jeton;
   ---------------------------------------------------------------------------

   E : Etat_P.Etat_Externe_T;

   F_A : Fab_Access_P.Fabrique_De_Poids_Mouche_T := Fab_Access_P.Initialiser;
   F   : Fab_P.Fabrique_De_Poids_Mouche_T        := Fab_P.Initialiser;
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
      (Item => "Démonstration du design pattern poids mouche.");
   Ada.Text_IO.Put_Line (Item => "Le principe est diminuer la charge sur la");
   Ada.Text_IO.Put_Line (Item => "mémoire qu'induit un grand nombre ");
   Ada.Text_IO.Put_Line (Item => "d'instances d'objets similaire et dont");
   Ada.Text_IO.Put_Line (Item => "l'état interne est fixe.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   E.Modifier_Val (Val => 19);

   Consomer_Jeton
      (Fabrique => F_A, Jeton => Fab_Access_P.Jeton_1, Etat_Ext => E);
   Consomer_Jeton
      (Fabrique => F_A, Jeton => Fab_Access_P.Jeton_2, Etat_Ext => E);
   Consomer_Jeton
      (Fabrique => F_A, Jeton => Fab_Access_P.Jeton_3, Etat_Ext => E);
   Consomer_Jeton
      (Fabrique => F_A, Jeton => Fab_Access_P.Jeton_4, Etat_Ext => E);
   Consomer_Jeton
      (Fabrique => F_A, Jeton => Fab_Access_P.Jeton_5, Etat_Ext => E);

   pragma Unreferenced (F_A);

   Ada.Text_IO.New_Line (Spacing => 1);
   E.Modifier_Val (Val => 5);

   Consomer_Jeton (Fabrique => F, Jeton => Fab_P.Jeton_1, Etat_Ext => E);
   Consomer_Jeton (Fabrique => F, Jeton => Fab_P.Jeton_2, Etat_Ext => E);
   Consomer_Jeton (Fabrique => F, Jeton => Fab_P.Jeton_3, Etat_Ext => E);
   Consomer_Jeton (Fabrique => F, Jeton => Fab_P.Jeton_4, Etat_Ext => E);
   Consomer_Jeton (Fabrique => F, Jeton => Fab_P.Jeton_5, Etat_Ext => E);

   pragma Unreferenced (F);

   Ada.Text_IO.New_Line (Spacing => 2);

exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
