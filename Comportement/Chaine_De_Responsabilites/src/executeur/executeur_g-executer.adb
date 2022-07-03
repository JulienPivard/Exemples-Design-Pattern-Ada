with Contexte_P;
with Gestionnaire_P.Concret_1_P;
with Gestionnaire_P.Concret_2_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   C : Contexte_P.Action_T := Contexte_P.Action_1;

   G_1 : Gestionnaire_P.Concret_1_P.Gestionnaire_Concret_T :=
      Gestionnaire_P.Concret_1_P.Creer (Action => Contexte_P.Action_3);
   G_2 : Gestionnaire_P.Concret_2_P.Gestionnaire_Concret_T :=
      Gestionnaire_P.Concret_2_P.Creer (Action => Contexte_P.Action_1);
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

   G_1.Gerer_Requete (Contexte => C);
   Ada.Text_IO.New_Line (Spacing => 1);
   G_2.Gerer_Requete (Contexte => C);
   Ada.Text_IO.New_Line (Spacing => 1);

   G_1.Ajouter_Successeur (Successeur => G_2);
   C := Contexte_P.Action_3;

   G_1.Gerer_Requete (Contexte => C);
   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Ajout_1 :
   declare
      G_X : Gestionnaire_P.Concret_1_P.Gestionnaire_Concret_T;
   begin
      G_X := Gestionnaire_P.Concret_1_P.Creer (Action => Contexte_P.Action_2);
      G_1.Ajouter_Successeur (Successeur => G_X);
      G_X := Gestionnaire_P.Concret_1_P.Creer (Action => Contexte_P.Action_5);
      G_1.Ajouter_Successeur (Successeur => G_X);
      G_X := Gestionnaire_P.Concret_1_P.Creer (Action => Contexte_P.Action_4);
      G_1.Ajouter_Successeur (Successeur => G_X);
   end Bloc_Ajout_1;

   Bloc_Ajout_2 :
   declare
      G_X : Gestionnaire_P.Concret_2_P.Gestionnaire_Concret_T;
   begin
      for I in Contexte_P.Action_T loop
         G_X := Gestionnaire_P.Concret_2_P.Creer (Action => I);
         G_1.Ajouter_Successeur (Successeur => G_X);
      end loop;
   end Bloc_Ajout_2;

   C := Contexte_P.Action_4;

   G_1.Gerer_Requete (Contexte => C);
   Ada.Text_IO.New_Line (Spacing => 1);

   pragma Unreferenced (G_1);
   pragma Unreferenced (G_2);
end Executer;
