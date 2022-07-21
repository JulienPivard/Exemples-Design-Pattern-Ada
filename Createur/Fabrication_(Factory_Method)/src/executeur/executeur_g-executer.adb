with Ada.Text_IO;

with Fabrique_P.Concret_1_P;
with Fabrique_P.Concret_2_P;
with Fabrique_P;
with Produit_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   ---------------------------------------------------------------------------
   procedure Utiliser
      (Fabrique : in     Fabrique_P.Fabrique_T'Class);

   ------------------
   procedure Utiliser
      (Fabrique : in     Fabrique_P.Fabrique_T'Class)
   is
      P : Produit_P.Produit_T'Class := Fabrique.Fabriquer;
   begin
      P.Initialiser;
      P.Afficher;
   end Utiliser;
   ---------------------------------------------------------------------------

   F_1 : Fabrique_P.Concret_1_P.Concret_T;
   F_2 : Fabrique_P.Concret_2_P.Concret_T;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern Fabrique");
   Ada.Text_IO.Put_Line (Item => "Définit une interface de création d'objets");
   Ada.Text_IO.Put_Line (Item => "mais laisse à ses filles le soins de");
   Ada.Text_IO.Put_Line (Item => "créer les instances concrète du produit.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   Utiliser (Fabrique => F_1);
   Ada.Text_IO.New_Line (Spacing => 1);
   Utiliser (Fabrique => F_2);

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
