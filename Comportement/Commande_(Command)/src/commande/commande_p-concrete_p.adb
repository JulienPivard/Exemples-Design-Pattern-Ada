with Ada.Text_IO;

with GNAT.Source_Info;

package body Commande_P.Concrete_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Execute
      (This : in out Commande_Concrete_T)
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Enclosing_Entity);
      Ada.Text_IO.Put_Line (Item => "Exécution de commande");
   end Execute;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Lire_Nom
      (This : in     Commande_Concrete_T)
      return String
   is
      pragma Unreferenced (This);
   begin
      return "Sauvegarder Sous";
   end Lire_Nom;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Commande_P.Concrete_P;
