------------------------------------------------------------------------------
--                                                                          --
--                          Auteur : PIVARD Julien                          --
--           Dernière modification : Lundi 29 septembre[09] 2025
--                                                                          --
------------------------------------------------------------------------------
with Ada.Command_Line;
with Ada.Exceptions;
with Ada.Text_IO;

with GNAT.Source_Info;

with Version_Compilateur_P;

with Uml_P;
with Visiteur_P.Code_Generateur_P;
with Visiteur_P.Instrumentation_P;
with Visiteur_P.Verificateur_P;
with Visiteur_P;

procedure Client is
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
   Ada.Command_Line.Set_Exit_Status
      (Code => Ada.Command_Line.Success);

   Ada.Text_IO.Put      (Item => "+---------------------+");
   Ada.Text_IO.Put_Line (Item => " - - - - - - - - - - - ");
   Ada.Text_IO.Put      (Item => "| Date de compilation :");
   Ada.Text_IO.Put      (Item => "  ");
   Ada.Text_IO.Put      (Item => GNAT.Source_Info.Compilation_ISO_Date);
   Ada.Text_IO.Put      (Item => " ");
   Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Compilation_Time);
   Ada.Text_IO.Put      (Item => "+---------------------+");
   Ada.Text_IO.Put_Line (Item => " - - - - - - - - - - - ");

   Ada.Text_IO.Put      (Item => "Version du compilateur : ");
   Ada.Text_IO.Put_Line (Item => "[" & Version_Compilateur_P.Version & "]");

   Ada.Text_IO.New_Line (Spacing => 1);

   --  Ada.Text_IO.Put      (Item => "Procédure : [");
   --  Ada.Text_IO.Put      (Item => GNAT.Source_Info.Enclosing_Entity);
   --  Ada.Text_IO.Put      (Item => "], une instance de : ");
   --  Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Source_Location);

   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern visiteur");
   Ada.Text_IO.Put_Line (Item => "sur une hiérarchie d'objets.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line (Item => "======  Visiteur générateur ======");
   Execution (Visiteur => Gen);
   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "======  Visiteur vérification ======");
   Execution (Visiteur => Ver);
   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "======  Visiteur instrumentation ======");
   Execution (Visiteur => Inst);

   Inst.Afficher;

   pragma Unreferenced (Gen);
   pragma Unreferenced (Ver);
   pragma Unreferenced (Inst);

   Ada.Text_IO.New_Line (Spacing => 2);

exception
   when E : others =>
      Ada.Text_IO.Put_Line
         (Item => Ada.Exceptions.Exception_Information (X => E));
      Ada.Command_Line.Set_Exit_Status
         (Code => Ada.Command_Line.Failure);
end Client;
