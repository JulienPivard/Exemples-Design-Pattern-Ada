with Composant_P.Concret_P;
with Largeur_P;

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
      T : Largeur_P.Texte_T;
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
begin
   Afficher (Texte => C);
end Executer;
