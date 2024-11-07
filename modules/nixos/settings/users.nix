{
  config,
  pkgs,
  username,
  ...
}: {
  config = {
    ## Users
    users.users.${username} = {
      isNormalUser = true;
      description = "Sonjiku";
      extraGroups = ["wheel" "networkmanager" "video" "audio" "lp"];
      # packages = with pkgs; [
      # ];
    };
  };
}
