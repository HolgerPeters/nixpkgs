{ lib, fetchFromGitHub, buildGoModule }:
buildGoModule rec {
  pname = "terraform-provider-elasticsearch";
  version = "0.7.0";

  src = fetchFromGitHub {
    owner = "phillbaker";
    repo = "terraform-provider-elasticsearch";
    rev = "v${version}";
    sha256 = "0ci9gcn9ijdbx25wa99iy0b3sl7akqa7b6gi9wnnl1dawpqznj7v";
  };

  vendorSha256 = "1rdvyypdl3fk6af66gfjhyl271cnlx5xgrl1w68sc6sbvq00bqkd";

  doCheck = false;

  subPackages = [ "." ];

  # Terraform allow checking the provider versions, but this breaks
  # if the versions are not provided via file paths.
  postInstall = "mv $out/bin/terraform-provider-elasticsearch{,_v${version}}";

  meta = with lib; {
    description = "Terraform provider for elasticsearch";
    homepage = "https://github.com/phillbaker/terraform-provider-elasticsearch";
    license = licenses.mpl20;
    maintainers = with maintainers; [ basvandijk ];
  };
}
