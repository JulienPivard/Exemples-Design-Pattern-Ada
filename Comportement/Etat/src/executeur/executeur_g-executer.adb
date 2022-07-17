with Utilisateur_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   U : Utilisateur_P.Utilisateur_T := Utilisateur_P.Creer;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern état.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   U.Presse_E;
   U.Presse_I;
   U.Presse_I;
   U.Presse_E;
   U.Presse_Esc;
   U.Presse_E;

   pragma Unreferenced (U);
end Executer;
