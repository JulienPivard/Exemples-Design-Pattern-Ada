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
   ---------------------------

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
   ---------------------------

   ---------------------------------------------------------------------------

   type Nb_Elements_T   is range 0 .. 1_000;
   type Nb_Classes_T    is range 0 .. 1_000;
   type Nb_Packages_T   is range 0 .. 1_000;
   type Nb_Operations_T is range 0 .. 1_000;

   ---------------------------------------------------------------------------
   type Instrumentation_T is new Visiteur_P.Visiteur_T with
      record
         Nb_Elements   : Nb_Elements_T   := Nb_Elements_T'First;
         Nb_Classes    : Nb_Classes_T    := Nb_Classes_T'First;
         Nb_Packages   : Nb_Packages_T   := Nb_Packages_T'First;
         Nb_Operations : Nb_Operations_T := Nb_Operations_T'First;
      end record;

   --------------------------
   overriding
   procedure Visiter_Element_Nomme
      (
         This : in out Instrumentation_T;
         Obj  : in out Uml_P.Element_Nomme_T'Class
      );
   --  Permet de visiter l'élément parent.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

   --------------------------
   overriding
   procedure Visiter_Code_Class
      (
         This : in out Instrumentation_T;
         Obj  : in out Uml_P.Code_Class_T'Class
      );
   --  Permet de visiter un des fils de la classe Element_Nomme.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

   --------------------------
   overriding
   procedure Visiter_Verif_Package
      (
         This : in out Instrumentation_T;
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
         This : in out Instrumentation_T;
         Obj  : in out Uml_P.Operation_T'Class
      );
   --  Permet de visiter.
   --  @param This
   --  Le visiteur.
   --  @param Obj
   --  L'objet à visiter.

   --------------------------
   procedure Afficher
      (This : in     Instrumentation_T);
   --  Affiche le résultat du visiteur.
   --  @param This
   --  Le visiteur.

   --------------------------
   overriding
   procedure Visiter_Element_Nomme
      (
         This : in out Instrumentation_T;
         Obj  : in out Uml_P.Element_Nomme_T'Class
      )
   is
      pragma Unreferenced (Obj);
   begin
      This.Nb_Elements := This.Nb_Elements + 1;
      Ada.Text_IO.Put_Line
         (
            Item => "Nombre d'éléments : ["  &
               Nb_Elements_T'Image (This.Nb_Elements) & "]"
         );
   end Visiter_Element_Nomme;
   --------------------------

   --------------------------
   overriding
   procedure Visiter_Code_Class
      (
         This : in out Instrumentation_T;
         Obj  : in out Uml_P.Code_Class_T'Class
      )
   is
      pragma Unreferenced (Obj);
   begin
      This.Nb_Classes := This.Nb_Classes + 1;
      Ada.Text_IO.Put_Line
         (
            Item => "Nombre de classes : ["  &
               Nb_Classes_T'Image (This.Nb_Classes) & "]"
         );
   end Visiter_Code_Class;
   --------------------------

   --------------------------
   overriding
   procedure Visiter_Verif_Package
      (
         This : in out Instrumentation_T;
         Obj  : in out Uml_P.Verif_Package_T'Class
      )
   is
      pragma Unreferenced (Obj);
   begin
      This.Nb_Packages := This.Nb_Packages + 1;
      Ada.Text_IO.Put_Line
         (
            Item => "Nombre de packages : ["  &
               Nb_Packages_T'Image (This.Nb_Packages) & "]"
         );
   end Visiter_Verif_Package;
   ---------------------------

   ---------------------------
   overriding
   procedure Visiter_Operation
      (
         This : in out Instrumentation_T;
         Obj  : in out Uml_P.Operation_T'Class
      )
   is
      pragma Unreferenced (Obj);
   begin
      This.Nb_Operations := This.Nb_Operations + 1;
      Ada.Text_IO.Put_Line
         (
            Item => "Nombre d'opérations : ["  &
               Nb_Operations_T'Image (This.Nb_Operations) & "]"
         );
   end Visiter_Operation;
   ---------------------------

   ---------------------------
   procedure Afficher
      (This : in     Instrumentation_T)
   is
   begin
      Ada.Text_IO.Put_Line
         (
            Item => "Nombre d'éléments : ["  &
               Nb_Elements_T'Image (This.Nb_Elements) & "]"
         );
      Ada.Text_IO.Put_Line
         (
            Item => "Nombre de classes : ["  &
               Nb_Classes_T'Image (This.Nb_Classes) & "]"
         );
      Ada.Text_IO.Put_Line
         (
            Item => "Nombre de packages : ["  &
               Nb_Packages_T'Image (This.Nb_Packages) & "]"
         );
      Ada.Text_IO.Put_Line
         (
            Item => "Nombre d'opérations : ["  &
               Nb_Operations_T'Image (This.Nb_Operations) & "]"
         );
   end Afficher;
   ---------------------------

   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Executer
      (Visiteur : in out Visiteur_P.Visiteur_T'Class);

   ------------------
   procedure Executer
      (Visiteur : in out Visiteur_P.Visiteur_T'Class)
   is
      Tmp1 : Uml_P.Element_Nomme_T;    --  Un visité
      Tmp2 : Uml_P.Code_Class_T;       --  Un visité
      Tmp3 : Uml_P.Verif_Package_T;    --  Un visité
      Tmp4 : Uml_P.Operation_T;        --  Un visité
   begin
      Tmp1.Visiter (Le_Visiteur => Visiteur);
      Tmp2.Visiter (Le_Visiteur => Visiteur);
      Tmp3.Visiter (Le_Visiteur => Visiteur);
      Tmp4.Visiter (Le_Visiteur => Visiteur);

      pragma Unreferenced (Tmp1);
      pragma Unreferenced (Tmp2);
      pragma Unreferenced (Tmp3);
      pragma Unreferenced (Tmp4);
   end Executer;
   ---------------------------------------------------------------------------

   Gen  : Code_Generateur_T;  --  Un visiteur
   Ver  : Verificateur_T;     --  Un visiteur
   Inst : Instrumentation_T;

begin
   Ada.Text_IO.Put_Line (Item => "Démonstration de l'utilisation du pattern");
   Ada.Text_IO.Put_Line (Item => "visiteur sur une hiérarchie d'objets.");

   Ada.Text_IO.New_Line (Spacing => 1);
   Executer (Visiteur => Gen);
   Ada.Text_IO.New_Line (Spacing => 1);
   Executer (Visiteur => Ver);
   Ada.Text_IO.New_Line (Spacing => 1);
   Executer (Visiteur => Inst);

   Afficher (This => Inst);

   pragma Unreferenced (Gen);
   pragma Unreferenced (Ver);
   pragma Unreferenced (Inst);
end Executer;
