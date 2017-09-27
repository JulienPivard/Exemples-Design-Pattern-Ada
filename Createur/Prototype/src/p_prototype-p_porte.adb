package body P_Prototype.P_Porte is

    ---------------------------------------------------------------------------
    overriding
    function Clone (Porte : in T_Porte) return T_Porte is
        p : T_Porte;
    begin
        p.Age := Porte.Age;
        return p;
    end Clone;

    ---------------------------------------------------------------------------
    overriding
    function Est_Trop_Vieux (Porte : in T_Porte) return Boolean is
    begin
        return Porte.Age > 30;
    end Est_Trop_Vieux;

    ---------------------------------------------------------------------------
    overriding
    procedure Changer_Age (Porte : out T_Porte; Age : in Integer) is
    begin
        Porte.Age := Age;
    end Changer_Age;

    ---------------------------------------------------------------------------
    overriding
    function Lire_Age (Porte : in T_Porte) return Integer is
    begin
        return Porte.Age;
    end Lire_Age;

    ---------------------------------------------------------------------------
    procedure Creer_Porte (Porte : out T_Porte) is
    begin
        Porte.Age := 0;
    end Creer_Porte;

end P_Prototype.P_Porte;
