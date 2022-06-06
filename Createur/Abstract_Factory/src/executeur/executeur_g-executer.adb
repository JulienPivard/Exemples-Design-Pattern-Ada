with Ada.Text_IO;

with Fabrique_P;
with Fabrique_P.Markdown_P;
with Fabrique_P.Html_P;
with Produit_A_P;
with Produit_B_P;

separate (Executeur_G)
procedure Executer
   --  (Arguments)
is
   ---------------------------------------------------------------------------
   procedure Construire
      (
         Fabrique : in Fabrique_P.Fabrique_T'Class;
         Titre    : in String
      );
   --  Construit les produits à partir de la fabrique.
   --  @param Fabrique
   --  La fabrique.
   --  @param Titre
   --  Le titre à afficher.

   --------------------
   procedure Construire
      (
         Fabrique : in Fabrique_P.Fabrique_T'Class;
         Titre    : in String
      )
   is
      Produit_A : constant Produit_A_P.Produit_T'Class :=
         Fabrique.Creer_Produit_A;
      Produit_B : constant Produit_B_P.Produit_T'Class :=
         Fabrique.Creer_Produit_B;
   begin
      Ada.Text_IO.Put_Line (Item    => Titre);
      Ada.Text_IO.New_Line (Spacing => 1);
      Produit_A.Annonce;
      Produit_B.Presente;
   end Construire;
   ---------------------------------------------------------------------------

   package Fab_1_R renames Fabrique_P.Markdown_P;
   package Fab_2_R renames Fabrique_P.Html_P;

   Fabrique_1 : Fab_1_R.Fabrique_Markdown_T;
   Fabrique_2 : Fab_2_R.Fabrique_Html_T;
begin
   Ada.Text_IO.Put_Line (Item => "Démonstration du design pattern fabrique");
   Ada.Text_IO.Put_Line (Item => "abstraite.");
   Ada.Text_IO.Put_Line (Item => "Fabrique des familles d'objets");
   Ada.Text_IO.New_Line (Spacing => 1);

   Ada.Text_IO.Put_Line (Item => "----------------------------");
   Construire (Fabrique => Fabrique_1, Titre => "En markdown : ");

   Ada.Text_IO.Put_Line (Item => "----------------------------");

   Construire (Fabrique => Fabrique_2, Titre => "En html : ");
   Ada.Text_IO.Put_Line (Item => "----------------------------");
end Executer;
