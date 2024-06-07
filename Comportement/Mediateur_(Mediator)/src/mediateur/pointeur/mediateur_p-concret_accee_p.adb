package body Mediateur_P.Concret_Accee_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Signaler
      (
         This : in out Concret_T;
         ID   : in     ID_T
      )
   is
   begin
      case ID.ID is
         when 1 =>
            This.U_2.all.Afficher (Recu => This.U_1.all);
         when 2 =>
            This.U_1.all.Afficher (Recu => This.U_2.all);
      end case;
   end Signaler;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   not overriding
   procedure Inscrire
      (
         This        : not null access Concret_T;
         Utilisateur : in     Collegue_A
      )
   is
   begin
      if not This.all.Pos.Est_Valide then
         This.all.Pos := ID_T'
            (
               Est_Valide => True,
               ID         => ID_G_T'First
            );
      end if;

      Utilisateur.all.Ajouter
         (
            Mediateur => This,
            ID        => This.all.Pos
         );
      case This.all.Pos.ID is
         when 1 =>
            This.all.U_1    := Utilisateur;
            This.all.Pos.ID := This.all.Pos.ID + 1;
         when 2 =>
            This.all.U_2 := Utilisateur;
      end case;
   end Inscrire;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Mediateur_P.Concret_Accee_P;
