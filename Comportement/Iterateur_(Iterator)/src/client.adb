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

with Data_P;
with Structure_P;
with Structure_P.Enfant_P;

procedure Client is
   ---------------------------------------------------------------------------
   procedure Initialiser
      (Structure : in out Structure_P.Structure_T'Class);

   procedure Initialiser
      (Structure : in out Structure_P.Structure_T'Class)
   is
      use type Data_P.Element_T;

      Valeur : Data_P.Element_T := 1;
   begin
      Ada.Text_IO.Put_Line (Item => "Remplissage tableau.");

      Boucle_Remplissage :
      for E : Data_P.Element_T of Structure loop
         Valeur := 2 * Valeur;
         E      := Valeur;
      end loop Boucle_Remplissage;

      Ada.Text_IO.Put_Line (Item => "Affichage pour vérifier.");
      Ada.Text_IO.Put      (Item => "Valeurs : ");

      Boucle_Afficher_Contenu :
      for I in Structure_P.Indice_T loop
         Valeur := Structure (I);
         --  On peut utiliser la version simplifié de la lecture de valeur
         --  au lieu de : Structure.Lire_Element (Position => I);
         Ada.Text_IO.Put (Item => Data_P.Element_T'Image (Valeur));
      end loop Boucle_Afficher_Contenu;

      Ada.Text_IO.New_Line (Spacing => 1);
      Ada.Text_IO.Put      (Item    => "   ID   : ");

      Boucle_Afficher_ID :
      for I in Structure_P.Indice_T loop
         Valeur := Structure (I);
         Ada.Text_IO.Put (Item => " " & Structure_P.Indice_T'Image (I));
      end loop Boucle_Afficher_ID;

      Ada.Text_IO.New_Line (Spacing => 3);
   end Initialiser;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Iterer
      (Structure : in     Structure_P.Structure_T'Class);

   procedure Iterer
      (Structure : in     Structure_P.Structure_T'Class)
   is
   begin
      Ada.Text_IO.Put_Line (Item => "Affichage contenu en ordre normale");
      Boucle_Affichage_En_Avant :
      for E : Data_P.Element_T of         Structure loop
         Ada.Text_IO.Put (Item => Data_P.Element_T'Image (E));
      end loop Boucle_Affichage_En_Avant;
      Ada.Text_IO.New_Line (Spacing => 2);

      Ada.Text_IO.Put_Line (Item => "Affichage contenu en ordre inverse");
      Boucle_Affichage_En_Arriere :
      for E : Data_P.Element_T of reverse Structure loop
         Ada.Text_IO.Put (Item => Data_P.Element_T'Image (E));
      end loop Boucle_Affichage_En_Arriere;
      Ada.Text_IO.New_Line (Spacing => 2);
   end Iterer;
   ---------------------------------------------------------------------------

   S : Structure_P.Structure_T;
   E : Structure_P.Enfant_P.Enfant_T;
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
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern itérateur.");
   Ada.Text_IO.Put_Line (Item => "En utilisant les mécanismes du langage.   ");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Initialiser (Structure => S);
   Iterer      (Structure => S);

   Ada.Text_IO.Put_Line (Item => "------------------------");
   Ada.Text_IO.Put_Line (Item => "Test avec de l'héritage.");
   Ada.Text_IO.Put_Line (Item => "------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Initialiser (Structure => E);
   Iterer      (Structure => E);

   E (2) := 777;
   --  On peux utiliser l'assignation simplifié
   --  au lieu de E.Modifier (Position => 2, Valeur => 777);

   Iterer (Structure => E);

   Ada.Text_IO.New_Line (Spacing => 2);

exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
