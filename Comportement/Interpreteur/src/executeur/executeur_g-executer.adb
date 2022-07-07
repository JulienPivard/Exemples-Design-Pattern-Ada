with Ada.Strings.Fixed;

with Data_P;
with Valeur_P;

with Valeur_P.Constante_P;
with Valeur_P.Operateur_P.Addition_P;
with Valeur_P.Operateur_P.Soustraction_P;
with Valeur_P.Operateur_P.Multiplier_P;
with Valeur_P.Operateur_P.Diviser_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
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
end Executer;
