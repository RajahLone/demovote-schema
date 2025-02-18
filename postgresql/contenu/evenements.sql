INSERT INTO vote.evenements (numero_evenement, libelle, lien, nom, numero_parent, numero_niveau, numero_ordre, script)
VALUES
	(1,  '<i class=\"fas fa-home\"></i>&nbsp;Accueil',                     '../servlet/menu?ttt=10100',  'Accueil',  0, 1, 100, null),
	(3,  '<i class=\"fas fa-id-card-alt\"></i>&nbsp;Données personnelles', '../servlet/appli?ttt=10760', 'Données personnelles', 0, 1, 10000, null),
	(4,  '<i class=\"fas fa-sign-out-alt\"></i>&nbsp;Se déconnecter',      '../servlet/acces?ttt=10002', 'Quitter', 0, 1, 99999, null),
	(6,  '<i class=\"fas fa-cogs\"></i>&nbsp;Paramétrages',                'javascript:bascule(6);',     'Paramétrages', 0, 1, 9000, null),
	(7,  '<i class=\"fas fa-sliders-h\"></i>&nbsp;Environnement',          '../servlet/appli?ttt=10703', 'Paramétrages > Variables', 6, 2, 9100, null),
	(9,  '<i class=\"fas fa-users\"></i>&nbsp;Participants',               '../servlet/appli?ttt=10740', 'Participants', 0, 1, 8000, null),
	(10, '<i class=\"fas fa-shield-alt\"></i>&nbsp;Privilèges',            '../servlet/appli?ttt=10750', 'Paramétrages > Privilèges', 6, 2, 9300, null),
	(11, '<i class=\"fas fa-users-cog\"></i>&nbsp;Rôles',                  '../servlet/appli?ttt=10730', 'Paramétrages > Rôles', 6, 2, 9200, null),
	(12, '<i class=\"fas fa-save\"></i>&nbsp;Productions',                 '../servlet/prod?ttt=10610',  'Productions', 0, 1, 3000, null),
	(13, '<i class=\"fas fa-layer-group\"></i>&nbsp;Catégories',           '../servlet/compo?ttt=10710', 'Catégories', 0, 1, 4000, null),
	(14, '<i class=\"fas fa-vote-yea\"></i>&nbsp;Voter',                   '../servlet/vote?ttt=10810',  'Voter', 0, 1, 5000, null),
	(15, '<i class=\"fas fa-trophy\"></i>&nbsp;Résultats',                 '../servlet/stat?ttt=10930',  'Résultats', 0, 1, 6000, null),
	(16, '<i class=\"fas fa-comments\"></i>&nbsp;Messagerie',              '../servlet/chat?ttt=11100',  'Messagerie',  0, 1, 500, 'var am=document.getElementById(''alert_msg'');if (am!=null) {am.classList.remove(''faa-flash'');am.classList.remove(''animated'');}return true;'),
	(17, '<i class=\"fas fa-clock\"></i>&nbsp;Planning',                   '../servlet/menu?ttt=10103',  'Planning', 0, 1, 400, null),
	(18, '<i class=\"fas fa-eye\"></i>&nbsp;Caméras',                      '../servlet/menu?ttt=10106',  'Caméras', 0, 1, 300, null);
