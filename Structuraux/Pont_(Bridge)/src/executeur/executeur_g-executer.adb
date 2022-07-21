with Abstraction_P;
with Abstraction_P.Fenetre_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   A : Abstraction_P.Abstraction_T;
   F : Abstraction_P.Fenetre_P.Fenetre_T;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern pont.");
   Ada.Text_IO.Put_Line (Item => "Une abstraction avec deux impl différentes");
   Ada.Text_IO.Put_Line (Item => "et une spécialisation de l'abstraction.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line (Item => "Pont Operation 1 sur abstraction");
   A.Initialiser (Sorte => 1);
   A.Operation;
   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line (Item => "Pont Operation 2 sur abstraction");
   A.Initialiser (Sorte => 2);
   A.Operation;
   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line (Item => "Pont Operation 1 sur fenêtre");
   F.Initialiser (Sorte => 1);
   F.Operation;
   F.Faire_Fenetre;

   pragma Unreferenced (A);
   pragma Unreferenced (F);

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
