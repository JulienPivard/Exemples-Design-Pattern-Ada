private with Ada.Strings.Wide_Wide_Unbounded;

--  @summary
--  Un produit au format HTML.
--  @description
--  Un produit au format HTML.
--  @group Produits
package Produit_Html_P is

   type Texte_Html_T is tagged private;
   --  Permet de contenir du texte formaté en html.

   function Creer_Produit_Html
      return Texte_Html_T;
   --  Permet de créer un nouveau produit vide.
   --  @return Un html vide.

   procedure Ajouter_Texte
      (
         Texte   : in out Texte_Html_T;
         Contenu : in     Wide_Wide_String
      );
   --  Ajoute du texte brut.
   --  @param Texte
   --  Le html en cours.
   --  @param Contenu
   --  Le contenu à ajouter.

   procedure Commencer_Titre
      (Texte : in out Texte_Html_T);
   --  Ajout d'un début de titre.
   --  @param Texte
   --  Le html en cours.

   procedure Finir_Titre
      (Texte : in out Texte_Html_T);
   --  Ajout d'une fin de titre.
   --  @param Texte
   --  Le html en cours.

   procedure Commencer_Paragraphe
      (Texte : in out Texte_Html_T);
   --  Ajout un début de paragraphe.
   --  @param Texte
   --  Le html en cours.

   procedure Finir_Paragraphe
      (Texte : in out Texte_Html_T);
   --  Ajoute une fin de paragraphe.
   --  @param Texte
   --  Le html en cours.

   procedure Rendu
      (Texte : in Texte_Html_T);
   --  Affiche le contenu formaté.
   --  @param Texte
   --  Le html en cours.

private

   package Contenu_R renames Ada.Strings.Wide_Wide_Unbounded;

   type Texte_Html_T is tagged
      record
         Contenu : Contenu_R.Unbounded_Wide_Wide_String;
      end record;

end Produit_Html_P;
