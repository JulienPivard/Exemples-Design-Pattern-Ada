with Ada.Text_IO;

package body Observateur_Chiffre_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Mettre_A_Jour
      (
         This : in out Chiffre_T;
         Etat : in     Valeurs_P.Table_Valeurs_T
      )
   is
   begin
      This.Etat := Etat;
      This.Dessiner;
   end Mettre_A_Jour;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   not overriding
   function Creer
      return Chiffre_T
   is
   begin
      return Chiffre_T'(Etat => Valeurs_P.Table_Valeurs_T'(others => 0));
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   not overriding
   procedure Dessiner
      (This : in out Chiffre_T)
   is
   begin
      Boucle_Parcours_Valeurs :
      for I in Valeurs_P.Indice_T loop
         Ada.Text_IO.Put (Item => Valeurs_P.Val_T'Image (This.Etat (I)));
         Ada.Text_IO.Put (Item => "%   ");
      end loop Boucle_Parcours_Valeurs;
      Ada.Text_IO.New_Line (Spacing => 1);
   end Dessiner;
   ---------------------------------------------------------------------------

end Observateur_Chiffre_P;
