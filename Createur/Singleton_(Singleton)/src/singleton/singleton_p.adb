with Ada.Text_IO;

with Comptage_P;

package body Singleton_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   function Recuperer_Singleton
      return Accesseur_T
   is
   begin
      Comptage_P.Compteur := Comptage_P.Compteur + 1;
      return Accesseur_T'(Singleton => Unique'Access);
   end Recuperer_Singleton;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Changer_Nom
      (
         This : in out Singleton_T;
         Nom  : in     String
      )
   is
   begin
      This.Nom := Nom_R.To_Unbounded_String (Source => Nom);
   end Changer_Nom;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Afficher
      (This : in     Singleton_T)
   is
      Nom : constant String := Nom_R.To_String (Source => This.Nom);
   begin
      Ada.Text_IO.Put      (Item => Nom);
      Ada.Text_IO.Put      (Item => " | ");

      Ada.Text_IO.Put_Line
         (
            Item => "Nb instances lues : " &
               Comptage_P.Compteur'Img & " fois"
         );
   end Afficher;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Singleton_P;
