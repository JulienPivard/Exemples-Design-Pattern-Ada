with Ada.Wide_Wide_Text_IO.Wide_Wide_Unbounded_IO;

package body Produit_Html_P is

   package Contenu_IO renames Ada.Wide_Wide_Text_IO.Wide_Wide_Unbounded_IO;

   ---------------------------------------------------------------------------
   function Creer_Produit_Html
      return T_Texte_Html
   is
      T : T_Texte_Html;
   begin
      T.Contenu := Contenu_P.To_Unbounded_Wide_Wide_String ("");
      return T;
   end Creer_Produit_Html;

   ---------------------------------------------------------------------------
   procedure Ajouter_Texte
      (
         Texte : in out T_Texte_Html;
         Contenu : in Contenu_P.Unbounded_Wide_Wide_String
      )
   is
   begin
      Contenu_P.Append (Texte.Contenu, Contenu);
   end Ajouter_Texte;

   ---------------------------------------------------------------------------
   procedure Commencer_Titre (Texte : in out T_Texte_Html) is
      balise_debut : constant Contenu_P.Unbounded_Wide_Wide_String :=
         Contenu_P.To_Unbounded_Wide_Wide_String ("<h1>");
   begin
      Contenu_P.Append (Texte.Contenu, balise_debut);
   end Commencer_Titre;

   ---------------------------------------------------------------------------
   procedure Finir_Titre (Texte : in out T_Texte_Html) is
      balise_fin : constant Contenu_P.Unbounded_Wide_Wide_String :=
         Contenu_P.To_Unbounded_Wide_Wide_String ("</h1>");
   begin
      Contenu_P.Append (Texte.Contenu, balise_fin);
      Contenu_P.Append (Texte.Contenu, Wide_Wide_Character'Val (10));
   end Finir_Titre;

   ---------------------------------------------------------------------------
   procedure Commencer_Paragraphe (Texte : in out T_Texte_Html) is
      balise_debut : constant Contenu_P.Unbounded_Wide_Wide_String :=
         Contenu_P.To_Unbounded_Wide_Wide_String ("<p>");
   begin
      Contenu_P.Append (Texte.Contenu, balise_debut);
   end Commencer_Paragraphe;

   ---------------------------------------------------------------------------
   procedure Finir_Paragraphe (Texte : in out T_Texte_Html) is
      balise_fin : constant Contenu_P.Unbounded_Wide_Wide_String :=
         Contenu_P.To_Unbounded_Wide_Wide_String ("</p>");
   begin
      Contenu_P.Append (Texte.Contenu, balise_fin);
      Contenu_P.Append (Texte.Contenu, Wide_Wide_Character'Val (10));
   end Finir_Paragraphe;

   ---------------------------------------------------------------------------
   procedure Rendu (Texte : in T_Texte_Html) is
   begin
      Contenu_IO.Put_Line (Texte.Contenu);
   end Rendu;

end Produit_Html_P;
