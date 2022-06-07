with Abstraction_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   A : Abstraction_P.Abstraction_T;
begin
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern pont.");
   Ada.Text_IO.New_Line (Spacing => 1);

   A.Initialiser (Sorte => 1);
   A.Operation;

   A.Initialiser (Sorte => 2);
   A.Operation;

   pragma Unreferenced (A);
end Executer;
