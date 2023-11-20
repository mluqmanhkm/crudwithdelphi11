unit UnitPenanganan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFormPenanganan = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label6: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit3Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure User;
  end;

var
  FormPenanganan: TFormPenanganan;
  Username, Password: String;
  InsertedData : string;
  OldData : string;
  UpdatedData : string;
  DeletedData : string;

implementation

{$R *.dfm}

uses UnitDataModule, UnitLogin;

procedure TFormPenanganan.User;
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


procedure TFormPenanganan.Button1Click(Sender: TObject);
begin
if (edit1.Text <> '') and (DateTimePicker1.Date <> 0) and (Memo1.Lines.Count > 0) and (DateTimePicker2.Date <> 0) and (edit2.Text <> '') then
  begin
    try
      DataModule1.ZQueryPenanganan.SQL.Text := 'INSERT INTO penanganan (nama_perangkat, tanggal_kerusakan, kerusakan, tanggal_penanganan, teknisi) VALUES (:nama_perangkat, :tanggal_kerusakan, :kerusakan, :tanggal_penanganan, :teknisi)';
      DataModule1.ZQueryPenanganan.Params.ParamByName('nama_perangkat').Value := Edit1.Text;
      DataModule1.ZQueryPenanganan.Params.ParamByName('tanggal_kerusakan').Value := DateTimePicker1.DateTime;
      DataModule1.ZQueryPenanganan.Params.ParamByName('kerusakan').Value := Memo1.Lines.Text;
      DataModule1.ZQueryPenanganan.Params.ParamByName('tanggal_penanganan').Value := DateTimePicker1.DateTime;
      DataModule1.ZQueryPenanganan.Params.ParamByName('teknisi').Value := Edit2.Text;
      DataModule1.ZQueryPenanganan.ExecSQL;

      DataModule1.ZQueryPenanganan.Close;
      DataModule1.ZQueryPenanganan.SQL.Text := 'SELECT * FROM penanganan';
      DataModule1.ZQueryPenanganan.Open;

      Label8.Caption := IntToStr(DataModule1.ZQueryPenanganan.RecordCount);

      User;
      InsertedData := DataModule1.ZQueryPenanganan.FieldByName('nama_perangkat').AsString;
      LogActivity('Menambah data penanganan ' + InsertedData, username);

      ShowMessage('Data berhasil disimpan');
      Edit1.Clear;
      DateTimePicker1.DateTime := 0;
      Memo1.Clear;
      DateTimePicker2.DateTime := 0;
      Edit2.Clear;
      except
      on E: Exception do
        begin
          ShowMessage('Error: ' + E.Message);
        end;
    end;
  end
    else
    if edit1.Text = '' then
    begin
      Showmessage('nama perangkat masih kosong');
      edit1.SetFocus;
    end else
    if DateTimePicker1.DateTime = 0 then
    begin
      Showmessage('tanggal kerusakan masih kosong');
      DateTimePicker1.SetFocus;
    end else
    if Memo1.Lines.Count = 0 then
    begin
      Showmessage('kerusakan masih kosong');
      Memo1.SetFocus;
    end else
    if DateTimePicker2.DateTime = 0 then
    begin
      Showmessage('tanggal penanganan masih kosong');
      DateTimePicker2.SetFocus;
    end else
    if edit2.Text = '' then
    begin
      Showmessage('teknisi masih kosong');
      edit2.SetFocus;
    end;
end;

procedure TFormPenanganan.Button2Click(Sender: TObject);
begin
if (edit1.Text <> '') and (DateTimePicker1.Date <> 0) and (Memo1.Lines.Count > 0) and (DateTimePicker2.Date <> 0) and (edit2.Text <> '') then
  begin

    try
      var IDPenanganan: Integer := DataModule1.ZQueryPenanganan.FieldByName('id_penanganan').AsInteger;

      DataModule1.ZQueryPenanganan.SQL.Text := 'UPDATE penanganan SET nama_perangkat = :nama_perangkat, tanggal_kerusakan = :tanggal_kerusakan, kerusakan = :kerusakan, tanggal_penanganan = :tanggal_penanganan, teknisi = :teknisi WHERE id_penanganan = :id_penanganan';
      DataModule1.ZQueryPenanganan.Params.ParamByName('nama_perangkat').Value := Edit1.Text;
      DataModule1.ZQueryPenanganan.Params.ParamByName('tanggal_kerusakan').Value := DateTimePicker1.DateTime;
      DataModule1.ZQueryPenanganan.Params.ParamByName('kerusakan').Value := Memo1.Lines.Text;
      DataModule1.ZQueryPenanganan.Params.ParamByName('tanggal_penanganan').Value := DateTimePicker1.DateTime;
      DataModule1.ZQueryPenanganan.Params.ParamByName('teknisi').Value := Edit2.Text;
      DataModule1.ZQueryPenanganan.Params.ParamByName('id_penanganan').Value := IDPenanganan;
      DataModule1.ZQueryPenanganan.ExecSQL;

      DataModule1.ZQueryPenanganan.Close;
      DataModule1.ZQueryPenanganan.SQL.Text := 'SELECT * FROM penanganan';
      DataModule1.ZQueryPenanganan.Open;

      Label8.Caption := IntToStr(DataModule1.ZQueryPenanganan.RecordCount);

      ShowMessage('Data berhasil diubah');
      Edit1.Clear;
      DateTimePicker1.DateTime := 0;
      Memo1.Clear;
      DateTimePicker2.DateTime := 0;
      Edit2.Clear;
      except
      on E: Exception do
        begin
          ShowMessage('Error: ' + E.Message);
        end;
    end;
  end
    else
    if edit1.Text = '' then
    begin
      Showmessage('nama perangkat masih kosong');
      edit1.SetFocus;
    end else
    if DateTimePicker1.DateTime = 0 then
    begin
      Showmessage('tanggal kerusakan masih kosong');
      DateTimePicker1.SetFocus;
    end else
    if Memo1.Lines.Count = 0 then
    begin
      Showmessage('kerusakan masih kosong');
      Memo1.SetFocus;
    end else
    if DateTimePicker2.DateTime = 0 then
    begin
      Showmessage('tanggal penanganan masih kosong');
      DateTimePicker2.SetFocus;
    end else
    if edit2.Text = '' then
    begin
      Showmessage('teknisi masih kosong');
      edit2.SetFocus;
    end;
end;

procedure TFormPenanganan.Button3Click(Sender: TObject);
begin
try
  DeletedData := DataModule1.ZQueryPenanganan.FieldByName('nama_perangkat').AsString;

  if messageDlg('Apakah yakin data '+ DataModule1.ZQueryPenanganan.FieldByName('nama_perangkat').AsString+' akan dihapus?',mtConfirmation,[Mbyes,Mbno],0)=mryes then
  begin
    var IDPenanganan: Integer := DataModule1.ZQueryPenanganan.FieldByName('id_penanganan').AsInteger;

    if not DataModule1.ZQueryPenanganan.IsEmpty then
    begin
    DataModule1.ZQueryPenanganan.Close;

    DataModule1.ZQueryPenanganan.SQL.Text := 'DELETE FROM penanganan WHERE id_penanganan = :id_penanganan';
    DataModule1.ZQueryPenanganan.Params.ParamByName('id_penanganan').Value := IDPenanganan;
    DataModule1.ZQueryPenanganan.ExecSQL;

    DataModule1.ZQueryPenanganan.SQL.Text := 'ALTER TABLE penanganan AUTO_INCREMENT = 1';
    DataModule1.ZQueryPenanganan.ExecSQL;

    DataModule1.ZQueryPenanganan.Close;
    DataModule1.ZQueryPenanganan.SQL.Text := 'SELECT * FROM penanganan';
    DataModule1.ZQueryPenanganan.Open;

    Label8.Caption := IntToStr(DataModule1.ZQueryPenanganan.RecordCount);

    User;
    LogActivity('Menghapus data penanganan ' + DeletedData, username);

    ShowMessage('Data berhasil dihapus');
    Edit1.Clear;
    DateTimePicker1.DateTime := 0;
    Memo1.Clear;
    DateTimePicker2.DateTime := 0;
    Edit2.Clear;
  end
  else
    begin
      ShowMessage('Data tidak ditemukan');
    end;
  end;
  except
    ShowMessage('Terjadi kesalahan saat menghapus data');
end;
end;

procedure TFormPenanganan.Button4Click(Sender: TObject);
begin
  Edit1.Clear;
  DateTimePicker1.DateTime := 0;
  Memo1.Clear;
  DateTimePicker2.DateTime := 0;
  Edit2.Clear;
end;

procedure TFormPenanganan.DBGrid1CellClick(Column: TColumn);
var
  SelectedDate: TDateTime;
begin
  Edit1.Text := DataModule1.ZQueryPenanganan.FieldByName('nama_perangkat').AsString;

  SelectedDate := DataModule1.ZQueryPenanganan.FieldByName('tanggal_kerusakan').AsDateTime;
  DateTimePicker1.Date := SelectedDate;

  Memo1.Text := DataModule1.ZQueryPenanganan.FieldByName('kerusakan').AsString;

  SelectedDate := DataModule1.ZQueryPenanganan.FieldByName('tanggal_penanganan').AsDateTime;
  DateTimePicker2.Date := SelectedDate;

  Edit2.Text := DataModule1.ZQueryPenanganan.FieldByName('teknisi').AsString;
end;

procedure TFormPenanganan.Edit1Change(Sender: TObject);
begin
//  OldData := DataModule1.ZQueryPenanganan.FieldByName('nama_perangkat').AsString;
//  begin
//    User;
//    UpdatedData := DataModule1.ZQueryPenanganan.FieldByName('nama_perangkat').AsString;
//    LogActivity('Mengubah data penanganan ' + OldData + ' menjadi '+ UpdatedData , username);
//  end;
end;

procedure TFormPenanganan.Edit2Change(Sender: TObject);
begin
//  OldData := DataModule1.ZQueryPenanganan.FieldByName('teknisi').AsString;
//  try
//    User;
//    UpdatedData := DataModule1.ZQueryPenanganan.FieldByName('teknisi').AsString;
//    LogActivity('Mengubah data penanganan ' + OldData + ' menjadi '+ UpdatedData , username);
//  except
//
//  end;
end;

procedure TFormPenanganan.Edit3Change(Sender: TObject);
begin
    DataModule1.ZQueryPenanganan.Close;
    DataModule1.ZQueryPenanganan.SQL.Text := 'SELECT * FROM penanganan WHERE nama_perangkat LIKE :Search';
    DataModule1.ZQueryPenanganan.ParamByName('Search').AsString := '%' + Edit3.Text + '%';
    DataModule1.ZQueryPenanganan.Open;

    Label8.Caption := IntToStr(DataModule1.ZQueryPenanganan.RecordCount);
end;

procedure TFormPenanganan.FormShow(Sender: TObject);
begin
  DataModule1.ZQueryPenanganan.Active := True;
  Label8.Caption := IntToStr(DataModule1.ZQueryPenanganan.RecordCount);
end;

end.
