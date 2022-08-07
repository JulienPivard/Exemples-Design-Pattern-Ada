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
            This.U_2.Utilisateur.Afficher (Recu => This.U_1.Utilisateur);
         when 2 =>
            This.U_1.Utilisateur.Afficher (Recu => This.U_2.Utilisateur);
      end case;
   end Signaler;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Inscrire
      (
         This : in out Concret_T;
         Nom  : in     Donnee_P.Contenu_T;
         Id   :    out Id_T
      )
   is
   begin
      Id := This.Pos;
      case This.Pos is
         when 1 =>
            This.U_1 := Collegue_T'
               (
                  Utilisateur => Utilisateur_P.Collegue_P.Creer (Nom => Nom),
                  Initialise  => True
               );
            This.Pos := This.Pos + 1;
         when 2 =>
            This.U_2 := Collegue_T'
               (
                  Utilisateur => Utilisateur_P.Collegue_P.Creer (Nom => Nom),
                  Initialise  => True
               );
      end case;
   end Inscrire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Envoyer
      (
         This         : in out Concret_T;
         Envoyeur     : in     Id_T;
         Destinataire : in     Id_T;
         Message      : in     Donnee_P.Contenu_T
      )
   is
      pragma Unreferenced (Destinataire);
   begin
      case Envoyeur is
         when 1 =>
            Envoyer (Collegue => This.U_1, Message => Message);
         when 2 =>
            Envoyer (Collegue => This.U_2, Message => Message);
      end case;
      This.Signaler (Id => Envoyeur);
   end Envoyer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Envoyer
      (
         Collegue : in out Collegue_T;
         Message  : in     Donnee_P.Contenu_T
      )
   is
   begin
      if Collegue.Initialise then
         Collegue.Utilisateur.Envoyer (Message => Message);
      else
         Ada.Text_IO.Put_Line (Item => "[ERREUR] utilisateur non initialisé");
      end if;
   end Envoyer;
   ---------------------------------------------------------------------------

end Mediateur_P.Concret_P;
