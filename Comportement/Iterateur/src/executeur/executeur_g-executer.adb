with Data_P;
with Structure_P;
with Structure_P.Enfant_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
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
      for E of Structure loop
         Valeur := 2 * Valeur;
         E := Valeur;
      end loop Boucle_Remplissage;

      Ada.Text_IO.Put_Line (Item => "Affichage pour vérifier.");
      Boucle_Verification :
      for I in Structure_P.Indice_T loop
         Valeur := Structure.Lire_Element (Position => I);
         Ada.Text_IO.Put_Line (Item => Data_P.Element_T'Image (Valeur));
      end loop Boucle_Verification;

      Ada.Text_IO.New_Line (Spacing => 2);
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
      for E of Structure loop
         Ada.Text_IO.Put_Line (Item => Data_P.Element_T'Image (E));
      end loop Boucle_Affichage_En_Avant;
      Ada.Text_IO.New_Line (Spacing => 1);

      Ada.Text_IO.Put_Line (Item => "Affichage contenu en ordre inverse");
      Boucle_Affichage_En_Arriere :
      for E of reverse Structure loop
         Ada.Text_IO.Put_Line (Item => Data_P.Element_T'Image (E));
      end loop Boucle_Affichage_En_Arriere;
      Ada.Text_IO.New_Line (Spacing => 1);
   end Iterer;
   ---------------------------------------------------------------------------

   S : Structure_P.Structure_T;
   E : Structure_P.Enfant_P.Enfant_T;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern itérateur.");
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
end Executer;
