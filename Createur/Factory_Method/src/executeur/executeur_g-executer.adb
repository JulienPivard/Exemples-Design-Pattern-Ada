with Ada.Text_IO;

with Produit_P;
with Fabrique_P.Concret_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   F : Fabrique_P.Concret_P.Concret_T;
   P : Produit_P.Produit_T'Class := F.Fabriquer;
begin
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern Fabrique");
   Ada.Text_IO.Put_Line (Item => "Fabrique un produit.");
   Ada.Text_IO.Put_Line (Item => "------------------------------------------");
   Ada.Text_IO.New_Line (Spacing => 1);

   P.Creer_Produit;
   P.Afficher;

   Ada.Text_IO.New_Line (Spacing => 2);
end Executer;
