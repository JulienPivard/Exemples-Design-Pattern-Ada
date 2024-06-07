with Utilisateur_P.Collegue_Accee_P;
with Mediateur_P.Concret_Accee_P;

with Mediateur_P.Concret_P;

with Mediateur_P.Singleton_P;
with Utilisateur_Collegue_1_P;
with Utilisateur_Collegue_2_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line
      (Item => "Démonstration du design pattern médiateur.");
   Ada.Text_IO.Put_Line (Item => "Le but du médiateur est de permettre à");
   Ada.Text_IO.Put_Line (Item => "plusieurs classes de travailler ensembles");
   Ada.Text_IO.Put_Line (Item => "sans se connaitre ni s'appeler directement");
   Ada.Text_IO.Put_Line (Item => "mais vont passer par le médiateur.");
   Ada.Text_IO.Put_Line (Item => "Le but est de simplifier les relations");
   Ada.Text_IO.Put_Line (Item => "inter-classes.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Demo_Avec_Access :
   declare
      U_1 : aliased Utilisateur_P.Collegue_Accee_P.Utilisateur_Collegue_T :=
         Utilisateur_P.Collegue_Accee_P.Creer (Nom => "Morgane             ");
      U_2 : aliased Utilisateur_P.Collegue_Accee_P.Utilisateur_Collegue_T :=
         Utilisateur_P.Collegue_Accee_P.Creer (Nom => "Cassandre           ");

      M : aliased Mediateur_P.Concret_Accee_P.Concret_T;
   begin
      Ada.Text_IO.Put_Line (Item => "Version du médiateur avec des pointeurs");
      Ada.Text_IO.Put_Line (Item => "----");
      M.Inscrire (Utilisateur => U_1'Unchecked_Access);
      M.Inscrire (Utilisateur => U_2'Unchecked_Access);

      U_1.Envoyer (Message => "Wesh Cassandre !    ");
      U_2.Envoyer (Message => "Yo Morgane          ");
   end Bloc_Demo_Avec_Access;

   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Demo_Sans_Access :
   declare
      U_1 : Mediateur_P.ID_T;
      U_2 : Mediateur_P.ID_T;

      M : Mediateur_P.Concret_P.Concret_T;
   begin
      Ada.Text_IO.Put_Line (Item => "Version du médiateur sans pointeurs");
      Ada.Text_IO.Put_Line (Item => "----");
      M.Inscrire (Nom => "Morgane             ", ID => U_1);
      M.Inscrire (Nom => "Cassandre           ", ID => U_2);

      M.Envoyer
         (
            Envoyeur     => U_1,
            Destinataire => U_2,
            Message      => "Wesh Cassandre !    "
         );
      M.Envoyer
         (
            Envoyeur     => U_2,
            Destinataire => U_1,
            Message      => "Yo Morgane          "
         );

      pragma Unreferenced (M);
   end Bloc_Demo_Sans_Access;

   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Demo_Singletons :
   declare
      M : Mediateur_P.Singleton_P.Mediateur_Concret_T;

      U_1 : Utilisateur_Collegue_1_P.Utilisateur_Collegue_T :=
         Utilisateur_Collegue_1_P.Creer (Nom => "Morgane             ");
      U_2 : Utilisateur_Collegue_2_P.Utilisateur_Collegue_T :=
         Utilisateur_Collegue_2_P.Creer (Nom => "Cassandre           ");
   begin
      Ada.Text_IO.Put_Line (Item => "Version du médiateur sans pointeurs,");
      Ada.Text_IO.Put_Line (Item => "avec des singletons. Cette version se");
      Ada.Text_IO.Put_Line (Item => "destine à une utilisation concurrente");
      Ada.Text_IO.Put_Line (Item => "----");

      M.Inscrire (Utilisateur => U_1);
      M.Inscrire (Utilisateur => U_2);

      U_1.Envoyer (Message => "Wesh Cassandre !    ");
      U_2.Envoyer (Message => "Yo Morgane          ");

      pragma Unreferenced (M);
      pragma Unreferenced (U_1);
      pragma Unreferenced (U_2);
   end Bloc_Demo_Singletons;

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
