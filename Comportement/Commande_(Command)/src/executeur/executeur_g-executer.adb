with Commande_P;
with Commande_P.Concrete_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   ---------------------------------------------------------------------------
   procedure Tester
      (Commande : in out Commande_P.Commande_T'Class);

   ----------------
   procedure Tester
      (Commande : in out Commande_P.Commande_T'Class)
   is
   begin
      Commande.Execute;
   end Tester;
   ---------------------------------------------------------------------------

   C : Commande_P.Concrete_P.Commande_Concrete_T;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern commande.");
   Ada.Text_IO.Put_Line (Item => "Très similaire à l'idée de callback dans");
   Ada.Text_IO.Put_Line (Item => "les interfaces graphiques.");
   Ada.Text_IO.Put_Line (Item => "On entoure la commande à exécuter pour");
   Ada.Text_IO.Put_Line (Item => "disposer d'une interface générique, mais");
   Ada.Text_IO.Put_Line (Item => "qui permet de faire ce que l'on veux");
   Ada.Text_IO.Put_Line (Item => "derrière.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Tester (Commande => C);

   pragma Unreferenced (C);

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
