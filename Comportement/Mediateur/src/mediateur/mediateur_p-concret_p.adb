with Ada.Strings.Fixed;
with Ada.Text_IO;

package body Mediateur_P.Concret_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Signaler
      (
         This : in out Concret_T;
         Id   : in     Id_T
      )
   is
   begin
      case Id is
         when 1 =>
            This.Afficher (Utilisateur => This.U_1.all);
         when 2 =>
            This.Afficher (Utilisateur => This.U_2.all);
      end case;
   end Signaler;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   not overriding
   procedure Inscrire
      (
         This        : not null access Concret_T;
         Utilisateur : in     Utilisateur_P.Collegue_P.Utilisateur_Collegue_A
      )
   is
   begin
      Utilisateur.all.Ajouter
         (
            Mediateur => This,
            Id        => This.all.Pos
         );
      case This.all.Pos is
         when 1 =>
            This.all.U_1 := Utilisateur;
            This.all.Pos := This.all.Pos + 1;
         when 2 =>
            This.all.U_2 := Utilisateur;
      end case;
   end Inscrire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   not overriding
   procedure Afficher
      (
         This        : in     Concret_T;
         Utilisateur : in     Utilisateur_P.Utilisateur_T'Class
      )
   is
      pragma Unreferenced (This);
   begin
      Ada.Text_IO.Put
         (
            Item => "[" &
               Ada.Strings.Fixed.Trim
                  (
                     Source => Utilisateur.Lire_Nom,
                     Side   => Ada.Strings.Both
                  ) &
               "] "
         );
      Ada.Text_IO.Put_Line (Item => Utilisateur.Lire_Msg);
   end Afficher;
   ---------------------------------------------------------------------------

end Mediateur_P.Concret_P;
