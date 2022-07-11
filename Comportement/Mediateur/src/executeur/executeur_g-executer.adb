with Utilisateur_P.Collegue_P;
with Mediateur_P.Concret_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   U_1 : aliased Utilisateur_P.Collegue_P.Utilisateur_Collegue_T :=
      Utilisateur_P.Collegue_P.Creer (Nom => "Roger               ");
   U_2 : aliased Utilisateur_P.Collegue_P.Utilisateur_Collegue_T :=
      Utilisateur_P.Collegue_P.Creer (Nom => "Mouloud             ");

   M : aliased Mediateur_P.Concret_P.Concret_T;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line
      (Item => "Démonstration du design pattern médiateur.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   M.Inscrire (Utilisateur => U_1'Unchecked_Access);
   M.Inscrire (Utilisateur => U_2'Unchecked_Access);

   U_1.Envoyer (Message => "Wesh Mouloud !      ");
   U_2.Envoyer (Message => "Yo Roger            ");
end Executer;
