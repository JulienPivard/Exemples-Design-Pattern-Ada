------------------------------------------------------------------------------
--                                                                          --
--                          Auteur : PIVARD Julien                          --
--           Dernière modification : Lundi 29 septembre[09] 2025
--                                                                          --
------------------------------------------------------------------------------
with Ada.Characters.Latin_1;
with Ada.Command_Line;
with Ada.Exceptions;
with Ada.Text_IO;

with GNAT.Source_Info;

with Version_Compilateur_P;

with Composant_P.Concret_P;
with Composant_P.Decorateur_P.Ascenseur_P;
with Composant_P.Decorateur_P.Boite_P;
with Texte_P;

procedure Client is
   package ASCII_R renames Ada.Characters.Latin_1;

   ---------------------------------------------------------------------------
   procedure Afficher
      (Texte : in     Composant_P.Composant_T'Class);

   ------------------
   procedure Afficher
      (Texte : in     Composant_P.Composant_T'Class)
   is
      T : Texte_P.Texte_T;
   begin
      T := Texte.Faire (Largeur => 80, Hauteur => Texte_P.Nb_Lignes);

      Boucle_Afficher :
      for P of T loop
         Ada.Text_IO.Put_Line (Item => P);
      end loop Boucle_Afficher;
   end Afficher;
   ---------------------------------------------------------------------------

   C : constant Composant_P.Concret_P.Concret_T :=
      Composant_P.Concret_P.Initialiser
         (
            Text => "« Tout ce que je dis c'est que je pense qu'il est " &
               "franchement improbable qu'il y ait quoi que ce soit qui " &
               "ressemble à une volonté cosmique centrale, à un monde " &
               "spirituel ou à un être éternel. Il s'agit là des idées les " &
               "plus absurdes et les plus injustifiées que l'on puisse " &
               "avoir à propos de l'univers et je ne suis pas assez " &
               "pinailleur pour prétendre que je ne les vois pas comme " &
               "autre chose que de fieffées idioties. Dans l'idée, je suis " &
               "agnostique, mais comme je préfère me ranger du côté des " &
               "preuves tangibles, on doit me classer parmi les athées »" &
               ASCII_R.LF & "H.P. Lovecraft"
         );
   A : Composant_P.Decorateur_P.Ascenseur_P.Ascenseur_T;
   B : Composant_P.Decorateur_P.Boite_P.Boite_T;
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
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern décorateur");
   Ada.Text_IO.Put_Line (Item => "Un texte que l'on cherche à afficher avec");
   Ada.Text_IO.Put_Line (Item => "différentes décoration que l'on voudrait");
   Ada.Text_IO.Put_Line (Item => "pouvoir changer et combiner à volonté.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Afficher (Texte => C);
   --  Affiché sans rien.

   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "-");
   Ada.Text_IO.New_Line (Spacing => 1);

   B.Ajouter (Composant => C);
   Afficher (Texte => B);
   --  Texte affiché avec une boite autour.

   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "-");
   Ada.Text_IO.New_Line (Spacing => 1);

   A.Ajouter (Composant => C);
   Afficher (Texte => A);
   --  Texte affiché avec un ascenseur.

   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "-");
   Ada.Text_IO.New_Line (Spacing => 1);

   B.Ajouter (Composant => C);
   A.Ajouter (Composant => B);
   Afficher (Texte => A);
   --  Texte affiché avec une boite et un ascenseur à côté.

   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "-");
   Ada.Text_IO.New_Line (Spacing => 1);

   A.Ajouter (Composant => C);
   B.Ajouter (Composant => A);
   Afficher (Texte => B);
   --  Texte affiché avec un ascenseur dans une boite.

   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "-");
   Ada.Text_IO.New_Line (Spacing => 1);

   B.Ajouter (Composant => C);
   B.Ajouter (Composant => B);
   Afficher (Texte => B);
   --  Texte affiché avec deux boites.

   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "-");
   Ada.Text_IO.New_Line (Spacing => 1);

   A.Ajouter (Composant => C);
   B.Ajouter (Composant => A);
   B.Ajouter (Composant => B);
   Afficher (Texte => B);
   --  Texte affiché avec un ascenseur dans une boite dans une boite.

   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "-");
   Ada.Text_IO.New_Line (Spacing => 1);

   B.Ajouter (Composant => C);
   A.Ajouter (Composant => B);
   B.Ajouter (Composant => A);
   Afficher (Texte => B);
   --  Texte affiché avec une boite à côté d'un ascenseur dans une boite.

   Ada.Text_IO.New_Line (Spacing => 2);

exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
