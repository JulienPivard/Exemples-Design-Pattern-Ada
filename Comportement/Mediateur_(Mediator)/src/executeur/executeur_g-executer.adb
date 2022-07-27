with Utilisateur_P.Collegue_Accee_P;
with Mediateur_P.Concret_Accee_P;

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
      M.Inscrire (Utilisateur => U_1'Unchecked_Access);
      M.Inscrire (Utilisateur => U_2'Unchecked_Access);

      U_1.Envoyer (Message => "Wesh Cassandre !    ");
      U_2.Envoyer (Message => "Yo Morgane          ");
   end Bloc_Demo_Avec_Access;

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
