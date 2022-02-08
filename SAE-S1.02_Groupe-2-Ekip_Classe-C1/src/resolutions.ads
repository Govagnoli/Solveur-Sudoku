with TAD_Coordonnee;   use TAD_Coordonnee;
with TAD_ensemble;     use TAD_ensemble;
with TAD_grilleSudoku; use TAD_grilleSudoku;

package resolutions is

   PLUS_DE_UN_CHIFFRE : exception;
   CASE_NON_VIDE : exception;
   ENSEMBLE_VIDE : exception;
   GRILLE_VIDE: exception;

   -- retourne VRAI si la valeur v peut rentrer dans la case c de la grille g
   -- et FAUX sinon
   -- nÃ©cessite la case c est vide
   -- lÃ¨ve l'exception CASE_NON_VIDE si la case n'est pas vide
   function estChiffrePlaceable
     (g : in Type_Grille; v : in Integer; c : in Type_Coordonnee)
      return Boolean;

   -- retourne VRAI si la valeur v peut rentrer dans la case c de la grille g
   -- et FAUX sinon
   -- nÃ©cessite la case c est vide
   -- lÃ¨ve l'exception CASE_NON_VIDE si la case n'est pas vide
   function estChiffreValable
     (g : in Type_Grille;
      v : in Integer;
      c : in Type_Coordonnee) return Boolean;

   -- retourne l'ensemble des valeurs possibles pour la case c de la grille g
   -- necessite que la case c soit vide
   -- lÃ¨ve l'exception CASE_NON_VIDE si la case Ã©tudiÃ©e n'est pas vide
   function obtenirSolutionsPossibles
     (g : in Type_Grille;
      c : in Type_Coordonnee) return Type_Ensemble;

   -- retourne la valeur unique de v dans le tableau resultats
   -- nÃ©cessite qu'il n'y ait qu'un seul chiffre dans resultats
   -- lÃ¨ve l'exception PLUS_DE_UN_CHIFFRE s'il y a plus d'un chiffre dans resultats
   -- lÃ¨ve l'exception ENSEMBLE_VIDE si rÃ©sultat est vide
   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer;

   -- permet d'obtentir le nombre de solutions possbles d'une grille g pour une case c donnée
   -- Necessite que la case c soit vide
   -- leve l'exception CASE_NON_VIDE si la case etudie n'est pas vide
   function masseCase
     (g : in Type_Grille; c : in Type_Coordonnee) return Integer;

   -- retourne les coordonnees de Type_Coordonnee de la premiere case avec le moins de solution possible d'une grille g
   function trouverCaseLegere (g : in Type_Grille) return Type_Coordonnee;

   -- si la solution a ete trouve pour la grille g, alors Trouve est VRAI et
   -- la grille est complete
   -- sinon Trouve est a FAUX et la grille n'a aucune valeur significative
   -- parcours la grille
   -- Necessite que la grille g soit valide
   -- Leve GRILLE_INVALIDE, si la grille est insoluble
   procedure resoudreSudoku
     (g      : in out Type_Grille;
      trouve :    out Boolean ;
      cpt : in out Integer);


end resolutions;
