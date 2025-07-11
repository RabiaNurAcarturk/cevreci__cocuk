class GorevSayaci {
  static int tamamlananGorevSayisi = 0;

  static int get kazanilanRozetSayisi {
    if (tamamlananGorevSayisi >= 10) return 3;
    if (tamamlananGorevSayisi >= 5) return 2;
    if (tamamlananGorevSayisi >= 3) return 1;
    return 0;
  }
}
