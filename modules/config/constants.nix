{delib, ...}:
delib.module {
  name = "constants";

  options.constants = with delib; {
    username = readOnly (strOption "dami");
    userfullname = readOnly (strOption "Douglas Damiano");
    useremail = readOnly (strOption "contact@damidoug.dev");
  };
}
