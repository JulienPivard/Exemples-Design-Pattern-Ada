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

with Directeur_P;
with Builder_P.Html_P;
with Produit_Html_P;
with Builder_P.Markdown_P;
with Produit_Markdown_P;

procedure Client is
   package Html_B_R renames Builder_P.Html_P;
   package Mark_B_R renames Builder_P.Markdown_P;

   Dir          : Directeur_P.Directeur_T;
   Monteur_Html : Html_B_R.Monteur_Html_T;
   Texte_Html   : Produit_Html_P.Texte_Html_T;
   Monteur_Mark : Mark_B_R.Monteur_Markdown_T;
   Texte_Mark   : Produit_Markdown_P.Texte_Markdown_T;
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
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern Monteur.");
   Ada.Text_IO.Put_Line (Item => "Construit un texte à balise en fonction");
   Ada.Text_IO.Put_Line (Item => "du format choisi.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line (Item => "--------------");

   Dir.Construire (Monteur => Monteur_Html);
   Texte_Html := Monteur_Html.Recuperer_Resultat;
   Texte_Html.Rendu;

   Ada.Text_IO.Put_Line (Item => "--------------");

   Dir.Construire (Monteur => Monteur_Mark);
   Texte_Mark := Monteur_Mark.Recuperer_Resultat;
   Texte_Mark.Rendu;

   Ada.Text_IO.Put_Line (Item => "--------------");

   Ada.Text_IO.New_Line (Spacing => 2);

exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
