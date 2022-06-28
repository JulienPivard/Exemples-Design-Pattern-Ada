with Facade_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   F : Facade_P.Facade_T;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern façade.");
   Ada.Text_IO.Put_Line (Item => "Le but est de cacher la complexité");
   Ada.Text_IO.Put_Line (Item => "d'utilisation d'objets spécialisé.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   F.Executer;
end Executer;
