with Uml_P;
with Visiteur_P;
with Ada.Text_IO;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   type Code_Generateur_T is new Visiteur_P.Visiteur_T with null record;

   overriding
   procedure Visiter_CClass
      (
         This : in out Code_Generateur_T;
         Obj  : in out Uml_P.CClass_T'Class
      );

   ---------------------------------------------------------------------------
   overriding
   procedure Visiter_CClass
      (
         This : in out Code_Generateur_T;
         Obj  : in out Uml_P.CClass_T'Class
      )
   is
      pragma Unreferenced (This);
      pragma Unreferenced (Obj);
   begin
      Ada.Text_IO.Put_Line ("Classe visitée par code générateur.");
   end Visiter_CClass;
   ---------------------------------------------------------------------------

   type Verificateur_T is new Visiteur_P.Visiteur_T with null record;

   overriding
   procedure Visiter_PPackage
      (
         This : in out Verificateur_T;
         Obj  : in out Uml_P.PPackage_T'Class
      );

   overriding
   procedure Visiter_Operation
      (
         This : in out Verificateur_T;
         Obj  : in out Uml_P.Operation_T'Class
      );

   ---------------------------------------------------------------------------
   overriding
   procedure Visiter_PPackage
      (
         This : in out Verificateur_T;
         Obj  : in out Uml_P.PPackage_T'Class
      )
   is
      pragma Unreferenced (This);
      pragma Unreferenced (Obj);
   begin
      Ada.Text_IO.Put_Line ("Paquet visité par le vérificateur.");
   end Visiter_PPackage;

   ---------------------------------------------------------------------------
   overriding
   procedure Visiter_Operation
      (
         This : in out Verificateur_T;
         Obj  : in out Uml_P.Operation_T'Class
      )
   is
      pragma Unreferenced (This);
      pragma Unreferenced (Obj);
   begin
      Ada.Text_IO.Put_Line ("Opération visité par le vérificateur.");
   end Visiter_Operation;

   ---------------------------------------------------------------------------

   Tmp1 : Uml_P.Element_Nomme_T;    --  Un visité
   Tmp2 : Uml_P.CClass_T;           --  Un visité
   Tmp3 : Uml_P.PPackage_T;         --  Un visité
   Tmp4 : Uml_P.Operation_T;        --  Un visité

   Gen  : Code_Generateur_T;  --  Un visiteur
   Ver  : Verificateur_T;     --  Un visiteur

begin
   Tmp1.Visiter (Gen);  --  Pas d'affichage
   Tmp2.Visiter (Gen);  --  Affichage
   Tmp3.Visiter (Gen);  --  Pas d'affichage
   Tmp4.Visiter (Gen);  --  Pas d'affichage

   Tmp1.Visiter (Ver);  --  Pas d'affichage
   Tmp2.Visiter (Ver);  --  Pas d'affichage
   Tmp3.Visiter (Ver);  --  Affichage
   Tmp4.Visiter (Ver);  --  Affichage
   pragma Unreferenced (Tmp1);
   pragma Unreferenced (Tmp2);
   pragma Unreferenced (Tmp3);
   pragma Unreferenced (Tmp4);
   pragma Unreferenced (Gen);
   pragma Unreferenced (Ver);
end Executer;
