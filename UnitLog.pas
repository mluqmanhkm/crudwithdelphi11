unit UnitLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFormLog = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Hapus: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    procedure HapusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLog: TFormLog;

implementation

{$R *.dfm}

uses UnitDataModule;

procedure TFormLog.DateTimePicker1Change(Sender: TObject);
begin
    DataModule1.ZQueryLog.Close;
    DataModule1.ZQueryLog.SQL.Text := 'SELECT * FROM log WHERE DATE(tanggal) = :Searchdate';
    DataModule1.ZQueryLog.ParamByName('SearchDate').AsDate := DateTimePicker1.Date;
    DataModule1.ZQueryLog.Open;

    Label2.Caption := IntToStr(DataModule1.ZQueryLog.RecordCount);
end;

procedure TFormLog.FormShow(Sender: TObject);
begin
  DataModule1.ZQueryLog.Active := True;
  Label2.Caption := IntToStr(DataModule1.ZQueryLog.RecordCount);
end;

procedure TFormLog.HapusClick(Sender: TObject);
begin
try
  if messageDlg('Apakah yakin data '+ DataModule1.ZQueryLog.FieldByName('id_log').AsString+' akan dihapus?',mtConfirmation,[Mbyes,Mbno],0)=mryes then
  begin
    var IDLog: Integer := DataModule1.ZQueryLog.FieldByName('id_log').AsInteger;

    if not DataModule1.ZQueryLog.IsEmpty then
    begin
    DataModule1.ZQueryLog.Close;

    DataModule1.ZQueryLog.SQL.Text := 'DELETE FROM log WHERE id_log = :id_log';
    DataModule1.ZQueryLog.Params.ParamByName('id_log').Value := IDLog;
    DataModule1.ZQueryLog.ExecSQL;

    DataModule1.ZQueryLog.SQL.Text := 'ALTER TABLE log AUTO_INCREMENT = 1';
    DataModule1.ZQueryLog.ExecSQL;

    DataModule1.ZQueryLog.Close;
    DataModule1.ZQueryLog.SQL.Text := 'SELECT * FROM log';
    DataModule1.ZQueryLog.Open;
    Label2.Caption := IntToStr(DataModule1.ZQueryLog.RecordCount);

    ShowMessage('Data berhasil dihapus');
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

end.
