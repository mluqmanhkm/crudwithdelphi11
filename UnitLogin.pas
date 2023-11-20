unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, UnitMain;

type
  TFormLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure LoginClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses UnitDataModule;

procedure TFormLogin.Button1Click(Sender: TObject);
begin
Application.Terminate;
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

procedure TFormLogin.Button2Click(Sender: TObject);
var
  Username, Password: string;
  HakAkses: Integer;
begin

  Username := Edit1.Text;
  Password := Edit2.Text;

  DataModule1.ZQueryLogin.SQL.Text := 'SELECT * FROM akun WHERE username = :username AND password = :password';
  DataModule1.ZQueryLogin.Params.ParamByName('username').Value := Username;
  DataModule1.ZQueryLogin.Params.ParamByName('password').Value := Password;
  DataModule1.ZQueryLogin.Open;

  if not DataModule1.ZQueryLogin.Eof then
  begin
    HakAkses := DataModule1.ZQueryLogin.FieldByName('hak_akses').AsInteger;

    if (HakAkses = 1) then
    begin
      Hide;
      FormMain.Show;
      LogActivity('Melakukan Login', username);
//      ShowMessage('Selamat datang, Super User');
    end
    else if HakAkses = 2 then
    begin
      Hide;
      FormMain.Show;
      UnitMain.FormMain.MainMenu1.Items[3].Visible := False;
      UnitMain.FormMain.MainMenu1.Items[4].Visible := False;
      LogActivity('Melakukan Login', username);
//      ShowMessage('Selamat datang, Admin');
    end
    else
      ShowMessage('Hak akses tidak valid');
  end
  else
  begin
    ShowMessage('Username atau Password salah');
  end;

  DataModule1.ZQueryLogin.Close;
end;

procedure TFormLogin.CheckBox1Click(Sender: TObject);
begin
    if CheckBox1.Checked then
    Edit2.PasswordChar := #0 else
    Edit2.PasswordChar := '*';
end;

procedure TFormLogin.LoginClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

end.
