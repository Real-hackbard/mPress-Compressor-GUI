object Form1: TForm1
  Left = 2047
  Top = 143
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'mPress Compressor Gui'
  ClientHeight = 583
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 324
    Height = 33
    Caption = 'mPress Compressor Gui'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 16
    Top = 72
    Width = 100
    Height = 13
    Caption = 'EXE Path Compress :'
  end
  object Label3: TLabel
    Left = 16
    Top = 534
    Width = 12
    Height = 13
    Caption = '...'
  end
  object Label4: TLabel
    Left = 32
    Top = 40
    Width = 443
    Height = 13
    Caption = 
      'MPRESS is a free, high-performance executable packer for PE32/PE' +
      '32+/.NET/MAC-DARWIN'
  end
  object Label5: TLabel
    Left = 8
    Top = 515
    Width = 62
    Height = 13
    Caption = 'Parameters :'
  end
  object Edit1: TEdit
    Left = 8
    Top = 88
    Width = 402
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object Button2: TButton
    Left = 416
    Top = 512
    Width = 73
    Height = 21
    Caption = 'Compress'
    Enabled = False
    TabOrder = 1
    TabStop = False
    OnClick = Button2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 564
    Width = 522
    Height = 19
    Panels = <
      item
        Text = 'Size :'
        Width = 35
      end
      item
        Text = '0'
        Width = 100
      end
      item
        Text = 'New Size :'
        Width = 65
      end
      item
        Text = '0'
        Width = 120
      end
      item
        Text = 'Status :'
        Width = 50
      end
      item
        Width = 50
      end>
    ExplicitTop = 558
    ExplicitWidth = 508
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 128
    Width = 123
    Height = 17
    Hint = 'Pass the -i flag'
    TabStop = False
    Caption = ' Ignore Compression'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object CheckBox2: TCheckBox
    Left = 16
    Top = 151
    Width = 53
    Height = 17
    TabStop = False
    Caption = ' Quiet'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object CheckBox3: TCheckBox
    Left = 16
    Top = 174
    Width = 97
    Height = 17
    Hint = 'Dont create Backfile'
    TabStop = False
    Caption = ' Create Backup'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object CheckBox4: TCheckBox
    Left = 16
    Top = 197
    Width = 177
    Height = 17
    TabStop = False
    Caption = ' Ignore Exception 64 Bit/PE 32+'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object CheckBox5: TCheckBox
    Left = 16
    Top = 220
    Width = 92
    Height = 17
    TabStop = False
    Caption = ' No Patch NET'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object CheckBox6: TCheckBox
    Left = 16
    Top = 243
    Width = 187
    Height = 17
    TabStop = False
    Caption = ' No Remove Architectures IMacOS'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object CheckBox7: TCheckBox
    Left = 16
    Top = 266
    Width = 47
    Height = 17
    TabStop = False
    Caption = ' Help'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object CheckBox8: TCheckBox
    Left = 16
    Top = 289
    Width = 137
    Height = 17
    TabStop = False
    Caption = ' No Compress Resource'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object CheckBox9: TCheckBox
    Left = 16
    Top = 312
    Width = 92
    Height = 17
    TabStop = False
    Caption = ' Short License'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object CheckBox10: TCheckBox
    Left = 288
    Top = 128
    Width = 139
    Height = 17
    TabStop = False
    Caption = ' Best LZMAT Parameters'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object CheckBox11: TCheckBox
    Left = 288
    Top = 174
    Width = 89
    Height = 17
    TabStop = False
    Caption = ' Force LZMAT'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = CheckBox11Click
  end
  object RadioButton1: TRadioButton
    Left = 304
    Top = 197
    Width = 49
    Height = 17
    Caption = 'LZ77'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object RadioButton2: TRadioButton
    Left = 304
    Top = 221
    Width = 49
    Height = 17
    Caption = 'LZ78'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
  end
  object RadioButton3: TRadioButton
    Left = 304
    Top = 246
    Width = 36
    Height = 17
    Caption = 'LZ0'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
  end
  object RadioButton4: TRadioButton
    Left = 304
    Top = 269
    Width = 97
    Height = 17
    Caption = ' LZ77/LZ78/LZ0'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
  end
  object Memo1: TMemo
    Left = 8
    Top = 349
    Width = 505
    Height = 137
    TabStop = False
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      '             MATCODE Compressor'
      '             ~~~~~~~~~~~~~~~~~~'
      '          Frequently Asked Questions'
      '          ~~~~~~~~~~~~~~~~~~~~~~~~~~'
      ''
      '[1]  Which compression algorithm uses MPRESS?'
      '[2]  What advantages of this compression?'
      '[3]  Whether I need to buy some license in order to use MPRESS?'
      '[4]  "In-place decompression" - How does it work?'
      '[5]  Why MPRESS does not have decompression option?'
      '[6]  Can MPRESS protect my program against crackers?'
      '[7]  Do compressed files load faster or slower?'
      '[8]  What should I use instead of Assembly.Location?'
      '[9]  What should I use instead of Module.FullyQualifiedName?'
      ''
      ''
      ''
      '[1]  Which compression algorithm uses MPRESS?'
      ''
      'A. LZMAT. It'#39's very similar to well known LZ77, but has some'
      '   advantages.'
      ''
      ''
      '[2]  What advantages of this compression?'
      ''
      'A. LZMAT does not require huge resources for compression, for'
      '   decompression it does not require resources at all.'
      '   It has extreamly fast compression/decompression speed,'
      '   a few times faster then LZ78 and even faster then LZO.'
      '   It could process unlimited size of blocks unlike LZ77/'
      '   LZ78/LZO with size of block limited to 64k. LZMAT has'
      '   very small decompression procedure which allows to make'
      '   in-place decomprassion.'
      ''
      '   '
      '[3]  Whether I need to buy some license in order to use MPRESS?'
      ''
      'A. No. MPRESS is absolutely free of charge software. Read the'
      '   license which is included in  the  distribution package.'
      '   MPRESS does not contain any code which is under different '
      '   license (i.e. GPL, LGPL etc.), therefore you can use MPRESS'
      '   for your commercial project without needs to make it'
      '   opensource.'
      ''
      ''
      '[4]  "In-place decompression" - How does it work?'
      ''
      'A. Technique wich decompresses data into the same memory'
      '   called "in-place decompression".'
      '   MPRESS does in-place decompression of the compressed data.'
      '   This means that the applications packed with MPRESS does'
      '   not require more virtual memory than the original unpacked'
      '   versions.'
      ''
      ''
      '[5]  Why MPRESS does not have decompression option?'
      ''
      'A. It was planned in earliest releases to make such option for'
      '   decompression the compressed application, but then we'#39've'
      '   figured out that it is not required. Most peaples are using'
      '   packers not only to compress the application, but to protect'
      
        '   their properties against decompilation and reverce engenering' +
        '.'
      '   MPRESS has the backup option in case if you would need the'
      '   original application.'
      ''
      ''
      '[6]  Can MPRESS protect my program against crackers?'
      ''
      'A. MPRESS is not an envelope-protector, it is only a packer.'
      '   But MPRESS is a good defense against non-professional'
      '   hacker or reverce engeneres.'
      ''
      ''
      '[7]  Do compressed files load faster or slower?'
      ''
      'A. Most time, especially DLLs are loaded mutch faster, because'
      '   they are smaller and require less read operations to load'
      '   the executable image. '
      ''
      ''
      '[8]  I got a warning while compressing MS.NET application:'
      '    "Assembly.Location property found - Will become null-string'
      '     inside the compressed application."'
      '     What should I use instead of Assembly.Location?'
      ''
      'A. You could use instead of Assembly.Location one of'
      '   Environment.CommandLine'
      '   Process.StartInfo.FileName'
      '   or Process.MainModule.ModuleName'
      ''
      ''
      '[9]  What should I use instead of Module.FullyQualifiedName'
      '   in my MS.NET application?')
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 18
  end
  object CheckBox12: TCheckBox
    Left = 320
    Top = 514
    Width = 97
    Height = 17
    TabStop = False
    Caption = 'Show Console'
    TabOrder = 19
  end
  object CheckBox13: TCheckBox
    Left = 224
    Top = 514
    Width = 73
    Height = 17
    TabStop = False
    Caption = 'Dump HEX'
    TabOrder = 20
  end
  object Button3: TButton
    Left = 416
    Top = 88
    Width = 33
    Height = 21
    Caption = '...'
    TabOrder = 21
    TabStop = False
    OnClick = Button3Click
  end
  object Button1: TButton
    Left = 416
    Top = 310
    Width = 73
    Height = 21
    Caption = 'Uncheck all'
    TabOrder = 22
    TabStop = False
    OnClick = Button1Click
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.exe'
    Filter = 'Programme EXE|*.exe'
    Options = [ofHideReadOnly]
    Title = 'Programme EXE - UPX GUI'
    Left = 344
    Top = 368
  end
end
