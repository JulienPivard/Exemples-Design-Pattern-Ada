with Ada.Text_IO;

package body Singleton_P is

   ---------------------------------------------------------------------------
   function Recuperer_Singleton return Singleton_Access_T is
   begin
      return Unique;
   end Recuperer_Singleton;

   ---------------------------------------------------------------------------
   procedure Changer_Nom
      (
         Singleton : in out Singleton_T;
         Nom : Ada.Strings.Unbounded.Unbounded_String
      )
   is
   begin
      Singleton.Nom := Nom;
   end Changer_Nom;

   ---------------------------------------------------------------------------
   procedure Afficher (Singleton : Singleton_T) is
   begin
      Ada.Text_IO.Put_Line
         (Ada.Strings.Unbounded.To_String (Singleton.Nom));
      Ada.Text_IO.Put_Line (Singleton.Age'Img);
   end Afficher;

end Singleton_P;
