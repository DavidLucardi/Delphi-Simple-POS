unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Registry, DB, ADODB;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ADOTable1: TADOTable;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses Unit3, Unit1;
{$R *.dfm}

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
var
  RegistryEntry : TRegistry;
begin
if (Edit1.Text <> Edit3.Text) then
begin
Application.MessageBox('E-mail salah...','Error',MB_OK or MB_ICONWARNING);
Edit1.SetFocus;
end
else if (Edit2.Text <> Edit4.Text) then
begin
Application.MessageBox('Kode Registrasi salah...','Error',MB_OK or MB_ICONWARNING);
Edit2.SetFocus;
end
else
  begin
  Form3.ADOTable1.Delete;
  RegistryEntry:= TRegistry.Create(KEY_READ OR $0100);
  RegistryEntry.RootKey:= HKEY_LOCAL_MACHINE;
    RegistryEntry.Access:= KEY_WRITE;
    RegistryEntry.OpenKey('SOFTWARE\BITCODES\KASIR',True);
    RegistryEntry.WriteString('Email', Edit1.Text);
    RegistryEntry.WriteString('RegNum', Edit2.Text);
  RegistryEntry.CloseKey();
  RegistryEntry.Free;
Application.MessageBox('Terima Kasih','Info',MB_OK or MB_ICONINFORMATION);
Form4.Close;
Form3.Show;
Application.MessageBox('Selamat Datang....' + #13#10 + 'Program ini pertama kali dijalankan,' + #13#10 + 'Nama dan Kode Login adalah Admin.' + #13#10 + 'Anda bisa merubah nama dan kode di menu File - Pengaturan','Info',MB_OK or MB_ICONINFORMATION);
Form3.ADOTable1.Refresh;
Form3.ADOTable1.Append;
Form3.ADOTable1['Nama'] := 'Admin';
Form3.ADOTable1['Kode'] := 'admin';
Form3.ADOTable1['Akses'] := 'Administrator';
Form3.ADOTable1.Post;
Form3.ADOTable1.Active := False;
Form3.ADOTable1.Active := True;
Form3.ADOTable1.Refresh;
end;
  end;

procedure TForm4.FormCreate(Sender: TObject);
begin
ADOTable1.First;
while not ADOTable1.Eof do
begin
Edit3.Text := (ADOTable1.FieldByName('Email').Value);
Edit4.Text := (ADOTable1.FieldByName('Kode').Value);
ADOTable1.Next;
end;
  end;
end.
