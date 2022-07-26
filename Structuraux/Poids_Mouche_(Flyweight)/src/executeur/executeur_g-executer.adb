with Etat_P;
with Poids_Mouche_Access_P.Fabrique_P;
with Poids_Mouche_P.Fabrique_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   package Fab_Access_P renames Poids_Mouche_Access_P.Fabrique_P;

   ---------------------------------------------------------------------------
   procedure Consomer_Jeton
      (
         Fabrique : in out Fab_Access_P.Fabrique_De_Poids_Mouche_T;
         Jeton    : in     Fab_Access_P.Id_Poids_Mouche_T;
         Etat_Ext : in     Etat_P.Etat_Externe_T
      );

   procedure Consomer_Jeton
      (
         Fabrique : in out Fab_Access_P.Fabrique_De_Poids_Mouche_T;
         Jeton    : in     Fab_Access_P.Id_Poids_Mouche_T;
         Etat_Ext : in     Etat_P.Etat_Externe_T
      )
   is
      P : constant Fab_Access_P.Poids_Mouche_A :=
         Fabrique.Fabriquer (Clef => Jeton, Nom => "Truite              ");
   begin
      P.all.Operation (Etat => Etat_Ext);
      Ada.Text_IO.New_Line (Spacing => 1);
   end Consomer_Jeton;
   ---------------------------------------------------------------------------

   package Fab_P renames Poids_Mouche_P.Fabrique_P;

   ---------------------------------------------------------------------------
   procedure Consomer_Jeton
      (
         Fabrique : in out Fab_P.Fabrique_De_Poids_Mouche_T;
         Jeton    : in     Fab_P.Id_Poids_Mouche_T;
         Etat_Ext : in     Etat_P.Etat_Externe_T
      );

   procedure Consomer_Jeton
      (
         Fabrique : in out Fab_P.Fabrique_De_Poids_Mouche_T;
         Jeton    : in     Fab_P.Id_Poids_Mouche_T;
         Etat_Ext : in     Etat_P.Etat_Externe_T
      )
   is
      P : constant Fab_P.Poids_Mouche_A := Fabrique.Fabriquer (Clef => Jeton);
   begin
      P.all.Operation (Etat => Etat_Ext);
      Ada.Text_IO.New_Line (Spacing => 1);
   end Consomer_Jeton;
   ---------------------------------------------------------------------------

   E : Etat_P.Etat_Externe_T;

   F_A : Fab_Access_P.Fabrique_De_Poids_Mouche_T := Fab_Access_P.Initialiser;
   F   : Fab_P.Fabrique_De_Poids_Mouche_T        := Fab_P.Initialiser;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line
      (Item => "Démonstration du design pattern poids mouche.");
   Ada.Text_IO.Put_Line (Item => "Le principe est diminuer la charge sur la");
   Ada.Text_IO.Put_Line (Item => "mémoire qu'induit un grand nombre ");
   Ada.Text_IO.Put_Line (Item => "d'instances d'objets similaire et sans.");
   Ada.Text_IO.Put_Line (Item => "états interne.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   E.Modifier_Val (Val => 19);

   Consomer_Jeton
      (Fabrique => F_A, Jeton => Fab_Access_P.Jeton_1, Etat_Ext => E);
   Consomer_Jeton
      (Fabrique => F_A, Jeton => Fab_Access_P.Jeton_2, Etat_Ext => E);
   Consomer_Jeton
      (Fabrique => F_A, Jeton => Fab_Access_P.Jeton_3, Etat_Ext => E);
   Consomer_Jeton
      (Fabrique => F_A, Jeton => Fab_Access_P.Jeton_4, Etat_Ext => E);
   Consomer_Jeton
      (Fabrique => F_A, Jeton => Fab_Access_P.Jeton_5, Etat_Ext => E);

   pragma Unreferenced (F_A);

   Ada.Text_IO.New_Line (Spacing => 1);
   E.Modifier_Val (Val => 5);

   Consomer_Jeton (Fabrique => F, Jeton => Fab_P.Jeton_1, Etat_Ext => E);
   Consomer_Jeton (Fabrique => F, Jeton => Fab_P.Jeton_2, Etat_Ext => E);
   Consomer_Jeton (Fabrique => F, Jeton => Fab_P.Jeton_3, Etat_Ext => E);
   Consomer_Jeton (Fabrique => F, Jeton => Fab_P.Jeton_4, Etat_Ext => E);
   Consomer_Jeton (Fabrique => F, Jeton => Fab_P.Jeton_5, Etat_Ext => E);

   pragma Unreferenced (F);

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
