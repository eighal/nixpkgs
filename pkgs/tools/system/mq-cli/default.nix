{ fetchFromGitHub, lib, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "mq-cli";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner  = "aprilabank";
    repo   = "mq-cli";
    rev    = "v${version}";
    sha256 = "02z85waj5jc312biv2qhbgplsggxgjmfmyv9v8b1ky0iq1mpxjw7";
  };

  # Delete this on next update; see #79975 for details
  legacyCargoFetcher = true;

  cargoSha256 = "03ab6jbcgmbgg9hn7ihk8814sjwdmrr9p4xlll6nfdad4a7gq3yn";

  meta = with lib; {
    description      = "CLI tool to manage POSIX message queues";
    homepage         = "https://github.com/aprilabank/mq-cli";
    license          = licenses.mit;
    maintainers      = with maintainers; [ tazjin ];
    platforms        = platforms.linux;
    repositories.git = git://github.com/aprilabank/mq-cli.git;
  };
}
