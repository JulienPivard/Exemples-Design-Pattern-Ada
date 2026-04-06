with Ada.Text_IO;

package body Visiteur_P.Instrumentation_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   not overriding
   function Creer
      return Instrumentation_T
   is
   begin
      return Resultat : constant Instrumentation_T := Instrumentation_T'
         (
            Visiteur_T with
               NB_Elements   => NB_Elements_T'First,
               NB_Classes    => NB_Classes_T'First,
               NB_Packages   => NB_Packages_T'First,
               NB_Operations => NB_Operations_T'First
         );
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Visiter_Element_Nomme
      (
         This : in out Instrumentation_T;
         Obj  : in out Uml_P.Element_Nomme_T'Class
      )
   is
      pragma Unreferenced (Obj);
   begin
      This.NB_Elements := This.NB_Elements + 1;
   end Visiter_Element_Nomme;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Visiter_Code_Class
      (
         This : in out Instrumentation_T;
         Obj  : in out Uml_P.Code_Class_T'Class
      )
   is
      pragma Unreferenced (Obj);
   begin
      This.NB_Classes := This.NB_Classes + 1;
   end Visiter_Code_Class;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Visiter_Verif_Package
      (
         This : in out Instrumentation_T;
         Obj  : in out Uml_P.Verif_Package_T'Class
      )
   is
      pragma Unreferenced (Obj);
   begin
      This.NB_Packages := This.NB_Packages + 1;
   end Visiter_Verif_Package;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Visiter_Operation
      (
         This : in out Instrumentation_T;
         Obj  : in out Uml_P.Operation_T'Class
      )
   is
      pragma Unreferenced (Obj);
   begin
      This.NB_Operations := This.NB_Operations + 1;
   end Visiter_Operation;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Afficher
      (This : in     Instrumentation_T)
   is
   begin
      Ada.Text_IO.Put_Line
         (
            Item => "Nombre de variables : ["  &
               NB_Elements_T'Image (This.NB_Elements) & "]"
         );
      Ada.Text_IO.Put_Line
         (
            Item => "Nombre de classes : ["  &
               NB_Classes_T'Image (This.NB_Classes) & "]"
         );
      Ada.Text_IO.Put_Line
         (
            Item => "Nombre de packages : ["  &
               NB_Packages_T'Image (This.NB_Packages) & "]"
         );
      Ada.Text_IO.Put_Line
         (
            Item => "Nombre d'opérations : ["  &
               NB_Operations_T'Image (This.NB_Operations) & "]"
         );
   end Afficher;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Visiteur_P.Instrumentation_P;
