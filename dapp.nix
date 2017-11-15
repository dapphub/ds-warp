dapp: with dapp; solidityPackage {
  name = "ds-warp";
  deps = with dappsys; [ds-note ds-test];
  src = ./src;
}
