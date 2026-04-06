with Ada.Text_IO;

package body Visiteur_P.Code_Generateur_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   not overriding
   function Creer
      return Code_Generateur_T
   is
   begin
      return Resultat : constant Code_Generateur_T :=
         Code_Generateur_T'(Visiteur_T with null record);
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
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
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Visiteur_P.Code_Generateur_P;
