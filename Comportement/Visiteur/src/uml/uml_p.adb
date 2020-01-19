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
      Le_Visiteur.Visiter_Element_Nomme (Obj => This);
   end Visiter;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Visiter
      (
         This        : in out Code_Class_T;
         Le_Visiteur : in out Visiteur_P.Visiteur_T'Class
      )
   is
   begin
      Le_Visiteur.Visiter_Code_Class (Obj => This);
   end Visiter;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   overriding
   procedure Visiter
      (
         This        : in out Verif_Package_T;
         Le_Visiteur : in out Visiteur_P.Visiteur_T'Class
      )
   is
   begin
      Le_Visiteur.Visiter_Verif_Package (Obj => This);
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
      Le_Visiteur.Visiter_Operation (Obj => This);
   end Visiter;
   ---------------------------------------------------------------------------

end Uml_P;
