with Ada.Strings.Wide_Wide_Unbounded;

package Produit_Html_P is

   package Contenu_P renames Ada.Strings.Wide_Wide_Unbounded;

   --  Permet de contenir du texte formaté en html.
   type T_Texte_Html is tagged private;

   --  Permet de créer un nouveau produit vide.
   function Creer_Produit_Html return T_Texte_Html;

   --  Ajoute du texte brut.
   procedure Ajouter_Texte
   (
      Texte : in out T_Texte_Html;
      Contenu : in Contenu_P.Unbounded_Wide_Wide_String
   );

   --  Ajout d'un début de titre.
   procedure Commencer_Titre (Texte : in out T_Texte_Html);

   --  Ajout d'une fin de titre.
   procedure Finir_Titre (Texte : in out T_Texte_Html);

   --  Ajout un début de paragraphe.
   procedure Commencer_Paragraphe (Texte : in out T_Texte_Html);

   --  Ajoute une fin de paragraphe.
   procedure Finir_Paragraphe (Texte : in out T_Texte_Html);

   --  Affiche le contenu formaté.
   procedure Rendu (Texte : in T_Texte_Html);

private

   type T_Texte_Html is tagged
      record
         Contenu : Contenu_P.Unbounded_Wide_Wide_String;
      end record;

end Produit_Html_P;
