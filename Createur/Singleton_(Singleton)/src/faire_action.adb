with Ada.Text_IO;

procedure Faire_Action
   (
      S1 : in out Singleton_P.Singleton_Interface_T'Class;
      S2 : in out Singleton_P.Singleton_Interface_T'Class
   )
is
begin
   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "====  Après modification de S1  ====");
   Ada.Text_IO.New_Line (Spacing => 1);

   S1.Changer_Nom (Nom => "Roulecoule");

   Ada.Text_IO.Put (Item => "S1 : ");
   S1.Afficher;
   Ada.Text_IO.Put (Item => "S2 : ");
   S2.Afficher;

   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "====  Après modification de S2  ====");
   Ada.Text_IO.New_Line (Spacing => 1);

   S2.Changer_Nom (Nom => "T'inquiète mec !");

   Ada.Text_IO.Put (Item => "S1 : ");
   S1.Afficher;
   Ada.Text_IO.Put (Item => "S2 : ");
   S2.Afficher;
end Faire_Action;
