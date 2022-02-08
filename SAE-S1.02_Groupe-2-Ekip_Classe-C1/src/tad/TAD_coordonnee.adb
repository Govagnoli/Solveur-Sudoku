package body TAD_Coordonnee is

    ---------------------------
    -- construireCoordonnees --
    ---------------------------
    function construireCoordonnees
       (ligne : Integer; colonne : Integer) return Type_Coordonnee
    is
        c : Type_Coordonnee;
    begin
        c.ligne   := ligne;
        c.colonne := colonne;
        return c;
    end construireCoordonnees;

    ------------------
    -- obtenirLigne --
    ------------------
    function obtenirLigne (c : Type_Coordonnee) return Integer is
    begin
        return c.ligne;
    end obtenirLigne;

    --------------------
    -- obtenirColonne --
    --------------------
    function obtenirColonne (c : Type_Coordonnee) return Integer is
    begin
        return c.colonne;
    end obtenirColonne;

    ------------------
    -- obtenirCarre --
    ------------------
    function obtenirCarre (c : Type_Coordonnee) return Integer is
    begin
        return (3 * ((c.ligne - 1) / 3)) + ((c.colonne - 1) / 3 + 1);
    end obtenirCarre;

    ----------------------------
    -- obtenirCoordonneeCarre --
    ----------------------------
    function obtenirCoordonneeCarre (numCarre : Integer) return Type_Coordonnee
    is
        c : Type_Coordonnee;
    begin
        case numCarre is
            when 1 =>
                c.ligne   := 1;
                c.colonne := 1;
            when 2 =>
                c.ligne   := 1;
                c.colonne := 4;
            when 3 =>
                c.ligne   := 1;
                c.colonne := 7;
            when 4 =>
                c.ligne   := 4;
                c.colonne := 1;
            when 5 =>
                c.ligne   := 4;
                c.colonne := 4;
            when 6 =>
                c.ligne   := 4;
                c.colonne := 7;
            when 7 =>
                c.ligne   := 7;
                c.colonne := 1;
            when 8 =>
                c.ligne   := 7;
                c.colonne := 4;
            when 9 =>
                c.ligne   := 7;
                c.colonne := 7;
            when others =>
                raise INDEX_CARRE_INVALIDE;
        end case;
        return c;
    end obtenirCoordonneeCarre;

end TAD_Coordonnee;
