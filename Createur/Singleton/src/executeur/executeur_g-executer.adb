with Ada.Text_IO;

with Singleton_P;
with Ada.Strings.Unbounded;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is

   S1 : constant Singleton_P.Singleton_A :=
      Singleton_P.Recuperer_Singleton;
   S2 : constant Singleton_P.Singleton_A :=
      Singleton_P.Recuperer_Singleton;

begin

   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "====  Après modification de S1  ====");
   Ada.Text_IO.New_Line (Spacing => 1);

   S1.all.Changer_Nom
      (Nom => Ada.Strings.Unbounded.To_Unbounded_String
         (Source => "Roulecouele"));
   Ada.Text_IO.Put (Item => "S1 : ");
   S1.all.Afficher;
   Ada.Text_IO.Put (Item => "S2 : ");
   S2.all.Afficher;

   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "====  Après modification de S2  ====");
   Ada.Text_IO.New_Line (Spacing => 1);

   S2.all.Changer_Nom
      (Nom => Ada.Strings.Unbounded.To_Unbounded_String
         (Source => "Hey poivros"));
   Ada.Text_IO.Put (Item => "S1 : ");
   S1.all.Afficher;
   Ada.Text_IO.Put (Item => "S2 : ");
   S2.all.Afficher;

end Executer;
