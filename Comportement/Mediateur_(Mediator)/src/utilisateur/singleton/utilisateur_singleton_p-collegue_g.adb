with Ada.Text_IO;
with Ada.Strings.Fixed;

package body Utilisateur_Singleton_P.Collegue_G
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Ajouter
      (
         This      : in out Utilisateur_Collegue_T;
         Mediateur : in     Mediateur_P.Mediateur_T'Class;
         Id        : in     Mediateur_P.Id_T
      )
   is
      pragma Unreferenced (This);
   begin
      Utilisateur.Ajouter
         (
            Mediateur => Mediateur,
            Id        => Id
         );
   end Ajouter;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Creer
      (Nom : in     Donnee_P.Contenu_T)
      return Utilisateur_Collegue_T
   is
   begin
      Utilisateur.Changer_Nom (Nom => Nom);
      return Utilisateur_Collegue_T'(null record);
   end Creer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Envoyer
      (
         This    : in out Utilisateur_Collegue_T;
         Message : in     Donnee_P.Contenu_T
      )
   is
      pragma Unreferenced (This);

      Mediateur : Mediateur_T := Utilisateur.Lire_Mediateur;
   begin
      Utilisateur.Changer_Contenu (Message => Message);
      Mediateur.Reference.Signaler (Id => Utilisateur.Lire_Id);
   end Envoyer;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Lire_Nom
      (This : in     Utilisateur_Collegue_T)
      return Donnee_P.Contenu_T
   is
      pragma Unreferenced (This);
   begin
      return Utilisateur.Lire_Nom;
   end Lire_Nom;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Lire_Msg
      (This : in     Utilisateur_Collegue_T)
      return Donnee_P.Contenu_T
   is
      pragma Unreferenced (This);
   begin
      return Utilisateur.Lire_Msg;
   end Lire_Msg;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Afficher
      (
         This : in     Utilisateur_Collegue_T;
         Recu : in     Utilisateur_Abstrait_P.Utilisateur_T'Class
      )
   is
   begin
      Ada.Text_IO.Put
         (
            Item => "[" &
               Ada.Strings.Fixed.Trim
                  (
                     Source => This.Lire_Nom,
                     Side   => Ada.Strings.Both
                  ) &
               "] a reçu un message de [" &
               Ada.Strings.Fixed.Trim
                  (
                     Source => Recu.Lire_Nom,
                     Side   => Ada.Strings.Both
                  ) &
               "] => "
         );
      Ada.Text_IO.Put_Line (Item => Recu.Lire_Msg);
   end Afficher;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   protected body Utilisateur is
      -----------------
      procedure Ajouter
         (
            Mediateur : in     Mediateur_P.Mediateur_T'Class;
            Id        : in     Mediateur_P.Id_T
         )
      is
      begin
         Mediateur_H  := Mediateur_Holder_P.To_Holder (New_Item => Mediateur);
         Id_Mediateur := Id;
      end Ajouter;
      -----------------

      -----------------
      procedure Changer_Nom
         (Nom : in     Donnee_P.Contenu_T)
      is
      begin
         Nom_L := Nom;
      end Changer_Nom;
      -----------------

      -----------------
      procedure Changer_Contenu
         (Message : in     Donnee_P.Contenu_T)
      is
      begin
         Contenu := Message;
      end Changer_Contenu;
      -----------------

      -----------------
      function Lire_Nom
         return Donnee_P.Contenu_T
      is
      begin
         return Nom_L;
      end Lire_Nom;
      -----------------

      -----------------
      function Lire_Msg
         return Donnee_P.Contenu_T
      is
      begin
         return Contenu;
      end Lire_Msg;
      -----------------

      -----------------
      function Lire_Mediateur
         return Mediateur_T
      is
      begin
         return Mediateur_H;
      end Lire_Mediateur;
      -----------------

      -----------------
      function Lire_Id
         return Mediateur_P.Id_T
      is
      begin
         return Id_Mediateur;
      end Lire_Id;
      -----------------
   end Utilisateur;
   ---------------------------------------------------------------------------

end Utilisateur_Singleton_P.Collegue_G;
