with Contexte_P;
with Gestionnaire_P.Concret_1_P;
with Gestionnaire_P.Concret_2_P;
with Gestionnaire_P.Concret_3_P;
with Gestionnaire_P.Concret_4_P;
with Gestionnaire_P.Concret_5_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   G_1 : Gestionnaire_P.Concret_1_P.Maillon_T :=
      Gestionnaire_P.Concret_1_P.Creer;
   G_2 : Gestionnaire_P.Concret_2_P.Maillon_T :=
      Gestionnaire_P.Concret_2_P.Creer;
   G_3 : Gestionnaire_P.Concret_3_P.Maillon_T :=
      Gestionnaire_P.Concret_3_P.Creer;
   G_4 : Gestionnaire_P.Concret_4_P.Maillon_T :=
      Gestionnaire_P.Concret_4_P.Creer;
   G_5 : Gestionnaire_P.Concret_5_P.Maillon_T :=
      Gestionnaire_P.Concret_5_P.Creer;

   Trouve : Boolean;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line
      (Item => "Démonstration du design pattern chaine de responsabilités.");
   Ada.Text_IO.Put_Line (Item => "On utilise une variante de la chaine de");
   Ada.Text_IO.Put_Line (Item => "responsabilité. Le parcours ne s'arrête");
   Ada.Text_IO.Put_Line (Item => "pas quand un maillon correspondant est");
   Ada.Text_IO.Put_Line (Item => "trouvé, mais on va tous les parcourir.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   G_1.Ajouter (Successeur => G_2);
   G_1.Ajouter (Successeur => G_3);
   G_1.Ajouter (Successeur => G_4);
   G_1.Ajouter (Successeur => G_5);

   Ada.Text_IO.Put_Line (Item => "Version sans retour de réussite");
   for Action in Contexte_P.Action_T loop
      Ada.Text_IO.Put
         (Item => "======================================================== ");
      Ada.Text_IO.Put
         (Item => "Action sur chaine recherchée [" & Action'Image & "]");
      Ada.Text_IO.New_Line (Spacing => 1);
      G_1.Gerer_Requete (Contexte => Action);
      Ada.Text_IO.New_Line (Spacing => 1);
   end loop;

   Ada.Text_IO.Put_Line (Item => "Version avec un retour de réussite");
   for Action in Contexte_P.Action_T loop
      Ada.Text_IO.Put
         (Item => "======================================================== ");
      Ada.Text_IO.Put
         (Item => "Action sur chaine recherchée [" & Action'Image & "]");
      Ada.Text_IO.New_Line (Spacing => 1);
      Trouve := G_1.Gerer_Requete (Contexte => Action);
      Ada.Text_IO.Put (Item => "Trouvé : " & Trouve'Image);
      Ada.Text_IO.New_Line (Spacing => 1);
   end loop;

   pragma Unreferenced (G_1);
   pragma Unreferenced (G_2);
   pragma Unreferenced (G_3);
   pragma Unreferenced (G_4);
   pragma Unreferenced (G_5);

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
