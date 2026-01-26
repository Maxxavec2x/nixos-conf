# Conf nécessaire à mettre les applis en mode sombre
# OUI je fais un fichier a part juste pour ça
# parce que sinon je vais péter un cable

# gtk
{pkgs, ...}:

{
programs.dconf.profiles.user.databases = [{
  settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
}];

# kde
environment.variables = {
  QT_QPA_PLATFORMTHEME = "kde";
  KDE_COLOR_SCHEME = "BreezeDark";
};
}
