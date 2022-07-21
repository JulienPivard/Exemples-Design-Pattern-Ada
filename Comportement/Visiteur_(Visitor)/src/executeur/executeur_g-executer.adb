with Ada.Text_IO;

with Uml_P;
with Visiteur_P.Code_Generateur_P;
with Visiteur_P.Instrumentation_P;
with Visiteur_P.Verificateur_P;
with Visiteur_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   ---------------------------------------------------------------------------
   procedure Execution
      (Visiteur : in out Visiteur_P.Visiteur_T'Class);

   ------------------
   procedure Execution
      (Visiteur : in out Visiteur_P.Visiteur_T'Class)
   is
      Var   : Uml_P.Element_Nomme_T;    --  Un visité
      Class : Uml_P.Code_Class_T;       --  Un visité
      Pack  : Uml_P.Verif_Package_T;    --  Un visité
      Ope   : Uml_P.Operation_T;        --  Un visité
   begin
      Pack.Visiter (Le_Visiteur => Visiteur);

      Class.Visiter (Le_Visiteur => Visiteur);
      Var.Visiter (Le_Visiteur => Visiteur);
      Class.Visiter (Le_Visiteur => Visiteur);
      Var.Visiter (Le_Visiteur => Visiteur);
      Class.Visiter (Le_Visiteur => Visiteur);
      Var.Visiter (Le_Visiteur => Visiteur);

      Var.Visiter (Le_Visiteur => Visiteur);
      Ope.Visiter (Le_Visiteur => Visiteur);
      Var.Visiter (Le_Visiteur => Visiteur);

      Var.Visiter (Le_Visiteur => Visiteur);
      Ope.Visiter (Le_Visiteur => Visiteur);
      Var.Visiter (Le_Visiteur => Visiteur);

      Pack.Visiter (Le_Visiteur => Visiteur);

      Pack.Visiter (Le_Visiteur => Visiteur);

      Class.Visiter (Le_Visiteur => Visiteur);
      Var.Visiter (Le_Visiteur => Visiteur);
      Var.Visiter (Le_Visiteur => Visiteur);

      Var.Visiter (Le_Visiteur => Visiteur);
      Ope.Visiter (Le_Visiteur => Visiteur);
      Var.Visiter (Le_Visiteur => Visiteur);

      Pack.Visiter (Le_Visiteur => Visiteur);

      pragma Unreferenced (Var);
      pragma Unreferenced (Class);
      pragma Unreferenced (Pack);
      pragma Unreferenced (Ope);
   end Execution;
   ---------------------------------------------------------------------------

   Gen  : Visiteur_P.Code_Generateur_P.Code_Generateur_T;  --  Un visiteur
   Ver  : Visiteur_P.Verificateur_P.Verificateur_T;        --  Un visiteur
   Inst : Visiteur_P.Instrumentation_P.Instrumentation_T;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern visiteur");
   Ada.Text_IO.Put_Line (Item => "sur une hiérarchie d'objets.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Execution (Visiteur => Gen);
   Ada.Text_IO.New_Line (Spacing => 1);
   Execution (Visiteur => Ver);
   Ada.Text_IO.New_Line (Spacing => 1);
   Execution (Visiteur => Inst);

   Inst.Afficher;

   pragma Unreferenced (Gen);
   pragma Unreferenced (Ver);
   pragma Unreferenced (Inst);

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
