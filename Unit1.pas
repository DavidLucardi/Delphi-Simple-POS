unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, jpeg, ExtCtrls, Menus, Printers, DB, ADODB;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit5: TMenuItem;
    Help1: TMenuItem;
    Exit1: TMenuItem;
    UpdateDatabase1: TMenuItem;
    About1: TMenuItem;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit6: TEdit;
    Label2: TLabel;
    Edit7: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    Label4: TLabel;
    ComboBox2: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Edit8: TEdit;
    Label7: TLabel;
    Edit9: TEdit;
    Label9: TLabel;
    Edit4: TEdit;
    Button3: TButton;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    Label10: TLabel;
    Edit10: TEdit;
    Label11: TLabel;
    Edit11: TEdit;
    Label12: TLabel;
    Edit12: TEdit;
    Label13: TLabel;
    Edit13: TEdit;
    Label14: TLabel;
    Edit14: TEdit;
    Button5: TButton;
    Edit17: TEdit;
    Label15: TLabel;
    Edit18: TEdit;
    Label16: TLabel;
    Button4: TButton;
    GroupBox4: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Button1: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Button9: TButton;
    Button10: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Button11: TButton;
    Button12: TButton;
    ABout2: TMenuItem;
    Label21: TLabel;
    Edit19: TEdit;
    Label22: TLabel;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    ComboBox5: TComboBox;
    Image1: TImage;
    Label23: TLabel;
    Label24: TLabel;
    Edit33: TEdit;
    CheckBox2: TCheckBox;
    Image2: TImage;
    Edit34: TEdit;
    Edit35: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    Edit23: TEdit;
    Edit24: TEdit;
    Timer1: TTimer;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    ADOTable3: TADOTable;
    LogOut1: TMenuItem;
    Label8: TLabel;
    function Total:Real;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure UpdateDatabase1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure ABout2Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure LogOut1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  x : array[1..10] of Real;

implementation
uses Unit2, Unit3, Unit5, Unit6;
{$R *.dfm}

function TForm1.Total;
var a,b,c,d,e,f : Real;
begin
Edit17.Enabled := True;
Button5.Enabled := True;
e := StrToFloat(Edit12.Text);
f := StrToFloat(Edit13.Text);
a := x[1] + x[2] + x[3] + x[4] + x[5] + x[6] + x[7] + x[8] + x[9] + x[10];
Edit11.Text := FloatToStr(a);
b := a * (e/100);
c := a * (f/100);
d := a + c - b;
Edit14.Text := FloatToStr(d);
end;

procedure TForm1.Button1Click(Sender: TObject);
var f1 : TextFile;
ch,flmk : string;
var a,b,c,d : integer;

Begin
flmk := Edit2.Text;
If Edit2.Text = '' then
Application.MessageBox('Database belum terdaftar...','Error',MB_OK or MB_ICONERROR)
Else
If (Edit1.Text = '') Or (Edit1.Text = '0') then
Application.MessageBox('Jumlah data belum diisi...','Error',MB_OK or MB_ICONERROR)
Else
Begin
assignfile(f1,flmk);
Reset(f1);
b := StrToInt(Edit1.Text);
Begin
a := 0;
Repeat
a := a + 1;
Readln(f1, ch);
Combobox1.Items.Add(ch);
Until a = b;
Begin
assignfile(f1,Edit19.Text);
Reset(f1);
c := StrToInt(Edit1.Text);
Begin
d := 0;
Repeat
d := d + 1;
Readln(f1, ch);
Combobox3.Items.Add(ch);
Until d = c;
End;
End;
Edit1.SetFocus;
End;
End;
End;

procedure TForm1.FormCreate(Sender: TObject);
var f1 : TextFile;
ch : string;
var i,j : integer;
begin
z := 1;
Image1.Picture.LoadFromFile(Edit35.Text);
Edit17.ReadOnly := True;
Button5.Enabled := False;
GroupBox1.Enabled := False;
GroupBox2.Enabled := False;
GroupBox4.Visible := False;
Edit4.Enabled := False;
Button3.Enabled := False;
Edit1.Text := '10';
Edit2.Text := 'Database\Makanan.DAT';
Edit15.Text := 'Database\Minuman.DAT';
Edit19.Text := 'Database\HargaMk.DAT';
Edit20.Text := 'Database\HargaMn.DAT';
Edit16.Text := '10';
assignfile(f1,'Database\JumlahOp.DAT');
Reset(f1);
Readln(f1, ch);
Edit34.Text := ch;
assignfile(f1,'Database\Operator.DAT');
Reset(f1);
j := StrToInt(Edit34.Text);
Begin
i := 0;
Repeat
i := i + 1;
Readln(f1, ch);
Combobox5.Items.Add(ch);
Until i = j;
Form1.ADOTable3.First;
while not Form1.ADOTable3.Eof do
begin
Form1.Statusbar1.Panels[2].Text := 'Register to ' + (Form1.ADOTable3.FieldByName('Email').Value);
Form1.ADOTable3.Next;
end;
  end;
    end;

procedure TForm1.Button2Click(Sender: TObject);
begin
If (Edit3.Text = '0') Or (ComboBox1.Text = 'Pilih Makanan') then
Application.MessageBox('Jumlah pesanan belum dimasukkan atau pesanan anda salah...','Error',MB_OK or MB_ICONERROR)
Else
 Begin
  Memo1.Lines.Append(ComboBox1.Text + ' ('+ Edit3.Text +')' + ' @ ' + ComboBox3.Text + ' total Rp. ' + Edit21.Text);
  Edit3.SetFocus;
  Edit4.Enabled := True;
  Button3.Enabled := True;
  End;
  Button2.Enabled := False;
  Edit3.SetFocus;
  If x[1] = 0 then
  x[1] := StrToFloat(Edit21.Text)
  Else If x[2] = 0 then
  x[2] := StrToFloat(Edit21.Text)
  Else If x[3] = 0 then
  x[3] := StrToFloat(Edit21.Text)
  Else If x[4] = 0 then
  x[4] := StrToFloat(Edit21.Text)
  Else If x[5] = 0 then
  x[5] := StrToFloat(Edit21.Text)
  Else If x[6] = 0 then
  x[6] := StrToFloat(Edit21.Text)
  Else If x[7] = 0 then
  x[7] := StrToFloat(Edit21.Text)
  Else If x[8] = 0 then
  x[8] := StrToFloat(Edit21.Text)
  Else If x[9] = 0 then
  x[9] := StrToFloat(Edit21.Text)
  Else If x[10] = 0 then
  x[10] := StrToFloat(Edit21.Text)
  Else
  Application.MessageBox('Jumlah pesanan maksimal 10 dalam 1 nota...','Error',MB_OK or MB_ICONWARNING);
  Memo1.Lines.Delete(11);
end;

procedure TForm1.Button3Click(Sender: TObject);
Var a : Integer;
begin
If (Edit4.Text = '') or (Edit4.Text = '0') then
Application.MessageBox('Masukkan Minimal  1...','Error',MB_OK or MB_ICONERROR)
Else
a := StrToInt(Edit4.Text);
Memo1.Lines.Delete(a);
Edit4.Text := '';
If a = 1 then
x[1] := 0
Else If a = 2 then
x[2] := 0
Else If a = 3 then
x[3] := 0
Else If a = 4 then
x[4] := 0
Else If a = 5 then
x[5] := 0
Else If a = 6 then
x[6] := 0
Else If a = 7 then
x[7] := 0
Else If a = 8 then
x[8] := 0
Else If a = 9 then
x[9] := 0
Else If a = 10 then
x[10] := 0;
Edit4.SetFocus;
end;

procedure TForm1.Button7Click(Sender: TObject);
var f1 : TextFile;
ch,flmn : string;
var c,d : integer;

Begin
flmn := Edit15.Text;
If Edit15.Text = '' then
Application.MessageBox('Database belum terdaftar...','Error',MB_OK or MB_ICONERROR)
Else
If (Edit16.Text = '') or (Edit16.Text = '0')  then
Application.MessageBox('Jumlah data belum diisi...','Error',MB_OK or MB_ICONERROR)
Else
Begin
assignfile(f1,flmn);
Reset(f1);
d := StrToInt(Edit16.Text);
Begin
c := 0;
Repeat
c := c + 1;
Readln(f1, ch);
Combobox2.Items.Add(ch);
Until c = d;
End;
End;
Edit16.SetFocus;
End;

procedure TForm1.Button4Click(Sender: TObject);

Begin
If (Edit8.Text = '') Or (ComboBox2.Text = 'Pilih Minuman') then
Application.MessageBox('Jumlah pesanan belum dimasukkan atau pesanan anda salah...','Error',MB_OK or MB_ICONERROR)
Else
 Begin
  Memo1.Lines.Append(ComboBox2.Text + ' ('+ Edit8.Text +')' + ' @ ' + ComboBox4.Text + ' total Rp. ' + Edit22.Text);
  Edit8.SetFocus;
  Edit4.Enabled := True;
  Button3.Enabled := True;
 End;
 Button4.Enabled := False;
 Edit8.SetFocus;
 If x[1] = 0 then
  x[1] := StrToFloat(Edit22.Text)
  Else If x[2] = 0 then
  x[2] := StrToFloat(Edit22.Text)
  Else If x[3] = 0 then
  x[3] := StrToFloat(Edit22.Text)
  Else If x[4] = 0 then
  x[4] := StrToFloat(Edit22.Text)
  Else If x[5] = 0 then
  x[5] := StrToFloat(Edit22.Text)
  Else If x[6] = 0 then
  x[6] := StrToFloat(Edit22.Text)
  Else If x[7] = 0 then
  x[7] := StrToFloat(Edit22.Text)
  Else If x[8] = 0 then
  x[8] := StrToFloat(Edit22.Text)
  Else If x[9] = 0 then
  x[9] := StrToFloat(Edit22.Text)
  Else If x[10] = 0 then
  x[10] := StrToFloat(Edit22.Text)
 Else
 Application.MessageBox('Jumlah pesanan maksimal 10 dalam 1 nota...','Error',MB_OK or MB_ICONWARNING);
 Memo1.Lines.Delete(11);
End;

procedure TForm1.Button6Click(Sender: TObject);
begin
ComboBox1.Clear;
ComboBox3.Clear;
ComboBox1.Text := 'Pilih Makanan';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
ComboBox2.DeleteSelected;
ComboBox4.DeleteSelected;
ComboBox2.Text := 'Pilih Minuman';
end;

procedure TForm1.UpdateDatabase1Click(Sender: TObject);
begin
If Form1.StatusBar1.Panels[3].Text = 'Administrator' then
begin
Application.CreateForm(Tform6, form6);
Form6.Show;
end
else
begin
Application.MessageBox('Anda tidak memiliki Hak Akses untuk menu ini...','Info',MB_OK or MB_ICONWARNING)
end;
  end;
//GroupBox4.Visible := True;

procedure TForm1.Button9Click(Sender: TObject);
begin
GroupBox4.Visible := False;
end;

procedure TForm1.Button10Click(Sender: TObject);
var f1 : TextFile;
ch : string;
var a,b,c,d,e,f,g,h,i,j : integer;
begin
Image1.Picture.LoadFromFile(Edit35.Text);
CheckBox1.Checked := False;
CheckBox1.Enabled := False;
Memo1.Lines.Clear;
ComboBox1.Clear;
ComboBox1.Text := 'Pilih Makanan';
ComboBox2.Clear;
ComboBox2.Text := 'Pilih Minuman';
ComboBox3.Clear;
ComboBox4.Clear;
Edit6.Text := '';
Edit7.Text := '';
Edit9.Text := '';
Edit10.Text := '';
x[1] := 0;
x[2] := 0;
x[3] := 0;
x[4] := 0;
x[5] := 0;
x[6] := 0;
x[7] := 0;
x[8] := 0;
x[9] := 0;
x[10] := 0;
Edit33.Text := '';
Edit11.Text := '0';
Edit13.Text := '10';
Edit14.Text := '0';
Edit17.Text := '0';
Edit18.Text := '0';
If Label8.Caption = 'Operator Kasir' then
Application.MessageBox('Operator kasir belum dipilih...','Error',MB_OK or MB_ICONWARNING)
Else
Begin
Memo1.Lines.Append('Pesanan Anda : ');
Button11.Enabled := True;
Button10.Enabled := False;
GroupBox2.Enabled := True;
GroupBox3.Enabled := True;
ComboBox1.SetFocus;
assignfile(f1,Edit2.Text);
Reset(f1);
b := StrToInt(Edit1.Text);
Begin
a := 0;
Repeat
a := a + 1;
Readln(f1, ch);
Combobox1.Items.Add(ch);
Until a = b;
Begin
assignfile(f1,Edit15.Text);
Reset(f1);
d := StrToInt(Edit16.Text);
Begin
c := 0;
Repeat
c := c + 1;
Readln(f1, ch);
Combobox2.Items.Add(ch);
Until c = d;
Begin
assignfile(f1,Edit19.Text);
Reset(f1);
f := StrToInt(Edit1.Text);
Begin
e := 0;
Repeat
e := e + 1;
Readln(f1, ch);
Combobox3.Items.Add(ch);
Until e = f;
Begin
assignfile(f1,Edit20.Text);
Reset(f1);
h := StrToInt(Edit16.Text);
Begin
g := 0;
Repeat
g := g + 1;
Readln(f1, ch);
Combobox4.Items.Add(ch);
Until g = h;
ComboBox1.Items.Clear;
ComboBox2.Items.Clear;
ComboBox3.Items.Clear;
ComboBox4.Items.Clear;
ADOTable1.First;
while not ADOTable1.Eof do
begin
ComboBox1.Items.Add(ADOTable1.FieldByName('Nama Makanan').Value);
ComboBox3.Items.Add(ADOTable1.FieldByName('Harga Makanan').Value);
ADOTable1.Next;
End;
ADOTable2.First;
while not ADOTable2.Eof do
begin
ComboBox2.Items.Add(ADOTable2.FieldByName('Nama Minuman').Value);
ComboBox4.Items.Add(ADOTable2.FieldByName('Harga Minuman').Value);
ADOTable2.Next;
End;
  End;
    End;
      End;
        End;
          End;
            End;
              End;
                End;
                  End;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
If ComboBox1.ItemIndex = 0 then
ComboBox3.ItemIndex := ComboBox1.ItemIndex
Else
ComboBox3.ItemIndex := ComboBox1.ItemIndex;
Edit3.Enabled := True;
Edit3.SetFocus;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
If (Edit3.Text = '' ) Or (Edit8.Text = '' ) And (Button2.Enabled = True) Or (Button4.Enabled = True) then
Application.MessageBox('Anda belum memesan apapun...','Error',MB_OK or MB_ICONWARNING)
Else
Begin
GroupBox1.Enabled := True;
GroupBox2.Enabled := False;
Button12.Enabled := True;
Button11.Enabled := False;
Application.MessageBox('Silahkan anda mengisi identitas pelanggan...','Info',MB_OK or MB_ICONINFORMATION);
Edit6.SetFocus;
Edit7.Enabled := False;
Edit9.Enabled := False;
End;
end;

procedure TForm1.Edit3Change(Sender: TObject);
Var i,j,k : Real;
begin
i := StrToFloat(ComboBox3.Text);
j := StrToFloat(Edit3.Text);
If Edit3.Text = '0' then
Application.MessageBox('Masukkan Minimal  1...','Error',MB_OK or MB_ICONERROR)
Else
Button2.Enabled := True;
Begin
k := i*j;
Edit21.Text := FloatToStr(k);
End;
end;

procedure TForm1.ABout2Click(Sender: TObject);
begin
Application.MessageBox('Aplikasi Kasir Restoran Versi 3.0' + #13#10 +'PROGRAMMER :'+ #13#10 + 'DAVID YOHANES LUCARDI, MUCHROMIN, ANGGA BUDI HARIANTO' + #13#10 + 'JURUSAN : FTI/SI-R2','About',MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
If ComboBox2.ItemIndex = 0 then
ComboBox4.ItemIndex := ComboBox2.ItemIndex
Else
ComboBox4.ItemIndex := ComboBox2.ItemIndex;
Edit8.Enabled := True;
Edit8.SetFocus;
end;

procedure TForm1.Edit8Change(Sender: TObject);
Var l,m,n : Real;
begin
l := StrToFloat(ComboBox4.Text);
m := StrToFloat(Edit8.Text);
If Edit8.Text = '0' then
Application.MessageBox('Masukkan Minimal  1...','Error',MB_OK or MB_ICONERROR)
Else
Button4.Enabled := True;
Begin
n := l*m;
Edit22.Text := FloatToStr(n);
End;
End;

procedure TForm1.Button12Click(Sender: TObject);
begin
Total;
Edit6.SetFocus;
If (Edit6.Text = '') then
Application.MessageBox('Nama mohon diisi dahulu...','Error',MB_OK or MB_ICONERROR)
Else If (Edit10.Text = '') then
Application.MessageBox('Nomer Meja mohon diisi dahulu...','Error',MB_OK or MB_ICONERROR)
Else
Begin
Button12.Enabled := False;
Memo1.Lines.Append('===============================================');
Memo1.Lines.Append('Nomer Nota' + #9 + ': ' + 'NP2-0' + IntToStr(z));
Memo1.Lines.Append('>> ' + Edit23.Text + ' >> ' + Edit24.Text);
Memo1.Lines.Append('Dikirim ke :');
Memo1.Lines.Append('Nama Pelanggan' + #9 + ': ' + Edit6.Text);
Memo1.Lines.Append('Alamat' + #9#9 + ': ' + Edit7.Text);
Memo1.Lines.Append('Telepon' + #9#9 + ': ' + Edit9.Text);
Memo1.Lines.Append('Meja Nomer' + #9 + ': ' + Edit10.Text);
Edit17.ReadOnly := False;
Edit17.SetFocus;
Edit33.Text := FormatCurr('#,###', StrToFloat(Edit14.Text)) + ',-';
CheckBox2.Checked := False;
Edit17.SetFocus;
end;
  End;

procedure TForm1.Button13Click(Sender: TObject);
begin
Memo1.Lines.Delete(1);
end;

procedure TForm1.Button5Click(Sender: TObject);
Var a,b,c,d,e : Real;
   PrintBuf: TextFile;
   j,buttonSelected : Integer;
   myFile : TextFile;
   text   : string;
begin
Edit17.SetFocus;
d := StrToFloat(Edit17.Text);
e := StrToFloat(Edit14.Text);
If (d = 0) Or (d < e ) then
Application.MessageBox('Anda belum membayar...','Info',MB_OK or MB_ICONWARNING)
Else
begin
Button5.Enabled := False;
GroupBox1.Enabled := False;
a := StrToFloat(Edit14.Text);
b := StrToFloat(Edit17.Text);
c := b - a;
Edit18.Text := FloatToStr(c);
Button10.Enabled := True;
Memo1.Lines.Append('===============================================');
Memo1.Lines.Append('Total Pembelian Anda :');
Memo1.Lines.Append('Sub Total' + #9 + ': Rp. ' + FormatCurr('#,###', StrToFloat(Edit11.Text)) + ',-');
Memo1.Lines.Append('Diskon' + #9 + ': ' + Edit12.Text + ' %');
Memo1.Lines.Append('PPN' + #9 + ': ' + Edit13.Text + ' %');
Memo1.Lines.Append('===============================================');
Memo1.Lines.Append('Grand Total' + #9 + ': Rp. ' + FormatCurr('#,###', StrToFloat(Edit14.Text)) + ',-');
Memo1.Lines.Append('Bayar Tunai' + #9 + ': Rp. ' + FormatCurr('#,###', StrToFloat(Edit17.Text)) + ',-');
Memo1.Lines.Append('Kembali' + #9#9 + ': Rp. ' + FormatCurr('#,###', StrToFloat(Edit18.Text)) + ',-');
Memo1.Lines.Append('===============================================');
Memo1.Lines.Append('Kasir : ' + ComboBox5.Text);
Memo1.Lines.Append('');
Memo1.Lines.Append('TERIMA KASIH ATAS KUNJUNGAN ANDA');
Memo1.Lines.Append('');
Memo1.Lines.Append('Harap menyimpan bukti ini untuk pengambilan');
Memo1.Lines.Append('dan penerimaan pesanan.');
Edit17.ReadOnly := True;
AssignFile(myFile, 'Transaksi\' + 'NP2-0' + IntToStr(z) + '.txt');
  ReWrite(myFile);
  for j := 0 to Memo1.Lines.Count-1 do
  WriteLn(myFile, Memo1.Lines[j]);
  CloseFile(myFile);
  z := z + 1;
buttonSelected := MessageDlg('Apakah anda ingin print nota...?',mtCustom, [mbYes,mbNO], 0);
  if buttonSelected = mrYes then
  begin
  CheckBox1.Enabled := True;
  CheckBox1.Checked := True;
       AssignPrn(PrintBuf) ;
   Rewrite(PrintBuf) ;
   try
     for j := 0 to Memo1.Lines.Count-1 do
       WriteLn(PrintBuf, Memo1.Lines[j]) ;
   finally
     CloseFile(PrintBuf);
end;
  end;
    end;
      end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
Edit7.Enabled := True;
Edit9.Enabled := True;
Edit10.Text := 'Delivery';
Edit7.SetFocus;
If (Edit7.Text <> '') And (Edit9.Text <> '') then
CheckBox2.Checked := False
Else
Application.MessageBox('Masukkan alamat dan nomer telepon...','Info',MB_OK or MB_ICONWARNING);
end;

procedure TForm1.About1Click(Sender: TObject);
begin
Application.MessageBox('Aplikasi Kasir Restoran Versi 3.0' + #13#10 +'Aplikasi ini telah di registrasi.','Register',MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form2.Close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
Edit23.Text := ' Tanggal >> ' + FormatDateTime('dd/mm/yy', date);
Edit24.Text := ' Pukul >> ' + FormatDateTime('hh:nn:ss', time);
StatusBar1.Panels[0].Text := TimetoStr(Now);
StatusBar1.Panels[1].Text := Formatdatetime('dddddd', Date);
end;

procedure TForm1.LogOut1Click(Sender: TObject);
Var
  butsel : Integer;
begin
butsel := MessageDlg('Apakah anda yakin ingin LOG OUT...?',mtCustom, [mbYes,mbNO], 0);
  if butsel = mrYes then
  begin
Form1.Hide;
Form3.Show;
Form3.ComboBox1.Text := 'PILIH';
Form3.Edit1.Text := '';
Form3.ComboBox1.SetFocus;
end
else
Form1.Show;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
If Form1.StatusBar1.Panels[3].Text = 'Administrator' then
begin
Application.CreateForm(Tform5, form5);
Form5.Show;
end
else
begin
Application.MessageBox('Anda tidak memiliki Hak Akses untuk menu ini...','Info',MB_OK or MB_ICONWARNING)
end;
  end;

end.


