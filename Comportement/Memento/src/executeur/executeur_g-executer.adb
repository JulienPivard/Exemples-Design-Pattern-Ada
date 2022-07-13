with Utilisateur_P;
with Utilisateur_P.Memento_P;

with Mem_P.Memento_P.Utilisateur_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   ---------------------------------------------------------------------------
   procedure Afficher
      (Utilisateur : in     Utilisateur_P.Utilisateur_T);
   --  Affiche le contenu de l'utilisateur.
   --  @param Utilisateur
   --  L'utilisateur à afficher.

   ------------------
   procedure Afficher
      (Utilisateur : in     Utilisateur_P.Utilisateur_T)
   is
      V : Utilisateur_P.Valeur_T;
   begin
      V := Utilisateur.Lire_Valeur;
      Ada.Text_IO.Put_Line (Item => "Valeur : " & V'Image);
   end Afficher;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Afficher
      (Utilisateur : in     Mem_P.Memento_P.Utilisateur_P.Utilisateur_T);
   --  Affiche le contenu de l'utilisateur.
   --  @param Utilisateur
   --  L'utilisateur à afficher.

   ------------------
   procedure Afficher
      (Utilisateur : in     Mem_P.Memento_P.Utilisateur_P.Utilisateur_T)
   is
      V : Mem_P.Valeur_T;
   begin
      V := Utilisateur.Lire_Valeur;
      Ada.Text_IO.Put_Line (Item => "Valeur : " & V'Image);
   end Afficher;
   ---------------------------------------------------------------------------
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern mémento.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Memento_Dans_Utilisateur :
   declare
      U   : Utilisateur_P.Utilisateur_T;
      M_1 : Utilisateur_P.Memento_P.Memento_T;
      M_2 : Utilisateur_P.Memento_P.Memento_T;
   begin
      Ada.Text_IO.Put_Line (Item => "Sauvegarde l'utilisateur dans M1");
      U.Modifier (Valeur => 5);
      M_1 := U.Memoriser;
      Afficher (Utilisateur => U);

      Ada.Text_IO.Put_Line (Item => "Sauvegarde l'utilisateur dans M2");
      U.Modifier (Valeur => 50);
      M_2 := U.Memoriser;
      Afficher (Utilisateur => U);

      Ada.Text_IO.New_Line (Spacing => 1);

      Ada.Text_IO.Put_Line (Item => "Rétablit l'utilisateur depuis M1");
      U.Retablir (Memento => M_1);
      Afficher (Utilisateur => U);

      Ada.Text_IO.Put_Line (Item => "Rétablit l'utilisateur depuis M2");
      U.Retablir (Memento => M_2);
      Afficher (Utilisateur => U);
   end Bloc_Memento_Dans_Utilisateur;

   Ada.Text_IO.New_Line (Spacing => 2);

   Bloc_Utilisateur_Dans_Memento :
   declare
      U   : Mem_P.Memento_P.Utilisateur_P.Utilisateur_T;
      M_1 : Mem_P.Memento_P.Memento_T;
      M_2 : Mem_P.Memento_P.Memento_T;
   begin
      Ada.Text_IO.Put_Line (Item => "Sauvegarde l'utilisateur dans M1");
      U.Modifier (Valeur => 5);
      M_1 := U.Memoriser;
      Afficher (Utilisateur => U);

      Ada.Text_IO.Put_Line (Item => "Sauvegarde l'utilisateur dans M2");
      U.Modifier (Valeur => 50);
      M_2 := U.Memoriser;
      Afficher (Utilisateur => U);

      Ada.Text_IO.New_Line (Spacing => 1);

      Ada.Text_IO.Put_Line (Item => "Rétablit l'utilisateur depuis M1");
      U.Retablir (Memento => M_1);
      Afficher (Utilisateur => U);

      Ada.Text_IO.Put_Line (Item => "Rétablit l'utilisateur depuis M2");
      U.Retablir (Memento => M_2);
      Afficher (Utilisateur => U);
   end Bloc_Utilisateur_Dans_Memento;
end Executer;
