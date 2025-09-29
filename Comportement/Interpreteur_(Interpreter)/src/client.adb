------------------------------------------------------------------------------
--                                                                          --
--                          Auteur : PIVARD Julien                          --
--           Dernière modification : Lundi 29 septembre[09] 2025
--                                                                          --
------------------------------------------------------------------------------
with Ada.Command_Line;
with Ada.Exceptions;
with Ada.Strings.Fixed;
with Ada.Text_IO;

with GNAT.Source_Info;

with Version_Compilateur_P;

with Data_P;
with Valeur_P;

with Valeur_P.Constante_P;
with Valeur_P.Operateur_P.Addition_P;
with Valeur_P.Operateur_P.Soustraction_P;
with Valeur_P.Operateur_P.Multiplier_P;
with Valeur_P.Operateur_P.Diviser_P;

procedure Client is
   ---------------------------------------------------------------------------
   procedure Interpreter
      (Valeur : in     Valeur_P.Valeur_Abstraite_T'Class);

   ---------------------
   procedure Interpreter
      (Valeur : in     Valeur_P.Valeur_Abstraite_T'Class)
   is
      Resultat : constant Data_P.Valeur_T := Valeur.Interprete;
   begin
      Ada.Text_IO.Put_Line
         (
            Item => Valeur.Image & " : " &
            Ada.Strings.Fixed.Trim
               (
                  Source => Data_P.Valeur_T'Image (Resultat),
                  Side   => Ada.Strings.Both
               )
         );
   end Interpreter;
   ---------------------------------------------------------------------------

   C_1 : constant Valeur_P.Constante_P.Constante_T :=
      Valeur_P.Constante_P.Creer (Valeur => 7);
   C_2 : constant Valeur_P.Constante_P.Constante_T :=
      Valeur_P.Constante_P.Creer (Valeur => 7);

   Add  : constant Valeur_P.Operateur_P.Addition_P.Addition_T :=
      Valeur_P.Operateur_P.Addition_P.Creer (Gauche => C_1, Droite => C_2);
   Sous : constant Valeur_P.Operateur_P.Soustraction_P.Soustraction_T :=
      Valeur_P.Operateur_P.Soustraction_P.Creer (Gauche => C_1, Droite => C_2);
   Mult : constant Valeur_P.Operateur_P.Multiplier_P.Multiplier_T :=
      Valeur_P.Operateur_P.Multiplier_P.Creer (Gauche => C_1, Droite => C_2);
   Div  : constant Valeur_P.Operateur_P.Diviser_P.Diviser_T :=
      Valeur_P.Operateur_P.Diviser_P.Creer (Gauche => C_1, Droite => C_2);

   Combi_3 : constant Valeur_P.Operateur_P.Multiplier_P.Multiplier_T :=
      Valeur_P.Operateur_P.Multiplier_P.Creer (Gauche => C_1, Droite => C_2);
   Combi_1 : constant Valeur_P.Operateur_P.Addition_P.Addition_T :=
      Valeur_P.Operateur_P.Addition_P.Creer (Gauche => C_1, Droite => C_2);
   Combi_2 : constant Valeur_P.Operateur_P.Soustraction_P.Soustraction_T :=
      Valeur_P.Operateur_P.Soustraction_P.Creer
         (
            Gauche => Combi_3,
            Droite => Combi_1
         );
   Combi_4 : constant Valeur_P.Operateur_P.Diviser_P.Diviser_T :=
      Valeur_P.Operateur_P.Diviser_P.Creer (Gauche => Combi_2, Droite => C_2);
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
      (Item => "Démonstration du design pattern interpréteur.");
   Ada.Text_IO.Put_Line (Item => "Exécution d'un calcul sur des entiers en");
   Ada.Text_IO.Put_Line (Item => "Utilisant le pattern Interpréteur. Exemple");
   Ada.Text_IO.Put_Line (Item => "tiré d'un système expert 0+ qui passe une");
   Ada.Text_IO.Put_Line (Item => "Base de Faits en parametre à la méthode");
   Ada.Text_IO.Put_Line (Item => "Interprete");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Interpreter (Valeur => C_1);

   Ada.Text_IO.New_Line (Spacing => 1);

   Interpreter (Valeur => Add);
   Interpreter (Valeur => Sous);
   Interpreter (Valeur => Mult);
   Interpreter (Valeur => Div);

   Ada.Text_IO.New_Line (Spacing => 1);

   Interpreter (Valeur => Combi_4);

   Ada.Text_IO.New_Line (Spacing => 2);

exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
