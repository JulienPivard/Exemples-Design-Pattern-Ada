with Ada.Text_IO;

with Comptage_P;

package body Singleton_P is

   ---------------------------------------------------------------------------
   function Recuperer_Singleton
      return Singleton_A
   is
   begin
      Comptage_P.Compteur := Comptage_P.Compteur + 1;
      return Unique;
   end Recuperer_Singleton;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Changer_Nom
      (
         Singleton   : in out Singleton_T;
         Nom         : in     String
      )
   is
   begin
      Singleton.Nom := Nom_R.To_Unbounded_String (Source => Nom);
   end Changer_Nom;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Afficher
      (Singleton : in Singleton_T)
   is
      Nom : constant String := Nom_R.To_String (Source => Singleton.Nom);
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

end Singleton_P;
