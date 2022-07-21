with Ada.Text_IO;

package body Produit_P.Concret_2_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Initialiser
      (This : in out Concret_T)
   is
   begin
      This.Etat := Ouvert;
   end Initialiser;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Afficher
      (This : in     Concret_T)
   is
   begin
      Boucle_Affiche_Les_Etats :
      for E in Etat_T loop
         if E = This.Etat then
            Ada.Text_IO.Put_Line (Item => "Etat => " & Etat_T'Image (E));
         else
            Ada.Text_IO.Put_Line (Item => "        " & Etat_T'Image (E));
         end if;
      end loop Boucle_Affiche_Les_Etats;
   end Afficher;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Produit_P.Concret_2_P;
