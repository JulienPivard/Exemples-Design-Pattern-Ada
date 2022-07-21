with Ada.Text_IO;

with GNAT.Source_Info;

package body Gestionnaire_P.Concret_2_P
   with Spark_Mode => Off
is

   ---------------------------------------------------------------------------
   function Creer
      (Action : in     Contexte_P.Action_T)
      return Gestionnaire_Concret_T
   is
   begin
      return R : Gestionnaire_Concret_T do
         R.Action := Action;
      end return;
   end Creer;
   ---------------------------------------------------------------------------

   subtype Action_T is Contexte_P.Action_T;

   ---------------------------------------------------------------------------
   overriding
   procedure Faire_Action
      (
         This     : in out Gestionnaire_Concret_T;
         Contexte : in     Contexte_P.Action_T
      )
   is
      use type Contexte_P.Action_T;
   begin
      Ada.Text_IO.Put_Line (Item => GNAT.Source_Info.Enclosing_Entity);
      if This.Action = Contexte then
         Ada.Text_IO.Put_Line (Item => Action_T'Image (This.Action));
      else
         Ada.Text_IO.Put_Line (Item => "Pas d'actions");
      end if;
   end Faire_Action;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   --                             Partie privée                             --
   ---------------------------------------------------------------------------

end Gestionnaire_P.Concret_2_P;
