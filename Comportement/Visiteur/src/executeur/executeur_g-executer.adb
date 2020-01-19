with Uml_P;
with Visiteur_P;
with Ada.Text_IO;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   ---------------------------------------------------------------------------
   type Code_Generateur_T is new Visiteur_P.Visiteur_T with null record;
   --  Dscendant d'un visiteur.

   ------------------------
   overriding
   procedure Visiter_Code_Class
      (
         This : in out Code_Generateur_T;
         Obj  : in out Uml_P.Code_Class_T'Class
      );
   --  Permet de visiter.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

   ------------------------
   overriding
   procedure Visiter_Code_Class
      (
         This : in out Code_Generateur_T;
         Obj  : in out Uml_P.Code_Class_T'Class
      )
   is
      pragma Unreferenced (This);
      pragma Unreferenced (Obj);
   begin
      Ada.Text_IO.Put_Line (Item => "Classe visitée par code générateur.");
   end Visiter_Code_Class;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   type Verificateur_T is new Visiteur_P.Visiteur_T with null record;

   --------------------------
   overriding
   procedure Visiter_Verif_Package
      (
         This : in out Verificateur_T;
         Obj  : in out Uml_P.Verif_Package_T'Class
      );
   --  Permet de visiter.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

   --------------------------
   overriding
   procedure Visiter_Operation
      (
         This : in out Verificateur_T;
         Obj  : in out Uml_P.Operation_T'Class
      );
   --  Permet de visiter.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

   --------------------------
   overriding
   procedure Visiter_Verif_Package
      (
         This : in out Verificateur_T;
         Obj  : in out Uml_P.Verif_Package_T'Class
      )
   is
      pragma Unreferenced (This);
      pragma Unreferenced (Obj);
   begin
      Ada.Text_IO.Put_Line (Item => "Paquet visité par le vérificateur.");
   end Visiter_Verif_Package;
   ---------------------------

   ---------------------------
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
      Ada.Text_IO.Put_Line (Item => "Opération visité par le vérificateur.");
   end Visiter_Operation;
   ---------------------------------------------------------------------------

   Tmp1 : Uml_P.Element_Nomme_T;    --  Un visité
   Tmp2 : Uml_P.Code_Class_T;       --  Un visité
   Tmp3 : Uml_P.Verif_Package_T;    --  Un visité
   Tmp4 : Uml_P.Operation_T;        --  Un visité

   Gen  : Code_Generateur_T;  --  Un visiteur
   Ver  : Verificateur_T;     --  Un visiteur

begin
   Tmp1.Visiter (Le_Visiteur => Gen);  --  Pas d'affichage
   Tmp2.Visiter (Le_Visiteur => Gen);  --  Affichage
   Tmp3.Visiter (Le_Visiteur => Gen);  --  Pas d'affichage
   Tmp4.Visiter (Le_Visiteur => Gen);  --  Pas d'affichage

   Tmp1.Visiter (Le_Visiteur => Ver);  --  Pas d'affichage
   Tmp2.Visiter (Le_Visiteur => Ver);  --  Pas d'affichage
   Tmp3.Visiter (Le_Visiteur => Ver);  --  Affichage
   Tmp4.Visiter (Le_Visiteur => Ver);  --  Affichage

   pragma Unreferenced (Tmp1);
   pragma Unreferenced (Tmp2);
   pragma Unreferenced (Tmp3);
   pragma Unreferenced (Tmp4);
   pragma Unreferenced (Gen);
   pragma Unreferenced (Ver);
end Executer;
