with Composant_P.Concret_P;
with Composant_P.Decorateur_P.Ascenseur_P;
with Composant_P.Decorateur_P.Boite_P;
with Texte_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   ---------------------------------------------------------------------------
   procedure Afficher
      (Texte : in     Composant_P.Composant_T'Class);

   ------------------
   procedure Afficher
      (Texte : in     Composant_P.Composant_T'Class)
   is
      T : Texte_P.Texte_T;
   begin
      T := Texte.Faire (Largeur => 80);

      Boucle_Afficher :
      for P of T loop
         Ada.Text_IO.Put_Line (Item => P);
      end loop Boucle_Afficher;
   end Afficher;
   ---------------------------------------------------------------------------

   C : constant Composant_P.Concret_P.Concret_T :=
      Composant_P.Concret_P.Initialiser
         (
            Text => "« Tout ce que je dis c'est que je pense qu'il est " &
               "franchement improbable qu'il y ait quoi que ce soit qui " &
               "ressemble à une volonté cosmique centrale, à un monde " &
               "spirituel ou à un être éternel. Il s'agit là des idées les " &
               "plus absurdes et les plus injustifiées que l'on puisse " &
               "avoir à propos de l'univers et je ne suis pas assez " &
               "pinailleur pour prétendre que je ne les vois pas comme " &
               "autre chose que de fieffées idioties. Dans l'idée, je suis " &
               "agnostique, mais comme je préfère me ranger du côté des " &
               "preuves tangibles, on doit me classer parmi les athées »" &
               ASCII.LF & "H.P. Lovecraft"
         );
   A : Composant_P.Decorateur_P.Ascenseur_P.Ascenseur_T;
   B : Composant_P.Decorateur_P.Boite_P.Boite_T;
begin
   Afficher (Texte => C);

   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "-");
   Ada.Text_IO.New_Line (Spacing => 1);

   B.Ajouter (Composant => C);
   Afficher (Texte => B);

   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "-");
   Ada.Text_IO.New_Line (Spacing => 1);

   A.Ajouter (Composant => C);
   Afficher (Texte => A);

   Ada.Text_IO.New_Line (Spacing => 1);
   Ada.Text_IO.Put_Line (Item => "-");
   Ada.Text_IO.New_Line (Spacing => 1);

   A.Ajouter (Composant => B);
   Afficher (Texte => A);
end Executer;
