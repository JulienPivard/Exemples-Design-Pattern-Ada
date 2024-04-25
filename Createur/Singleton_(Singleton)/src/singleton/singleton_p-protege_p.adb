with Ada.Text_IO;

with Comptage_P;

package body Singleton_P.Protege_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   function Recuperer_Singleton
      return Accesseur_T
   is
   begin
      return Accesseur_T'(Singleton => Unique'Access);
   end Recuperer_Singleton;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   protected body Singleton_T is
      ---------------------
      procedure Changer_Nom
         (Nom : in     String)
      is
      begin
         Comptage_P.Compteur := Comptage_P.Compteur + 1;
         Singleton_T.Nom := Nom_R.To_Unbounded_String (Source => Nom);
      end Changer_Nom;
      ---------------------

      ---------------------
      procedure Afficher is
         Nom_Str : constant String := Nom_R.To_String (Source => Nom);
      begin
         Ada.Text_IO.Put (Item => Nom_Str & " | ");

         Ada.Text_IO.Put_Line
            (
               Item => "Nb instances lues : " &
                  Comptage_P.Compteur'Image & " fois"
            );
      end Afficher;
      ---------------------
   end Singleton_T;
   ---------------------------------------------------------------------------

end Singleton_P.Protege_P;
