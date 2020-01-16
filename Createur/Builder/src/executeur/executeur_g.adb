with Ada.Text_IO;
with Ada.Directories;

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
         (W_W_IO_R.Standard_Error, "Usage : ");
      Ada.Text_IO.Put
         (
            Ada.Text_IO.Standard_Error,
            Ada.Directories.Base_Name
               (Ada.Command_Line.Command_Name)
         );
      W_W_IO_R.Put_Line
         (W_W_IO_R.Standard_Error, " [arguments]");
      W_W_IO_R.Put_Line
         (W_W_IO_R.Standard_Error, Indentation);
      --  W_W_IO_R.New_Line
      --     (W_W_IO_R.Standard_Error, 1);
   end Afficher_Aide;
   ---------------------------------------------------------------------------

   ---------------------------------------------------------------------------
   procedure Verifier_Nombre_D_Arguments is
   begin
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);

      if Nb_Args = 0 and then Nombre_D_Arguments_Min > 0 then
         Afficher_Aide;
         raise Pas_Assez_D_Arguments_E;

      elsif Nb_Args > Nombre_D_Arguments_Max then
         Afficher_Aide;
         W_W_IO_R.Put
            (W_W_IO_R.Standard_Error, "Trop d'arguments. ");
         W_W_IO_R.Put_Line
            (
               W_W_IO_R.Standard_Error,
               "Les arguments suivants sont invalide : "
            );
         for I in Arguments_En_Trop_T loop
            Ada.Text_IO.Put
               (Ada.Text_IO.Standard_Error, "  - ");
            Ada.Text_IO.Put_Line
               (
                  Ada.Text_IO.Standard_Error,
                  Ada.Command_Line.Argument (I)
               );
         end loop;
         Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
         raise Trop_D_Arguments_E;

      elsif Nb_Args < Nombre_D_Arguments_Min then
         Afficher_Aide;
         W_W_IO_R.Put_Line
            (
               W_W_IO_R.Standard_Error,
               "Vous devez donner au moins le [argument]."
            );
         Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
         raise Pas_Assez_D_Arguments_E;

      end if;
   end Verifier_Nombre_D_Arguments;
   ---------------------------------------------------------------------------

end Executeur_G;
