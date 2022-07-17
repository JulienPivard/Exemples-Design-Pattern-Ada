with Patron_De_Methode_P.Concret_1_P;
with Patron_De_Methode_P.Concret_2_P;
with Patron_De_Methode_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   ---------------------------------------------------------------------------
   procedure Faire
      (Patron : in out Patron_De_Methode_P.Patron_De_Methode_T'Class);

   ---------------
   procedure Faire
      (Patron : in out Patron_De_Methode_P.Patron_De_Methode_T'Class)
   is
   begin
      Patron.Methode_Patron;
   end Faire;
   ---------------------------------------------------------------------------

   C_1 : Patron_De_Methode_P.Concret_1_P.Concret_T;
   C_2 : Patron_De_Methode_P.Concret_2_P.Concret_T;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line
      (Item => "Démonstration du design pattern patron de méthode.");
   Ada.Text_IO.Put_Line (Item => "La classe mère possède deux méthodes");
   Ada.Text_IO.Put_Line (Item => "abstraites et une méthode patron.");
   Ada.Text_IO.Put_Line (Item => "Deux classes filles vont les implémenter.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Faire (Patron => C_1);
   Ada.Text_IO.New_Line (Spacing => 2);
   Faire (Patron => C_2);

   pragma Unreferenced (C_1);
   pragma Unreferenced (C_2);

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
