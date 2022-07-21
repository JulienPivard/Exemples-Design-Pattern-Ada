with Sujet_P;
with Sujet_P.Procuration_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   ---------------------------------------------------------------------------
   procedure Utiliser
      (S : in out Sujet_P.Sujet_T'Class);

   ------------------
   procedure Utiliser
      (S : in out Sujet_P.Sujet_T'Class)
   is
   begin
      S.Operation;
      Ada.Text_IO.New_Line (Spacing => 1);
   end Utiliser;
   ---------------------------------------------------------------------------

   P : Sujet_P.Procuration_P.Procuration_T;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line
      (Item => "Démonstration du design pattern procuration.");
   Ada.Text_IO.Put_Line (Item => "Utilisé pour cacher un décalage");
   Ada.Text_IO.Put_Line (Item => "d'instanciation, un compteur de référence,");
   Ada.Text_IO.Put_Line (Item => "un accès réseau.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Utiliser (S => P);

   Utiliser (S => P);

   pragma Unreferenced (P);

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
