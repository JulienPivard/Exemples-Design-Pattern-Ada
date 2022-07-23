with Ada.Text_IO;

with Comptage_P;

package body Singleton_Bis_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   function Recuperer_Singleton
      return Singleton_T
   is
   begin
      Comptage_P.Compteur := Comptage_P.Compteur + 1;
      return Singleton_T'(null record);
   end Recuperer_Singleton;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Changer_Nom
      (
         This : in out Singleton_T;
         Nom  : in     String
      )
   is
      pragma Unreferenced (This);
   begin
      Singleton_Protege.Changer (Nom => Nom);
   end Changer_Nom;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Afficher
      (This : in     Singleton_T)
   is
      pragma Unreferenced (This);
   begin
      Singleton_Protege.Afficher;
   end Afficher;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   protected body Singleton_Protege is
      ---------------------
      procedure Changer
         (Nom : in     String)
      is
      begin
         Singleton_Protege.Nom := Nom_R.To_Unbounded_String (Source => Nom);
      end Changer;
      ---------------------

      ---------------------
      procedure Afficher is
         Nom_Str : constant String := Nom_R.To_String (Source => Nom);
      begin
         Ada.Text_IO.Put (Item => Nom_Str & " | ");

         Ada.Text_IO.Put_Line
            (
               Item => "Nb instances lues : " &
                  Comptage_P.Compteur'Img & " fois"
            );
      end Afficher;
      ---------------------
   end Singleton_Protege;
   ---------------------------------------------------------------------------

end Singleton_Bis_P;
