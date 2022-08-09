package body Mediateur_P.Singleton_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Signaler
      (
         This : in out Mediateur_Concret_T;
         Id   : in     Id_T
      )
   is
      pragma Unreferenced (This);
   begin
      Mediateur.Signaler (Id => Id);
   end Signaler;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Inscrire
      (
         This        : in out Mediateur_Concret_T;
         Utilisateur : in out Utilisateur_Singleton_P.Utilisateur_T'Class
      )
   is
   begin
      Mediateur.Inscrire_Protege
         (
            Mediateur_V => This,
            Utilisateur => Utilisateur
         );
   end Inscrire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   protected body Mediateur is
      ------------------
      procedure Signaler
         (Id : in     Id_T)
      is
         User_1 : Utilisateur_Singleton_P.Utilisateur_T'Class renames
            U_1.Utilisateur.Element;
         User_2 : Utilisateur_Singleton_P.Utilisateur_T'Class renames
            U_2.Utilisateur.Element;
      begin
         case Id is
            when 1 => User_2.Afficher (Recu => User_1);
            when 2 => User_1.Afficher (Recu => User_2);
         end case;
      end Signaler;
      ------------------

      ------------------
      procedure Inscrire_Protege
         (
            Mediateur_V : in out Mediateur_Concret_T;
            Utilisateur : in out Utilisateur_Singleton_P.Utilisateur_T'Class
         )
      is
      begin
         Utilisateur.Ajouter
            (
               Mediateur => Mediateur_V,
               Id        => Pos
            );
         case Pos is
            when 1 =>
               U_1.Utilisateur :=
                  Utilisateur_Holders_P.To_Holder (New_Item => Utilisateur);
               Pos := Pos + 1;
            when 2 =>
               U_2.Utilisateur :=
                  Utilisateur_Holders_P.To_Holder (New_Item => Utilisateur);
         end case;
      end Inscrire_Protege;
      ------------------
   end Mediateur;
   ---------------------------------------------------------------------------

end Mediateur_P.Singleton_P;
