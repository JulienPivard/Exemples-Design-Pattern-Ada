with Lettre_P;
with Utilisateur_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   U : Utilisateur_P.Utilisateur_T := Utilisateur_P.Creer;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern état.");
   Ada.Text_IO.Put_Line (Item => "Objet avec un état interne qui change en");
   Ada.Text_IO.Put_Line (Item => "fonction des actions effectué.");
   Ada.Text_IO.Put_Line (Item => "Les transitions sont géré par");
   Ada.Text_IO.Put_Line (Item => "un objet Transition et un tableau");
   Ada.Text_IO.Put_Line (Item => "de correspondances.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   U.Presser (Lettre => Lettre_P.Lettre_E);
   U.Presser (Lettre => Lettre_P.Lettre_Esc);
   U.Presser (Lettre => Lettre_P.Lettre_I);
   U.Presser (Lettre => Lettre_P.Lettre_I);
   U.Presser (Lettre => Lettre_P.Lettre_V);
   U.Presser (Lettre => Lettre_P.Lettre_R);
   U.Presser (Lettre => Lettre_P.Lettre_E);
   U.Presser (Lettre => Lettre_P.Lettre_Esc);
   U.Presser (Lettre => Lettre_P.Lettre_E);
   U.Presser (Lettre => Lettre_P.Lettre_Esc);
   U.Presser (Lettre => Lettre_P.Lettre_V);
   U.Presser (Lettre => Lettre_P.Lettre_I);
   U.Presser (Lettre => Lettre_P.Lettre_V);
   U.Presser (Lettre => Lettre_P.Lettre_R);
   U.Presser (Lettre => Lettre_P.Lettre_E);
   U.Presser (Lettre => Lettre_P.Lettre_Esc);
   U.Presser (Lettre => Lettre_P.Lettre_R);
   U.Presser (Lettre => Lettre_P.Lettre_E);
   U.Presser (Lettre => Lettre_P.Lettre_I);
   U.Presser (Lettre => Lettre_P.Lettre_V);
   U.Presser (Lettre => Lettre_P.Lettre_E);
   U.Presser (Lettre => Lettre_P.Lettre_Esc);
   U.Presser (Lettre => Lettre_P.Lettre_E);

   pragma Unreferenced (U);

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
