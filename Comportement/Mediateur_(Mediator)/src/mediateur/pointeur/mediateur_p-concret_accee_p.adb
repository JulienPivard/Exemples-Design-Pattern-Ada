package body Mediateur_P.Concret_Accee_P
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

end Mediateur_P.Concret_Accee_P;
