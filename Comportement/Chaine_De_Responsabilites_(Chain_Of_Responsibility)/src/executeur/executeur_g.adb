with Ada.Directories;
with Ada.Text_IO;

package body Executeur_G is

   ---------------------------------------------------------------------------
   procedure Executer
      --  (Arguments)
   is separate;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Afficher_Aide is
      Indentation : constant Wide_Wide_String := "        ";
   begin
      W_W_IO_R.Put
         (File => W_W_IO_R.Standard_Error, Item => "Usage : ");
      Ada.Text_IO.Put
         (
            File => Ada.Text_IO.Standard_Error,
            Item => Ada.Directories.Base_Name
               (Name => Ada.Command_Line.Command_Name)
         );
      W_W_IO_R.Put_Line
         (File => W_W_IO_R.Standard_Error, Item => " [arguments]");
      W_W_IO_R.Put_Line
         (File => W_W_IO_R.Standard_Error, Item => Indentation);
      --  W_W_IO_R.New_Line
      --     (File => W_W_IO_R.Standard_Error, Spacing => 1);
   end Afficher_Aide;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   function Verifier_Nombre_D_Arguments_Est_Valide
      return Boolean
   is
      subtype Intervale_Valide_T is NB_Args_T range
         Nombre_D_Arguments_Min .. Nombre_D_Arguments_Max;

      pragma Annotate
         (
            gnatcheck,
            Exempt_On,
            "Membership_Tests",
            "Test d'un intervalle, plus lisible."
         );
      Resultat : Boolean := NB_Args in Intervale_Valide_T;
      pragma Annotate
         (
            gnatcheck,
            Exempt_Off,
            "Membership_Tests"
         );
   begin
      Ada.Command_Line.Set_Exit_Status (Code => Ada.Command_Line.Success);

      if NB_Args = 0 and then Nombre_D_Arguments_Min > 0 then
         Afficher_Aide;
         Resultat := False;

      elsif NB_Args > Nombre_D_Arguments_Max then
         Afficher_Aide;
         W_W_IO_R.Put
            (File => W_W_IO_R.Standard_Error, Item => "Trop d'arguments. ");
         W_W_IO_R.Put_Line
            (
               File => W_W_IO_R.Standard_Error,
               Item => "Les arguments suivants sont invalide : "
            );
         Bloc_Afficher_Arguments_En_Trop :
         declare
            subtype Arguments_En_Trop_T is NB_Args_T range
               NB_Args_Max + 1 .. NB_Args;
            --  L'intervalle des arguments en trop.
         begin
            for I in Arguments_En_Trop_T loop
               Ada.Text_IO.Put
                  (File => Ada.Text_IO.Standard_Error, Item => "  - ");
               pragma Annotate
                  (
                     gnatcheck,
                     Exempt_On,
                     "Predefined_Numeric_Types",
                     "impossible de ne pas convertir I en Natural"
                  );
               Ada.Text_IO.Put_Line
                  (
                     File => Ada.Text_IO.Standard_Error,
                     Item => Ada.Command_Line.Argument (Number => Natural (I))
                  );
               pragma Annotate
                  (
                     gnatcheck,
                     Exempt_Off,
                     "Predefined_Numeric_Types"
                  );
            end loop;
         end Bloc_Afficher_Arguments_En_Trop;

         Ada.Command_Line.Set_Exit_Status (Code => Ada.Command_Line.Failure);
         Resultat := False;

      elsif NB_Args < Nombre_D_Arguments_Min then
         Afficher_Aide;
         W_W_IO_R.Put_Line
            (
               File => W_W_IO_R.Standard_Error,
               Item => "Vous devez donner au moins le [argument]."
            );
         Ada.Command_Line.Set_Exit_Status (Code => Ada.Command_Line.Failure);
         Resultat := False;

      else
         Resultat := True;
      end if;

      return Resultat;
   end Verifier_Nombre_D_Arguments_Est_Valide;
   ---------------------------------------------------------------------------

end Executeur_G;
