package body Valeurs_P.Concret_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   overriding
   procedure Modifier
      (
         This : in out Sujet_T;
         Vals : in     Table_Valeurs_T
      )
   is
   begin
      Valeurs_Graphe_T (This).Modifier (Vals => Vals);
      This.Notifier;
   end Modifier;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   function Lire_Vals
      (This : in     Sujet_T)
      return Table_Valeurs_T
   is
   begin
      return Valeurs_Graphe_T (This).Lire_Vals;
   end Lire_Vals;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Attache
      (
         This        : in out Sujet_T;
         Observateur : in     Observateur_P.Observateur_T'Class
      )
   is
      R : constant Ref_Obs_T := Ref_Obs_T'
         (
            Observateur => Holders_P.To_Holder (New_Item => Observateur),
            Obs_Present => True
         );

      Pos : Indice_Obs_T := Indice_Obs_T'First;
      I   : Indice_Obs_T := Indice_Obs_T'First;

      Trouve : Boolean := False;
   begin
      Boucle_Suppression :
      for E : Ref_Obs_T of This.Observateurs loop
         if not E.Obs_Present then
            Pos    := I;
            Trouve := True;
         end if;
         if I /= Indice_Obs_T'Last then
            I := I + 1;
         end if;
      end loop Boucle_Suppression;
      if Trouve then
         This.Nb_Observateurs    := This.Nb_Observateurs + 1;
         This.Observateurs (Pos) := R;
      end if;
   end Attache;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Detache
      (
         This        : in out Sujet_T;
         Observateur : in     Observateur_P.Observateur_T'Class
      )
   is
      use type Observateur_P.Observateur_T;

      R : constant Ref_Obs_T := Ref_Obs_T'
         (
            Observateur => Holders_P.To_Holder (New_Item => Observateur),
            Obs_Present => False
         );

      Pos : Indice_Obs_T := Indice_Obs_T'First;
      I   : Indice_Obs_T := Indice_Obs_T'First;

      Trouve : Boolean := False;
   begin
      Boucle_Suppression :
      for E : Ref_Obs_T of This.Observateurs loop
         if E.Obs_Present and then E.Observateur.Element = Observateur then
            Pos    := I;
            Trouve := True;
         end if;
         if I /= Indice_Obs_T'Last then
            I := I + 1;
         end if;
      end loop Boucle_Suppression;
      if Trouve then
         This.Nb_Observateurs    := This.Nb_Observateurs - 1;
         This.Observateurs (Pos) := R;
      end if;
   end Detache;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Notifier
      (This : in out Sujet_T)
   is
   begin
      Boucle_Maj :
      for E : Ref_Obs_T of This.Observateurs loop
         if E.Obs_Present then
            E.Observateur.Reference.Mettre_A_Jour (Etat => This.Lire_Vals);
         end if;
      end loop Boucle_Maj;
   end Notifier;
   ---------------------------------------------------------------------------

end Valeurs_P.Concret_P;
