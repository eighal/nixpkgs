{ stdenv, fetchFromGitHub
, libdrm, json_c
, meson, ninja, pkgconfig
}:

stdenv.mkDerivation rec {
  pname = "drm_info";
  version = "2.1.0";

  src = fetchFromGitHub {
    owner = "ascent12";
    repo = "drm_info";
    rev = "v${version}";
    sha256 = "1i5bzkgqxjjw34jpj1x1gfdl3sz0sl6i7s787a6mjjslsc5g422l";
  };

  nativeBuildInputs = [ meson ninja pkgconfig ];
  buildInputs = [ libdrm json_c ];

  meta = with stdenv.lib; {
    description = "Small utility to dump info about DRM devices.";
    homepage = "https://github.com/ascent12/drm_info";
    license = licenses.mit;
    maintainers = with maintainers; [ tadeokondrak ];
    platforms = platforms.linux;
  };
}
