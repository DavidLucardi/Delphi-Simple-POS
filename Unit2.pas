unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, ComCtrls, StdCtrls, DB, ADODB, Registry;

type
  TForm2 = class(TForm)
    ProgressBar1: TProgressBar;
    Image1: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  z : Integer;
  RegistryEntry : TRegistry;
  
implementation
uses Unit1, Unit3, Unit4;
{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
RegistryEntry := TRegistry.Create(KEY_READ OR $0100);
RegistryEntry.RootKey := HKEY_LOCAL_MACHINE;
if (RegistryEntry.KeyExists('SOFTWARE\Wow6432Node')) then
Label3.Caption := 'Berjalan di 64 Bit'
else
Label3.Caption := 'Berjalan di 32 Bit';
RegistryEntry.CloseKey();
RegistryEntry.Free;
ProgressBar1.Position := 0;
Timer1.Interval := 100;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
ProgressBar1.Position := ProgressBar1.Position + 1;
if ProgressBar1.Position = 0 then
Label1.Caption := '>>.....'
else if ProgressBar1.Position = 1 then
Label1.Caption := '>>>.....'
else if ProgressBar1.Position = 2 then
Label1.Caption := '>>>>.....'
else if ProgressBar1.Position = 3 then
Label1.Caption := '>>>>>.....'
else if ProgressBar1.Position = 4 then
Label1.Caption := '>.....Memeriksa Lisensi.....'
else if ProgressBar1.Position = 20 then
Label1.Caption := '>>.....Membaca Database.....'
else if ProgressBar1.Position = 40 then
Label1.Caption := '>>>.....Membaca Editor Database.....'
else if ProgressBar1.Position = 60 then
Label1.Caption := '>>>>.....Membaca Aplikasi Inti.....'
else if ProgressBar1.Position = 80 then
Label1.Caption := '>>>>.....Mempersiapkan Tampilan....'
else if ProgressBar1.Position = 90 then
Label1.Caption := '>>>>.....Membuka Aplikasi.....'
else if ProgressBar1.Position = 100 then
begin
Form2.Hide;
Application.CreateForm(Tform1, form1);
RegistryEntry := TRegistry.Create(KEY_READ OR $0100);
RegistryEntry.RootKey := HKEY_LOCAL_MACHINE;
if (not RegistryEntry.KeyExists('SOFTWARE\BITCODES\KASIR\')) then
begin
Form4.Show;
end
else
Form3.Show;
Timer1.Enabled := False;
RegistryEntry.CloseKey();
RegistryEntry.Free;
  end;
    end;
end.
