unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI, XPMan, ComCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Memo1: TMemo;
    Label5: TLabel;
    CheckBox12: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  app: String;

implementation

{$R *.dfm}
function Get_File_Size4(const S: string): Int64;
var
  FD: TWin32FindData;
  FH: THandle;
begin
  FH := FindFirstFile(PChar(S), FD);
  if FH = INVALID_HANDLE_VALUE then Result := 0
  else
    try
      Result := FD.nFileSizeHigh;
      Result := Result shl 32;
      Result := Result + FD.nFileSizeLow;
    finally
      //CloseHandle(FH);
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  If OpenDialog1.Execute then
    begin
      Edit1.Text := OpenDialog1.FileName;
      Button2.Enabled := True;
    end;
    StatusBar1.Panels[1].Text := IntToStr( Get_File_Size4(OpenDialog1.FileName)) + ' Kb';
    StatusBar1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Label3.Caption := '';

  if CheckBox1.Checked = true then Label3.Caption := Label3.Caption + ' -i';
  if CheckBox2.Checked = true then Label3.Caption := Label3.Caption + ' -q';
  if CheckBox3.Checked = true then Label3.Caption := Label3.Caption + ' -b';
  if CheckBox4.Checked = true then Label3.Caption := Label3.Caption + ' -x';
  if CheckBox5.Checked = true then Label3.Caption := Label3.Caption + ' -S';
  if CheckBox6.Checked = true then Label3.Caption := Label3.Caption + ' -u';
  if CheckBox7.Checked = true then Label3.Caption := Label3.Caption + ' -h';
  if CheckBox8.Checked = true then Label3.Caption := Label3.Caption + ' -r';
  if CheckBox9.Checked = true then Label3.Caption := Label3.Caption + ' -L';
  if CheckBox10.Checked = true then Label3.Caption := Label3.Caption + ' -s';
  if CheckBox11.Checked = true then Label3.Caption := Label3.Caption + ' -m';

  app := ExtractFilePath(Application.ExeName)+'mpress\mpress.exe';
  try


  if CheckBox12.Checked = true then begin
    ShellExecute(Handle, 'open', PChar(app),
               PChar(' ' + Edit1.Text + Label3.Caption), nil, SW_SHOWNORMAL);
    end else begin
    ShellExecute(Handle, 'open', PChar(app),
             PChar(' ' + Edit1.Text + Label3.Caption), nil, SW_HIDE);
    end;
  finally
  end;
  Sleep(2000);
  StatusBar1.Panels[3].Text := IntToStr( Get_File_Size4(Edit1.Text)) + ' Kb';
  Screen.Cursor := crDefault;
  StatusBar1.SetFocus;
end;

procedure TForm1.CheckBox11Click(Sender: TObject);
begin
  if CheckBox11.Checked = true then begin
  RadioButton1.Enabled := true;
  RadioButton2.Enabled := true;
  RadioButton3.Enabled := true;
  RadioButton4.Enabled := true;
  end else begin
  RadioButton1.Enabled := false;
  RadioButton2.Enabled := false;
  RadioButton3.Enabled := false;
  RadioButton4.Enabled := false;
  end;
end;

end.
