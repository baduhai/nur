{ lib, stdenv, fetchFromGitLab, cmake, SDL2, curl, ffmpeg, pugixml, pkgconf, freetype, freeimage, alsa-lib }:

stdenv.mkDerivation rec{
  name = "emulationstation-de";
  version = "1.2.6";

  src = fetchFromGitLab {
    owner  = "es-de";
    repo   = "emulationstation-de";
    rev    = "${version}";
    sha256 = "BiQnHtcKheEhwp0KKy9BCDIuZuAjmS8tWNyNw4nl5Fk=";
  };

  patches = [ ./es_find_rules.patch ];

  buildInputs = [ SDL2 curl cmake ffmpeg pugixml pkgconf freetype freeimage alsa-lib ];

  meta = with lib; {
    description = "A frontend for browsing and launching games from your multi-platform game collection.";
    homepage    = "https://es-de.org/";
    license = licenses.mit;
    platforms   = lib.platforms.linux;
  };
}
