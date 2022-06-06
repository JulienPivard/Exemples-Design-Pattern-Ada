with Adaptateur_De_Classe_P;
with Classe_Utilisee_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   ---------------------------------------------------------------------------
   procedure Execute
      (Executrice : in out Classe_Utilisee_P.Classe_Utilisee_T'Class);

   -----------------
   procedure Execute
      (Executrice : in out Classe_Utilisee_P.Classe_Utilisee_T'Class)
   is
   begin
      Executrice.Faire;
   end Execute;
   ---------------------------------------------------------------------------

   A : Adaptateur_De_Classe_P.Adaptateur_T;
begin
   Ada.Text_IO.Put_Line
      (Item => "Démonstration du design pattern adaptateur.");
   Ada.Text_IO.Put_Line (Item => "Une version adaptateur de classe, et");
   Ada.Text_IO.Put_Line (Item => "une version adaptateur d'objet.");
   Ada.Text_IO.New_Line (Spacing => 1);

   Execute (Executrice => A);

   pragma Unreferenced (A);
end Executer;
