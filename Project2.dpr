program Project2;

uses
  Vcl.Forms,
  UnitLogin in 'UnitLogin.pas' {FormLogin},
  UnitMain in 'UnitMain.pas' {FormMain},
  UnitPenanganan in 'UnitPenanganan.pas' {FormPenanganan},
  UnitUser in 'UnitUser.pas' {FormUser},
  UnitPerangkat in 'UnitPerangkat.pas' {FormPerangkat},
  UnitLog in 'UnitLog.pas' {FormLog},
  UnitDataModule in 'UnitDataModule.pas' {DataModule1: TDataModule},
  UnitTambahDesa in 'UnitTambahDesa.pas' {FormTambahDesa},
  UnitTambahKecamatan in 'UnitTambahKecamatan.pas' {FormTambahKecamatan},
  UnitTambahLokasi in 'UnitTambahLokasi.pas' {FormTambahLokasi},
  UnitTambahStatus in 'UnitTambahStatus.pas' {FormTambahStatus},
  UnitTambahPerangkat in 'UnitTambahPerangkat.pas' {FormTambahPerangkat},
  UnitTambahJenisTempatIbadah in 'UnitTambahJenisTempatIbadah.pas' {FormTambahJenisTempatIbadah};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormPenanganan, FormPenanganan);
  Application.CreateForm(TFormUser, FormUser);
  Application.CreateForm(TFormPerangkat, FormPerangkat);
  Application.CreateForm(TFormLog, FormLog);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormTambahDesa, FormTambahDesa);
  Application.CreateForm(TFormTambahKecamatan, FormTambahKecamatan);
  Application.CreateForm(TFormTambahLokasi, FormTambahLokasi);
  Application.CreateForm(TFormTambahStatus, FormTambahStatus);
  Application.CreateForm(TFormTambahPerangkat, FormTambahPerangkat);
  Application.CreateForm(TFormTambahJenisTempatIbadah, FormTambahJenisTempatIbadah);
  Application.Run;
end.
