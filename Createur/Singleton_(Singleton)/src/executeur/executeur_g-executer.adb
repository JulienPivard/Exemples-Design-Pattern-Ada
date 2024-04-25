with Ada.Text_IO;

with Faire_Action;

with Singleton_P;
with Singleton_P.Instance_P;
with Singleton_P.Protege_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern singleton");
   Ada.Text_IO.Put_Line (Item => "S1 et S2 sont deux variables différentes ");
   Ada.Text_IO.Put_Line (Item => "mais qui accèdent au même singleton.");
   Ada.Text_IO.Put_Line (Item => "Le second exemple avec Si_1 et Si_2 est");
   Ada.Text_IO.Put_Line (Item => "une version task safe. Les deux");
   Ada.Text_IO.Put_Line (Item => "objets modifie le même singleton.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Singleton_Access :
   declare
      S1 : constant Singleton_P.Accesseur_T :=
         Singleton_P.Instance_P.Recuperer_Singleton;
      S2 : constant Singleton_P.Accesseur_T :=
         Singleton_P.Instance_P.Recuperer_Singleton;
   begin
      Faire_Action
         (
            S1 => S1,
            S2 => S2
         );
   end Bloc_Singleton_Access;

   Ada.Text_IO.New_Line (Spacing => 2);
   Ada.Text_IO.Put_Line (Item => "===============================");
   Ada.Text_IO.Put_Line (Item => "====  Version sans access  ====");
   Ada.Text_IO.Put_Line (Item => "===============================");
   Ada.Text_IO.New_Line (Spacing => 1);

   Bloc_Singleton_Bis :
   declare
      Si_1 : constant Singleton_P.Accesseur_T :=
         Singleton_P.Protege_P.Recuperer_Singleton;
      Si_2 : constant Singleton_P.Accesseur_T :=
         Singleton_P.Protege_P.Recuperer_Singleton;
   begin
      Faire_Action
         (
            S1 => Si_1,
            S2 => Si_2
         );
   end Bloc_Singleton_Bis;

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
