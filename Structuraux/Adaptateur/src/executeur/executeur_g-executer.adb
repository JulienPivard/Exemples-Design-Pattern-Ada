--  with GNAT.Source_Info;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
begin
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern adaptateur");
   Ada.Text_IO.New_Line (Spacing => 1);

end Executer;
