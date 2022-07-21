with Ada.Text_IO;

package body Produit_P.Concret_1_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Initialiser
      (This : in out Concret_T)
   is
   begin
      This.Contenu := "Coucou ttt";
   end Initialiser;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Afficher
      (This : in     Concret_T)
   is
   begin
      Ada.Text_IO.Put_Line (Item => This.Contenu);
   end Afficher;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Produit_P.Concret_1_P;
