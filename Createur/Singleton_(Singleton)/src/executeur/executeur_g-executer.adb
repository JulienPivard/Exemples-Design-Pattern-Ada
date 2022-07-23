with Ada.Text_IO;

with Singleton_Bis_P;
with Singleton_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern singleton");
   Ada.Text_IO.Put_Line (Item => "S1 et S2 sont deux accès différents ");
   Ada.Text_IO.Put_Line (Item => "au même singleton.");
   Ada.Text_IO.Put_Line (Item => "Le second exemple avec Si_1 et Si_2 est");
   Ada.Text_IO.Put_Line (Item => "une version sans pointeurs. Les deux");
   Ada.Text_IO.Put_Line (Item => "objets modifie le même singleton.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Singleton_Access :
   declare
      S1 : constant Singleton_P.Accesseur_T :=
         Singleton_P.Recuperer_Singleton;
      S2 : constant Singleton_P.Accesseur_T :=
         Singleton_P.Recuperer_Singleton;
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
   end Bloc_Singleton_Access;

   Ada.Text_IO.New_Line (Spacing => 2);
   Ada.Text_IO.Put_Line (Item => "===============================");
   Ada.Text_IO.Put_Line (Item => "====  Version sans access  ====");
   Ada.Text_IO.Put_Line (Item => "===============================");
   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Singleton_Bis :
   declare
      Si_1 : Singleton_Bis_P.Singleton_T :=
         Singleton_Bis_P.Recuperer_Singleton;
      Si_2 : Singleton_Bis_P.Singleton_T :=
         Singleton_Bis_P.Recuperer_Singleton;
   begin
      Ada.Text_IO.New_Line (Spacing => 1);
      Ada.Text_IO.Put_Line (Item => "====  Après modification de Si_1  ====");
      Ada.Text_IO.New_Line (Spacing => 1);

      Si_1.Changer_Nom (Nom => "Roulecoule");

      Ada.Text_IO.Put (Item => "Si_1 : ");
      Si_1.Afficher;
      Ada.Text_IO.Put (Item => "Si_2 : ");
      Si_2.Afficher;

      Ada.Text_IO.New_Line (Spacing => 1);
      Ada.Text_IO.Put_Line (Item => "====  Après modification de Si_2  ====");
      Ada.Text_IO.New_Line (Spacing => 1);

      Si_2.Changer_Nom (Nom => "T'inquiète mec !");

      Ada.Text_IO.Put (Item => "Si_1 : ");
      Si_1.Afficher;
      Ada.Text_IO.Put (Item => "Si_2 : ");
      Si_2.Afficher;
   end Bloc_Singleton_Bis;

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
