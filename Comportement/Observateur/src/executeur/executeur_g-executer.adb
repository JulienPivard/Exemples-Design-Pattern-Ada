with Observateur_Chiffre_P;
with Observateur_Graphe_P;
with Valeurs_P.Concret_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   G : constant Observateur_Graphe_P.Graphe_T   := Observateur_Graphe_P.Creer;
   C : constant Observateur_Chiffre_P.Chiffre_T := Observateur_Chiffre_P.Creer;
   V : Valeurs_P.Concret_P.Sujet_T;

   T : Valeurs_P.Table_Valeurs_T;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line
      (Item => "Démonstration du design pattern observateur.");
   Ada.Text_IO.Put_Line (Item => "Observateur sans pointeur, mais qui");
   Ada.Text_IO.Put_Line (Item => "nécessite de passer par un singleton,");
   Ada.Text_IO.Put_Line (Item => "dans les coulisses, pour faire référence");
   Ada.Text_IO.Put_Line (Item => "à un même objet si il y a besoin.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   V.Attache (Observateur => C);
   V.Attache (Observateur => G);

   T := Valeurs_P.Table_Valeurs_T'(1 => 4, 2 => 32, 3 => 9, 4 => 55, 5 => 0);
   V.Modifier (Vals => T);

   T := Valeurs_P.Table_Valeurs_T'(1 => 32, 2 => 0, 3 => 55, 4 => 4, 5 => 9);
   V.Modifier (Vals => T);

   T := Valeurs_P.Table_Valeurs_T'(1 => 9, 2 => 36, 3 => 4, 4 => 19, 5 => 32);
   V.Modifier (Vals => T);

   pragma Unreferenced (V);
end Executer;
