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

with Fabrique_P;
with Fabrique_P.Markdown_P;
with Fabrique_P.Html_P;
with Produit_A_P;
with Produit_B_P;

procedure Client is
   ---------------------------------------------------------------------------
   procedure Construire
      (
         Fabrique : in     Fabrique_P.Fabrique_T'Class;
         Titre    : in     String
      );
   --  Construit les produits à partir de la fabrique.
   --  @param Fabrique
   --  La fabrique.
   --  @param Titre
   --  Le titre à afficher.

   --------------------
   procedure Construire
      (
         Fabrique : in     Fabrique_P.Fabrique_T'Class;
         Titre    : in     String
      )
   is
      Produit_A : constant Produit_A_P.Produit_T'Class :=
         Fabrique.Creer_Produit_A;
      Produit_B : constant Produit_B_P.Produit_T'Class :=
         Fabrique.Creer_Produit_B;
   begin
      Ada.Text_IO.Put_Line (Item    => Titre);
      Ada.Text_IO.New_Line (Spacing => 1);
      Produit_A.Annonce;
      Produit_B.Presente;
   end Construire;
   ---------------------------------------------------------------------------

   package Fab_1_R renames Fabrique_P.Markdown_P;
   package Fab_2_R renames Fabrique_P.Html_P;

   Fabrique_1 : Fab_1_R.Fabrique_Markdown_T;
   Fabrique_2 : Fab_2_R.Fabrique_Html_T;
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
      (Item => "Démonstration du design pattern Fabrique Abstraite.");
   Ada.Text_IO.Put_Line (Item => "Une fabrique qui génère des instances");
   Ada.Text_IO.Put_Line (Item => "concrète d'objets d'une même famille.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line (Item => "----------------------------");
   Construire (Fabrique => Fabrique_1, Titre => "En markdown : ");

   Ada.Text_IO.Put_Line (Item => "----------------------------");

   Construire (Fabrique => Fabrique_2, Titre => "En html : ");
   Ada.Text_IO.Put_Line (Item => "----------------------------");

   Ada.Text_IO.New_Line (Spacing => 2);

exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
