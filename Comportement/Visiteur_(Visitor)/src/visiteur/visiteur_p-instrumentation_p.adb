with Ada.Text_IO;

package body Visiteur_P.Instrumentation_P
   with Spark_Mode => Off
is

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
      This.Nb_Elements := This.Nb_Elements + 1;
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
      This.Nb_Classes := This.Nb_Classes + 1;
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
      This.Nb_Packages := This.Nb_Packages + 1;
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
      This.Nb_Operations := This.Nb_Operations + 1;
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
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Visiteur_P.Instrumentation_P;
