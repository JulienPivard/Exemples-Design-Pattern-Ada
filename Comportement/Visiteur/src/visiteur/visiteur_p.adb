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
   procedure Visiter_CClass
      (
         This : in out Visiteur_T;
         Obj  : in out Uml_P.CClass_T'Class
      )
   is
   begin
      This.Visiter_Element_Nomme (Obj);
   end Visiter_CClass;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Visiter_PPackage
      (
         This : in out Visiteur_T;
         Obj  : in out Uml_P.PPackage_T'Class
      )
   is
   begin
      This.Visiter_Element_Nomme (Obj);
   end Visiter_PPackage;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Visiter_Operation
      (
         This : in out Visiteur_T;
         Obj  : in out Uml_P.Operation_T'Class
      )
   is
   begin
      This.Visiter_Element_Nomme (Obj);
   end Visiter_Operation;
   ---------------------------------------------------------------------------

end Visiteur_P;
