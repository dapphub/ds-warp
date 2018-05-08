{ solidityPackage, dappsys }: solidityPackage {
  name = "ds-warp";
  deps = with dappsys; [ds-note ds-math];
  src = ./src;
}
