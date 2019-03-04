with Ada.Wide_Wide_Text_IO.Wide_Wide_Unbounded_IO;

package body Produit_Html_P is

   package Contenu_IO_R renames Ada.Wide_Wide_Text_IO.Wide_Wide_Unbounded_IO;

   ---------------------------------------------------------------------------
   function Creer_Produit_Html
      return Texte_Html_T
   is
      T : Texte_Html_T;
   begin
      T.Contenu := Contenu_R.To_Unbounded_Wide_Wide_String ("");
      return T;
   end Creer_Produit_Html;

   ---------------------------------------------------------------------------
   procedure Ajouter_Texte
      (
         Texte : in out Texte_Html_T;
         Contenu : in Contenu_R.Unbounded_Wide_Wide_String
      )
   is
   begin
      Contenu_R.Append (Texte.Contenu, Contenu);
   end Ajouter_Texte;

   ---------------------------------------------------------------------------
   procedure Commencer_Titre
      (Texte : in out Texte_Html_T)
   is
      Balise_Debut : constant Contenu_R.Unbounded_Wide_Wide_String :=
         Contenu_R.To_Unbounded_Wide_Wide_String ("<h1>");
   begin
      Contenu_R.Append (Texte.Contenu, Balise_Debut);
   end Commencer_Titre;

   ---------------------------------------------------------------------------
   procedure Finir_Titre
      (Texte : in out Texte_Html_T)
   is
      Balise_Fin : constant Contenu_R.Unbounded_Wide_Wide_String :=
         Contenu_R.To_Unbounded_Wide_Wide_String ("</h1>");
   begin
      Contenu_R.Append (Texte.Contenu, Balise_Fin);
      Contenu_R.Append (Texte.Contenu, Wide_Wide_Character'Val (10));
   end Finir_Titre;

   ---------------------------------------------------------------------------
   procedure Commencer_Paragraphe
      (Texte : in out Texte_Html_T)
   is
      Balise_Debut : constant Contenu_R.Unbounded_Wide_Wide_String :=
         Contenu_R.To_Unbounded_Wide_Wide_String ("<p>");
   begin
      Contenu_R.Append (Texte.Contenu, Balise_Debut);
   end Commencer_Paragraphe;

   ---------------------------------------------------------------------------
   procedure Finir_Paragraphe
      (Texte : in out Texte_Html_T)
   is
      Balise_Fin : constant Contenu_R.Unbounded_Wide_Wide_String :=
         Contenu_R.To_Unbounded_Wide_Wide_String ("</p>");
   begin
      Contenu_R.Append (Texte.Contenu, Balise_Fin);
      Contenu_R.Append (Texte.Contenu, Wide_Wide_Character'Val (10));
   end Finir_Paragraphe;

   ---------------------------------------------------------------------------
   procedure Rendu
      (Texte : in Texte_Html_T)
   is
   begin
      Contenu_IO_R.Put_Line (Texte.Contenu);
   end Rendu;

end Produit_Html_P;
