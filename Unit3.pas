unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    ADOTable1: TADOTable;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses Unit1;
{$R *.dfm}



procedure TForm3.BitBtn2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
If ComboBox1.Text = 'PILIH' then
begin
Application.MessageBox('Password salah atau Nama belum dipilih...','Error',MB_OK or MB_ICONWARNING);
end
else if (Edit1.Text = ComboBox2.Text) then
begin
Form3.Close;
Form1.Show;
Form1.Label8.Caption := ComboBox1.Text;
Form1.StatusBar1.Panels[3].Text := ComboBox3.Text;
Form1.Button10.Click;
end
else
begin
Application.MessageBox('Password salah atau Nama belum dipilih...','Error',MB_OK or MB_ICONWARNING);
Edit1.SetFocus;
end;
  end;

procedure TForm3.FormCreate(Sender: TObject);
begin
ADOTable1.First;
while not ADOTable1.Eof do
begin
ComboBox1.Items.Add(ADOTable1.FieldByName('Nama').Value);
ComboBox2.Items.Add(ADOTable1.FieldByName('Kode').Value);
ComboBox3.Items.Add(ADOTable1.FieldByName('Akses').Value);
ADOTable1.Next;
End;
end;

procedure TForm3.ComboBox1Change(Sender: TObject);
begin
If ComboBox1.ItemIndex = 0 then
begin
ComboBox2.ItemIndex := ComboBox1.ItemIndex;
ComboBox3.ItemIndex := ComboBox1.ItemIndex;
end
else
ComboBox2.ItemIndex := ComboBox1.ItemIndex;
ComboBox3.ItemIndex := ComboBox1.ItemIndex;
Edit1.SetFocus;
end;

end.
