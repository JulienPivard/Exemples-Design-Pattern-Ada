with Visiteur_P;

package body Uml_P is

   ---------------------------------------------------------------------------
   procedure Visiter
      (
         This        : in out Element_Nomme_T;
         Le_Visiteur : in out Visiteur_P.Visiteur_T'Class
      )
   is
   begin
      Le_Visiteur.Visiter_Element_Nomme (This);
   end Visiter;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Visiter
      (
         This        : in out CClass_T;
         Le_Visiteur : in out Visiteur_P.Visiteur_T'Class
      )
   is
   begin
      Le_Visiteur.Visiter_CClass (This);
   end Visiter;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Visiter
      (
         This        : in out PPackage_T;
         Le_Visiteur : in out Visiteur_P.Visiteur_T'Class
      )
   is
   begin
      Le_Visiteur.Visiter_PPackage (This);
   end Visiter;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Visiter
      (
         This        : in out Operation_T;
         Le_Visiteur : in out Visiteur_P.Visiteur_T'Class
      )
   is
   begin
      Le_Visiteur.Visiter_Operation (This);
   end Visiter;
   ---------------------------------------------------------------------------

end Uml_P;
