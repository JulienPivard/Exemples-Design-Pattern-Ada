package body Visiteur_P is

   ---------------------------------------------------------------------------
   procedure Visiter_Element_Nomme
      (
         This : in out Visiteur_T;
         Obj  : in out Uml_P.Element_Nomme_T'Class
      )
   is
   begin
      null;
   end Visiter_Element_Nomme;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Visiter_Code_Class
      (
         This : in out Visiteur_T;
         Obj  : in out Uml_P.Code_Class_T'Class
      )
   is
   begin
      This.Visiter_Element_Nomme (Obj => Obj);
   end Visiter_Code_Class;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Visiter_Verif_Package
      (
         This : in out Visiteur_T;
         Obj  : in out Uml_P.Verif_Package_T'Class
      )
   is
   begin
      This.Visiter_Element_Nomme (Obj => Obj);
   end Visiter_Verif_Package;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Visiter_Operation
      (
         This : in out Visiteur_T;
         Obj  : in out Uml_P.Operation_T'Class
      )
   is
   begin
      This.Visiter_Element_Nomme (Obj => Obj);
   end Visiter_Operation;
   ---------------------------------------------------------------------------

end Visiteur_P;
