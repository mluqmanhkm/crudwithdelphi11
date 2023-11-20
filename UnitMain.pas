unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls, UnitUser, UnitPerangkat,
  UnitPenanganan, UnitLog, UnitTambahDesa, UnitTambahKecamatan, UnitTambahLokasi, UnitTambahStatus, UnitTambahPerangkat, UnitTambahJenisTempatIbadah;

type
  TFormMain = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    PerangkatSirine1: TMenuItem;
    DataPerangkat1: TMenuItem;
    Label1: TLabel;
    DataPenanganan1: TMenuItem;
    DataPenanganan2: TMenuItem;
    LogAktivitas1: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    BtOn: TButton;
    BtOff: TButton;
    BtTest: TButton;
    BtSirine: TButton;
    ambahData1: TMenuItem;
    ambahStatus1: TMenuItem;
    ambahDesa1: TMenuItem;
    ambahKecamatan1: TMenuItem;
    ambahKecamatan2: TMenuItem;
    ambahPerangkat1: TMenuItem;
    Keluar1: TMenuItem;
    ambahJenisTempatIbadah1: TMenuItem;
    procedure MainClose(Sender: TObject; var Action: TCloseAction);
    procedure PerangkatSirine1Click(Sender: TObject);
    procedure DataPenanganan2Click(Sender: TObject);
    procedure DataPerangkat1Click(Sender: TObject);
    procedure DataPenanganan1Click(Sender: TObject);
    procedure LogAktivitas1Click(Sender: TObject);
    procedure BtOnClick(Sender: TObject);
    procedure BtOffClick(Sender: TObject);
    procedure BtTestClick(Sender: TObject);
    procedure BtSirineClick(Sender: TObject);
    procedure ambahStatus1Click(Sender: TObject);
    procedure ambahDesa1Click(Sender: TObject);
    procedure ambahKecamatan1Click(Sender: TObject);
    procedure ambahKecamatan2Click(Sender: TObject);
    procedure ambahPerangkat1Click(Sender: TObject);
    procedure Keluar1Click(Sender: TObject);
    procedure ambahJenisTempatIbadah1Click(Sender: TObject);
    procedure ambahData1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure User;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses UnitDataModule, UnitLogin;

procedure TFormMain.ambahData1Click(Sender: TObject);
begin
  ambahData1.Default := true;
end;

procedure TFormMain.ambahDesa1Click(Sender: TObject);
begin
  FormTambahKecamatan.ShowModal;
  ambahDesa1.Default := true;
end;

procedure TFormMain.ambahJenisTempatIbadah1Click(Sender: TObject);
begin
  FormTambahJenisTempatIbadah.ShowModal;
  ambahJenisTempatIbadah1.Default := true;
end;

procedure TFormMain.ambahKecamatan1Click(Sender: TObject);
begin
  FormTambahLokasi.Parent:=panel1;
  FormTambahLokasi.visible:=true;
  FormUser.Close;
  FormPerangkat.Close;
  FormPenanganan.Close;
  FormLog.Close;
  FormTambahDesa.Close;
  FormTambahKecamatan.Close;
  FormTambahStatus.Close;
  FormTambahPerangkat.Close;

  ambahKecamatan1.Default := true;
  end;

procedure TFormMain.ambahKecamatan2Click(Sender: TObject);
begin
  FormTambahStatus.ShowModal;
  ambahKecamatan2.Default := true;
end;

procedure TFormMain.ambahPerangkat1Click(Sender: TObject);
begin
  FormTambahPerangkat.Parent:=panel1;
  FormTambahPerangkat.visible:=true;
  FormUser.Close;
  FormPerangkat.Close;
  FormPenanganan.Close;
  FormLog.Close;
  FormTambahDesa.Close;
  FormTambahKecamatan.Close;
  FormTambahLokasi.Close;
  FormTambahStatus.Close;

  ambahPerangkat1.Default := true;
end;

procedure TFormMain.ambahStatus1Click(Sender: TObject);
begin
  FormTambahDesa.ShowModal;
  ambahStatus1.Default := true;
end;

procedure TFormMain.User;
begin
  Username := UnitLogin.FormLogin.Edit1.Text;
  Password := UnitLogin.FormLogin.Edit2.Text;

  DataModule1.ZQueryUser.SQL.Text := 'SELECT * FROM akun WHERE username = :username AND password = :password';
  DataModule1.ZQueryUser.Params.ParamByName('username').Value := Username;
  DataModule1.ZQueryUser.Params.ParamByName('password').Value := Password;
  DataModule1.ZQueryUser.Open;
end;

procedure LogActivity(aktivitas, admin: string);
begin
  DataModule1.ZQueryLog.SQL.Text := 'INSERT INTO log (aktivitas, tanggal, admin) VALUES (:aktivitas, :tanggal, :admin)';
  DataModule1.ZQueryLog.ParamByName('aktivitas').AsString := aktivitas;
  DataModule1.ZQueryLog.ParamByName('tanggal').AsDateTime := Now;
  DataModule1.ZQueryLog.ParamByName('admin').AsString := admin;
  DataModule1.ZQueryLog.ExecSQL;

  DataModule1.ZQueryLog.Close;
  DataModule1.ZQueryLog.SQL.Text := 'SELECT * FROM log';
  DataModule1.ZQueryLog.Open;
end;

procedure TFormMain.BtOffClick(Sender: TObject);
var
  Username, Password: string;
begin
if MessageDlg('Apakah Anda yakin ingin menonaktifkan semua perangkat SIRINE?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // Kode yang akan dijalankan jika tombol "Yes" ditekan
    User;
    LogActivity('Menonaktifkan Semua Perangkat SIRINE', username);
  end
  else
  begin
    // Kode yang akan dijalankan jika tombol "No" ditekan
  end;
end;

procedure TFormMain.BtOnClick(Sender: TObject);
var
  Username, Password: string;
begin

if MessageDlg('Apakah Anda yakin ingin mengaktifkan semua perangkat SIRINE?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // Kode yang akan dijalankan jika tombol "Yes" ditekan
    User;
    LogActivity('Mengaktifkan Semua Perangkat SIRINE', username);
  end
  else
  begin
    // Kode yang akan dijalankan jika tombol "No" ditekan
  end;
end;

procedure TFormMain.BtSirineClick(Sender: TObject);
var
  Username, Password: string;
begin
if MessageDlg('Apakah Anda yakin ingin membunyikan semua perangkat SIRINE?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // Kode yang akan dijalankan jika tombol "Yes" ditekan
    User;
    LogActivity('Membunyikan Semua Perangkat SIRINE', username);
  end
  else
  begin
    // Kode yang akan dijalankan jika tombol "No" ditekan
  end;
end;

procedure TFormMain.BtTestClick(Sender: TObject);
var
  Username, Password: string;
begin
if MessageDlg('Apakah Anda yakin ingin melakukan uji coba semua perangkat SIRINE?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // Kode yang akan dijalankan jika tombol "Yes" ditekan
    User;
    LogActivity('Melakukan Uji Coba Semua Perangkat SIRINE', username);
  end
  else
  begin
    // Kode yang akan dijalankan jika tombol "No" ditekan
  end;
end;

procedure TFormMain.DataPenanganan1Click(Sender: TObject);
begin
FormPenanganan.Parent:=panel1;
FormPenanganan.visible:=true;
FormUser.Close;
FormPerangkat.Close;
FormLog.Close;
FormTambahDesa.Close;
FormTambahKecamatan.Close;
FormTambahLokasi.Close;
FormTambahStatus.Close;
FormTambahPerangkat.Close;

DataPenanganan1.Default := true;
end;

procedure TFormMain.DataPenanganan2Click(Sender: TObject);
begin
FormUser.Parent:=panel1;
FormUser.visible:=true;
FormPerangkat.Close;
FormPenanganan.Close;
FormLog.Close;
FormTambahDesa.Close;
FormTambahKecamatan.Close;
FormTambahLokasi.Close;
FormTambahStatus.Close;
FormTambahPerangkat.Close;

DataPenanganan2.Default := true;
end;

procedure TFormMain.DataPerangkat1Click(Sender: TObject);
begin
FormPerangkat.Parent:=panel1;
FormPerangkat.visible:=true;
FormUser.Close;
FormPenanganan.Close;
FormLog.Close;
FormTambahDesa.Close;
FormTambahKecamatan.Close;
FormTambahLokasi.Close;
FormTambahStatus.Close;
FormTambahPerangkat.Close;

DataPerangkat1.Default := true;
end;

procedure TFormMain.Keluar1Click(Sender: TObject);
begin
if MessageDlg('Apakah Anda yakin ingin keluar aplikasi?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Application.Terminate;

    User;
    LogActivity('Keluar Aplikasi ', username);
  end

end;

procedure TFormMain.LogAktivitas1Click(Sender: TObject);
begin
FormLog.Parent:=panel1;
Formlog.visible:=true;
FormUser.Close;
FormPerangkat.Close;
FormPenanganan.Close;
FormTambahDesa.Close;
FormTambahKecamatan.Close;
FormTambahLokasi.Close;
FormTambahStatus.Close;
FormTambahPerangkat.Close;

LogAktivitas1.Default := true;
end;

procedure TFormMain.MainClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;

  User;
  LogActivity('Keluar Aplikasi ', username);
end;

procedure TFormMain.PerangkatSirine1Click(Sender: TObject);
begin
FormUser.Close;
FormPerangkat.Close;
FormPenanganan.Close;
FormLog.Close;
FormTambahDesa.Close;
FormTambahKecamatan.Close;
FormTambahLokasi.Close;
FormTambahStatus.Close;
FormTambahPerangkat.Close;

PerangkatSirine1.Default := true;
end;

end.
