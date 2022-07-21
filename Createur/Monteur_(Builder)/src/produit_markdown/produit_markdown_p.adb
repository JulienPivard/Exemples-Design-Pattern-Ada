with Ada.Wide_Wide_Text_IO.Wide_Wide_Unbounded_IO;

package body Produit_Markdown_P is

   package Contenu_IO_R renames Ada.Wide_Wide_Text_IO.Wide_Wide_Unbounded_IO;

   ---------------------------------------------------------------------------
   function Creer_Produit_Markdown
      return Texte_Markdown_T
   is
      T : Texte_Markdown_T;
   begin
      T.Contenu := Contenu_R.To_Unbounded_Wide_Wide_String (Source => "");
      return T;
   end Creer_Produit_Markdown;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Ajouter_Texte
      (
         Texte   : in out Texte_Markdown_T;
         Contenu : in     Wide_Wide_String
      )
   is
   begin
      Contenu_R.Append
         (
            Source   => Texte.Contenu,
            New_Item =>
               Contenu_R.To_Unbounded_Wide_Wide_String (Source => Contenu)
         );
   end Ajouter_Texte;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Commencer_Titre
      (Texte : in out Texte_Markdown_T)
   is
   begin
      Contenu_R.Append
         (
            Source   => Texte.Contenu,
            New_Item => "# "
         );
   end Commencer_Titre;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Finir_Titre
      (Texte : in out Texte_Markdown_T)
   is
   begin
      Contenu_R.Append
         (
            Source   => Texte.Contenu,
            New_Item => Wide_Wide_Character'Val (10)
         );
      Contenu_R.Append
         (
            Source   => Texte.Contenu,
            New_Item => Wide_Wide_Character'Val (10)
         );
   end Finir_Titre;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Commencer_Paragraphe
      (Texte : in out Texte_Markdown_T)
   is
      pragma Unreferenced (Texte);
   begin
      null;
   end Commencer_Paragraphe;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Finir_Paragraphe
      (Texte : in out Texte_Markdown_T)
   is
   begin
      Contenu_R.Append
         (
            Source   => Texte.Contenu,
            New_Item => Wide_Wide_Character'Val (10)
         );
      Contenu_R.Append
         (
            Source   => Texte.Contenu,
            New_Item => Wide_Wide_Character'Val (10)
         );
   end Finir_Paragraphe;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Rendu
      (Texte : in Texte_Markdown_T)
   is
   begin
      Contenu_IO_R.Put_Line (Item => Texte.Contenu);
   end Rendu;
   ---------------------------------------------------------------------------

end Produit_Markdown_P;
