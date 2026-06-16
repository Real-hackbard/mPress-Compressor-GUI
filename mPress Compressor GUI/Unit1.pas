unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI, ComCtrls, IniFiles;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
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
    CheckBox13: TCheckBox;
    Button3: TButton;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure WriteOptions;
    procedure ReadOptions;
  end;

var
  Form1: TForm1;
  app: String;
  TIF : TIniFile;

implementation

{$R *.dfm}

uses
  DumpHEX;

// get MainPath
function MainDir : string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

procedure TForm1.WriteOptions;    // ################### Options Write
var
  OPT :string;
begin
   OPT := 'Options';

   if not DirectoryExists(MainDir + 'Data\Options\')
   then ForceDirectories(MainDir + 'Data\Options\');

   TIF := TIniFile.Create(MainDir + 'Data\Options\Options.ini');
   with TIF do
   begin
    WriteBool(OPT,'IgnoreCompression',CheckBox1.Checked);
    WriteBool(OPT,'Quiet',CheckBox2.Checked);
    WriteBool(OPT,'Backup',CheckBox3.Checked);
    WriteBool(OPT,'IgnoreException',CheckBox4.Checked);
    WriteBool(OPT,'NoPatch',CheckBox5.Checked);
    WriteBool(OPT,'NoRemoveArchitectures',CheckBox6.Checked);
    WriteBool(OPT,'Help',CheckBox7.Checked);
    WriteBool(OPT,'NoCompressResource',CheckBox8.Checked);
    WriteBool(OPT,'ShortLicense',CheckBox9.Checked);
    WriteBool(OPT,'BestLZMAT',CheckBox10.Checked);
    WriteBool(OPT,'ForceLZMAT',CheckBox11.Checked);
    WriteBool(OPT,'LZ77',RadioButton1.Checked);
    WriteBool(OPT,'LZ78',RadioButton2.Checked);
    WriteBool(OPT,'LZ0',RadioButton3.Checked);
    WriteBool(OPT,'LZ77all',RadioButton4.Checked);
    WriteBool(OPT,'DumpHEX',CheckBox13.Checked);
    WriteBool(OPT,'Console',CheckBox12.Checked);


   //WriteBool(OPT,'SaveOptions',CheckBox1.Checked);
   //WriteInteger(OPT,'Compress',Combobox1.ItemIndex);
   //WriteInteger(OPT,'Overlay',RadioGroup1.ItemIndex);
    Free;
   end;
end;

procedure TForm1.ReadOptions;    // ################### Options Read
var
  OPT:string;
begin
  OPT := 'Options';
  if FileExists(MainDir + 'Data\Options\Options.ini') then
  begin
    TIF:=TIniFile.Create(MainDir + 'Data\Options\Options.ini');
    with TIF do
    begin
      CheckBox1.Checked:=ReadBool(OPT,'IgnoreCompression',CheckBox1.Checked);
      CheckBox2.Checked:=ReadBool(OPT,'Quiet',CheckBox2.Checked);
      CheckBox3.Checked:=ReadBool(OPT,'Backup',CheckBox3.Checked);
      CheckBox4.Checked:=ReadBool(OPT,'IgnoreException',CheckBox4.Checked);
      CheckBox5.Checked:=ReadBool(OPT,'NoPatch',CheckBox5.Checked);
      CheckBox6.Checked:=ReadBool(OPT,'NoRemoveArchitectures',CheckBox6.Checked);
      CheckBox7.Checked:=ReadBool(OPT,'Help',CheckBox7.Checked);
      CheckBox8.Checked:=ReadBool(OPT,'NoCompressResource',CheckBox8.Checked);
      CheckBox9.Checked:=ReadBool(OPT,'ShortLicense',CheckBox9.Checked);
      CheckBox10.Checked:=ReadBool(OPT,'BestLZMAT',CheckBox10.Checked);
      CheckBox11.Checked:=ReadBool(OPT,'ForceLZMAT',CheckBox11.Checked);
      RadioButton1.Checked:=ReadBool(OPT,'LZ77',RadioButton1.Checked);
      RadioButton2.Checked:=ReadBool(OPT,'LZ78',RadioButton2.Checked);
      RadioButton3.Checked:=ReadBool(OPT,'LZ0',RadioButton3.Checked);
      RadioButton4.Checked:=ReadBool(OPT,'LZ77all',RadioButton4.Checked);
      CheckBox13.Checked:=ReadBool(OPT,'DumpHEX',CheckBox13.Checked);
      CheckBox12.Checked:=ReadBool(OPT,'Console',CheckBox12.Checked);

    //CheckBox1.Checked:=ReadBool(OPT,'SaveOptions',CheckBox1.Checked);
    //Combobox1.ItemIndex:=ReadInteger(OPT,'Compress',combobox1.ItemIndex);
    //RadioGroup1.ItemIndex:=ReadInteger(OPT,'Overlay',RadioGroup1.ItemIndex);
      Free;
    end;
  end;
end;

// Start the compression process and wait until it is finished.
procedure ExecuteAndWait(const FileName, Parameters: string);
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  CmdLine: string;
begin
  // Assemble command line
  CmdLine := Format('"%s" %s', [FileName, Parameters]);

  // Initialize structures
  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;

  // show or hide console
  if Form1.CheckBox12.Checked = true then
  begin
    StartupInfo.wShowWindow := SW_NORMAL;
  end else begin
    StartupInfo.wShowWindow := SW_HIDE;
  end;

  // Create process
  if CreateProcess(
    nil,
    PChar(CmdLine),
    nil,
    nil,
    False,
    NORMAL_PRIORITY_CLASS,
    nil,
    nil,
    StartupInfo,
    ProcessInfo) then
  begin
    // Wait until the called program has finished
    WaitForSingleObject(ProcessInfo.hProcess, INFINITE);

    // Close handles to avoid memory leaks.
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end
  else
    RaiseLastOSError;
end;

function Get_File_Size4(const S: string): Int64;
var
  FD: TWin32FindData;
  FH: THandle;
begin
  // check if file exists
  FH := FindFirstFile(PChar(S), FD);
  // check file handle ist value
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

// uncheck all boxes & radiobuttons
procedure TForm1.Button1Click(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to 11 do
  begin
    TCheckbox(findcomponent('Checkbox' + IntToStr(i))).Checked := false;
  end;

  for i := 1 to 4 do
  begin
    TRadioButton(findcomponent('RadioButton' + IntToStr(i))).Checked := false;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Label3.Caption := '';

  // parameter flags
  // ignore compression result
  if CheckBox1.Checked = true then Label3.Caption := Label3.Caption + ' -i';
  // be quiet
  if CheckBox2.Checked = true then Label3.Caption := Label3.Caption + ' -q';
  // create backup file
  if CheckBox3.Checked = true then Label3.Caption := Label3.Caption + ' -b';
  // do not manage exceptions (64 bit PE32+)
  if CheckBox4.Checked = true then Label3.Caption := Label3.Caption + ' -x';
  // do not patch strong name signature (.NET)
  if CheckBox5.Checked = true then Label3.Caption := Label3.Caption + ' -S';
  // do not remove unsupported architectures (mac os x - ub)
  if CheckBox6.Checked = true then Label3.Caption := Label3.Caption + ' -u';
  // more help
  if CheckBox7.Checked = true then Label3.Caption := Label3.Caption + ' -h';
  // do not compress resources
  if CheckBox8.Checked = true then Label3.Caption := Label3.Caption + ' -r';
  // short license
  if CheckBox9.Checked = true then Label3.Caption := Label3.Caption + ' -L';
  // search the best LZMA parameters (very slow, better result)
  if CheckBox10.Checked = true then Label3.Caption := Label3.Caption + ' -s';
  // force to use LZMAT
  if CheckBox11.Checked = true then Label3.Caption := Label3.Caption + ' -m';

  // Determine the path to "mpress.exe".
  app := ExtractFilePath(Application.ExeName)+'Data\mPress\mpress.exe';
  StatusBar1.Panels[5].Text := 'wait, compressing';
  // update form
  Application.ProcessMessages;

  // Start the compression process and wait until it is finished.
  ExecuteAndWait(PChar(app), PChar(' ' + Edit1.Text + Label3.Caption));
  // report the new file size
  StatusBar1.Panels[3].Text := IntToStr( Get_File_Size4(Edit1.Text)) + ' Kb';
  StatusBar1.Panels[5].Text := 'done.';
  Application.ProcessMessages;

  if CheckBox13.Checked then
  begin
    StatusBar1.Panels[5].Text := 'wait, create dump..';
    Form2.Show;
  end;

  Screen.Cursor := crDefault;
  StatusBar1.SetFocus;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   If OpenDialog1.Execute then
    begin
      Edit1.Text := OpenDialog1.FileName;
      Button2.Enabled := True;
    end;
    StatusBar1.Panels[1].Text := IntToStr( Get_File_Size4(OpenDialog1.FileName)) + ' Kb';
    StatusBar1.SetFocus;
end;

procedure TForm1.CheckBox11Click(Sender: TObject);
begin
  if CheckBox11.Checked = true then
  begin
    RadioButton1.Enabled := true;
    RadioButton2.Enabled := true;
    RadioButton3.Enabled := true;
    RadioButton4.Enabled := true;
  end else begin
    RadioButton1.Enabled := false;
    RadioButton2.Enabled := false;
    RadioButton3.Enabled := false;
    RadioButton4.Enabled := false;
    RadioButton1.Checked := false;
    RadioButton2.Checked := false;
    RadioButton3.Checked := false;
    RadioButton4.Checked := false;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteOptions;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i : integer;
begin
  // check if mpress.exe exists
  if not FileExists(MainDir + 'Data\mPress\mPress.exe') then
  begin

    MessageDlg('Error "mPress.exe" not found, check Folder ..\Data\mPress\..' +Chr(10)+
               'Download "mPress.exe" if not found' +Chr(10)
               ,mtWarning, [mbOK], 0);

    for i := 1 to 13 do
    begin
      TCheckbox(findcomponent('Checkbox' + IntToStr(i))).Enabled := false;
    end;

    for i := 1 to 4 do
    begin
      TRadioButton(findcomponent('RadioButton' + IntToStr(i))).Enabled := false;
    end;

    Button1.Enabled := false;
    Button3.Enabled := false;
    StatusBar1.Panels[5].Text := 'mPress.exe not found!';
  end;

  Application.HintPause := 0;
  Application.HintHidePause := 50000;
  StatusBar1.Panels[5].Text := 'mPress.exe found!';

  CheckBox2.Hint := 'If you pass this flag on the command line, the program' +#13#10 +
                    'will run in silent mode and suppress console' +#13#10 +
                    'output (log messages and version notes).';
  CheckBox4.Hint := 'Under PE32+ (64-bit Windows), Microsoft mandates' +#13#10 +
                    'table-based exception handling (stored in' +#13#10 +
                    'the .pdata and .xdata directory structure of the PE header).';
  CheckBox5.Hint := 'When running (or unpacking) a compressed or' +#13#10 +
                    'packed .NET file, a "NoPatch" error is often' +#13#10 +
                    'reported. This means that the tool being used' +#13#10+
                    '(such as an unpacker or deobfuscator) cannot' +#13#10+
                    'modify or patch the packed file because the' +#13#10+
                    '.NET structures have been altered by MPRESS.';
  CheckBox6.Hint := 'You can manage how your Mac builds and runs apps using the' +#13#10+
                    'lipo command. However, manually removing' +#13#10 +
                    'processor architectures like Intel (x86_64) or' +#13#10 +
                    'Apple Silicon (arm64) from macOS applications' +#13#10+
                    'is generally not recommended.';
  CheckBox8.Hint := 'Wenn Sie die Komprimierung der Programmressourcen' +#13#10 +
                    '(wie Symbole, Menüs und Versionsinformationen) überspringen' +#13#10 +
                    'möchten, müssen Sie den Befehlszeilenparameter -r verwenden.';
  CheckBox9.Hint := 'The "short license" simply means that you can compress' +#13#10 +
                    'your software, games, and libraries without being forced' +#13#10 +
                    'to make your source code open source, and without' +#13#10+
                    'paying licensing fees.';
  CheckBox10.Hint:= 'For the absolute best file size reduction in MPRESS,' +#13#10 +
                    'you should enable LZMA compression using the -x or -m9 flags.';
  CheckBox11.Hint:= 'To force MPRESS to use LZMAT compression, use the' +#13#10 +
                    'command-line flag -m when packing your executable.';
  RadioButton1.Hint:= 'LZ77 (Lempel-Ziv 77) is a lossless data compression method.';
  RadioButton2.Hint:= 'While the LZ77 algorithm works with old data, LZ78' +#13#10+
                      'targets new data. This is done by forward scanning' +#13#10+
                      'the input buffer, which is compared to a dictionary.';
  RadioButton3.Hint:= 'LZO (Lempel-Ziv-Oberhumer) is a particularly fast' +#13#10+
                      'variant of LZMA for runtime compression. The' +#13#10+
                      'designation LZ0 usually refers to version 0 of' +#13#10+
                      'the LZO stream format.';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ReadOptions;
end;

end.
