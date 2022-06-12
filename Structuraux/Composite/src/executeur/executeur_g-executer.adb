with Composant_P.Composite_P;
with Valeur_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   use type Valeur_P.Valeur_T;

   C : Composant_P.Composite_P.Composite_T;
begin
   C.Ajouter (Valeur => 5);
   C.Ajouter (Valeur => -20);

   C.Ajouter (Valeur => 9);
   C.Ajouter (Valeur => 33);

   C.Faire;
   Ada.Text_IO.New_Line (Spacing => 1);

   C.Ajouter (Valeur => -13);
   C.Ajouter (Valeur => -1);

   C.Ajouter (Valeur => -99);
   C.Ajouter (Valeur => 27);

   C.Faire;
end Executer;
