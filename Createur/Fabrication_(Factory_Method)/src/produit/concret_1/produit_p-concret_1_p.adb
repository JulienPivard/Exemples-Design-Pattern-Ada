with Ada.Text_IO;

package body Produit_P.Concret_1_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Creer_Produit
      (Produit : in out Concret_T)
   is
   begin
      Produit.Contenu := "Coucou ttt";
   end Creer_Produit;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Afficher
      (Produit : in Concret_T)
   is
   begin
      Ada.Text_IO.Put_Line (Item => Produit.Contenu);
   end Afficher;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Produit_P.Concret_1_P;
