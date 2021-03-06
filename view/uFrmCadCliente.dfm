object frmCadCliente: TfrmCadCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Clientes'
  ClientHeight = 439
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 604
    Height = 439
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lblNome: TLabel
      Left = 23
      Top = 10
      Width = 47
      Height = 19
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblIdentidade: TLabel
      Left = 24
      Top = 57
      Width = 89
      Height = 19
      Caption = 'Identidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCPF: TLabel
      Left = 195
      Top = 57
      Width = 31
      Height = 19
      Caption = 'CPF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTelefone: TLabel
      Left = 329
      Top = 57
      Width = 72
      Height = 19
      Caption = 'Telefone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEmail: TLabel
      Left = 24
      Top = 105
      Width = 45
      Height = 19
      Caption = 'Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNome: TEdit
      Left = 24
      Top = 32
      Width = 463
      Height = 21
      MaxLength = 50
      TabOrder = 0
    end
    object edtIdentidade: TEdit
      Left = 24
      Top = 80
      Width = 167
      Height = 21
      MaxLength = 8
      TabOrder = 1
    end
    object edtEmail: TEdit
      Left = 23
      Top = 128
      Width = 463
      Height = 21
      MaxLength = 30
      TabOrder = 4
      OnExit = edtEmailExit
    end
    object edtMaskCPF: TMaskEdit
      Left = 194
      Top = 80
      Width = 130
      Height = 21
      EditMask = '000\-000\-000\-00;1;_'
      MaxLength = 14
      TabOrder = 2
      Text = '   -   -   -  '
      OnExit = edtMaskCPFExit
    end
    object cxPageControl1: TcxPageControl
      Left = 23
      Top = 155
      Width = 561
      Height = 206
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Properties.ActivePage = tbsEndereco
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 202
      ClientRectLeft = 4
      ClientRectRight = 557
      ClientRectTop = 30
      object tbsEndereco: TcxTabSheet
        Caption = 'Endere'#231'o'
        ImageIndex = 0
        object lblCEP: TLabel
          Left = 10
          Top = 5
          Width = 32
          Height = 19
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210688
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblLogradouro: TLabel
          Left = 10
          Top = 59
          Width = 93
          Height = 19
          Caption = 'Logradouro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210688
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNumero: TLabel
          Left = 464
          Top = 63
          Width = 64
          Height = 19
          Caption = 'N'#250'mero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210688
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblBairro: TLabel
          Left = 10
          Top = 113
          Width = 50
          Height = 19
          Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210688
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPais: TLabel
          Left = 135
          Top = 5
          Width = 34
          Height = 19
          Caption = 'Pais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210688
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEstado: TLabel
          Left = 464
          Top = 113
          Width = 55
          Height = 19
          Caption = 'Estado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210688
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCidade: TLabel
          Left = 248
          Top = 113
          Width = 56
          Height = 19
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4210688
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtLogradouro: TEdit
          Left = 10
          Top = 82
          Width = 450
          Height = 27
          MaxLength = 50
          TabOrder = 2
        end
        object edtNumero: TEdit
          Left = 464
          Top = 82
          Width = 73
          Height = 27
          MaxLength = 4
          NumbersOnly = True
          TabOrder = 3
        end
        object edtBairro: TEdit
          Left = 10
          Top = 136
          Width = 233
          Height = 27
          MaxLength = 30
          TabOrder = 4
        end
        object edtCidade: TEdit
          Left = 248
          Top = 136
          Width = 212
          Height = 27
          MaxLength = 30
          TabOrder = 5
        end
        object cbEstado: TComboBox
          Left = 464
          Top = 136
          Width = 73
          Height = 27
          Style = csDropDownList
          ImeMode = imDisable
          MaxLength = 2
          TabOrder = 6
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PR'
            'PI'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
        end
        object cbPais: TComboBox
          Left = 135
          Top = 28
          Width = 323
          Height = 27
          Style = csDropDownList
          ItemIndex = 30
          TabOrder = 1
          Text = 'Brasil'
          Items.Strings = (
            'Afeganist'#227'o'
            #193'frica do sul'
            'Alb'#226'nia'
            'Alemanha'
            'Alg'#233'ria'
            'Andorra'
            'Angola'
            'Anguilla'
            'Ant'#225'rtida'
            'Ant'#237'gua e barbuda'
            'Antilhas holandesas'
            'Ar'#225'bia saudita'
            'Argentina'
            'Arm'#234'nia'
            'Aruba'
            'Austr'#225'lia'
            #193'ustria'
            'Azerbaij'#227'o'
            'Bahamas'
            'Bahrein'
            'Bangladesh'
            'Barbados'
            'Belarus'
            'B'#233'lgica'
            'Belize'
            'Benin'
            'Bermudas'
            'Bol'#237'via'
            'B'#243'snia-herzeg'#243'vina'
            'Botsuana'
            'Brasil'
            'Brunei'
            'Bulg'#225'ria'
            'Burkina fasso'
            'Burundi'
            'But'#227'o'
            'Cabo verde'
            'Camar'#245'es'
            'Camboja'
            'Canad'#225
            'Cazaquist'#227'o'
            'Chade'
            'Chile'
            'China'
            'Chipre'
            'Cingapura'
            'Col'#244'mbia'
            'Congo'
            'Cor'#233'ia do norte'
            'Cor'#233'ia do sul'
            'Costa do marfim'
            'Costa rica'
            'Cro'#225'cia (hrvatska)'
            'Cuba'
            'Dinamarca'
            'Djibuti'
            'Dominica'
            'Egito'
            'El salvador'
            'Emirados '#225'rabes unidos'
            'Equador'
            'Eritr'#233'ia'
            'Eslov'#225'quia'
            'Eslov'#234'nia'
            'Espanha'
            'Estados unidos'
            'Est'#244'nia'
            'Eti'#243'pia'
            'Federa'#231#227'o russa'
            'Fiji'
            'Filipinas'
            'Finl'#226'ndia'
            'Fran'#231'a'
            'Fran'#231'a metropolitana'
            'Gab'#227'o'
            'G'#226'mbia'
            'Gana'
            'Ge'#243'rgia'
            'Gibraltar'
            'Gr'#227'-bretanha (reino unido, uk)'
            'Granada'
            'Gr'#233'cia'
            'Groel'#226'ndia'
            'Guadalupe'
            'Guam (territ'#243'rio dos estados unidos)'
            'Guatemala'
            'Guiana'
            'Guiana francesa'
            'Guin'#233
            'Guin'#233' equatorial'
            'Guin'#233'-bissau'
            'Haiti'
            'Holanda'
            'Honduras'
            'Hong kong'
            'Hungria'
            'I'#234'men'
            'Ilha bouvet (territ'#243'rio da noruega)'
            'Ilha natal'
            'Ilha pitcairn'
            'Ilha reuni'#227'o'
            'Ilhas cayman'
            'Ilhas cocos'
            'Ilhas comores'
            'Ilhas cook'
            'Ilhas faeroes'
            'Ilhas falkland (malvinas)'
            'Ilhas ge'#243'rgia do sul e sandwich do sul'
            'Ilhas heard e mcdonald (territ'#243'rio da austr'#225'lia)'
            'Ilhas marianas do norte'
            'Ilhas marshall'
            'Ilhas menores dos estados unidos'
            'Ilhas norfolk'
            'Ilhas seychelles'
            'Ilhas solom'#227'o'
            'Ilhas svalbard e jan mayen'
            'Ilhas tokelau'
            'Ilhas turks e caicos'
            'Ilhas virgens (estados unidos)'
            'Ilhas virgens (inglaterra)'
            'Ilhas wallis e futuna'
            #205'ndia'
            'Indon'#233'sia'
            'Ir'#227
            'Iraque'
            'Irlanda'
            'Isl'#226'ndia'
            'Israel'
            'It'#225'lia'
            'Iugosl'#225'via'
            'Jamaica'
            'Jap'#227'o'
            'Jord'#226'nia'
            'K'#234'nia'
            'Kiribati'
            'Kuait'
            'Laos'
            'L'#225'tvia'
            'Lesoto'
            'L'#237'bano'
            'Lib'#233'ria'
            'L'#237'bia'
            'Liechtenstein'
            'Litu'#226'nia'
            'Luxemburgo'
            'Macau'
            'Maced'#244'nia'
            'Madagascar'
            'Mal'#225'sia'
            'Malaui'
            'Maldivas'
            'Mali'
            'Malta'
            'Marrocos'
            'Martinica'
            'Maur'#237'cio'
            'Maurit'#226'nia'
            'Mayotte'
            'M'#233'xico'
            'Micron'#233'sia'
            'Mo'#231'ambique'
            'Moldova'
            'M'#244'naco'
            'Mong'#243'lia'
            'Montserrat'
            'Myanma'
            'Nam'#237'bia'
            'Nauru'
            'Nepal'
            'Nicar'#225'gua'
            'N'#237'ger'
            'Nig'#233'ria'
            'Niue'
            'Noruega'
            'Nova caled'#244'nia'
            'Nova zel'#226'ndia'
            'Om'#227
            'Palau'
            'Panam'#225
            'Papua-nova guin'#233
            'Paquist'#227'o'
            'Paraguai'
            'Peru'
            'Polin'#233'sia francesa'
            'Pol'#244'nia'
            'Porto rico'
            'Portugal'
            'Qatar'
            'Quirguist'#227'o'
            'Rep'#250'blica centro-africana'
            'Rep'#250'blica dominicana'
            'Rep'#250'blica tcheca'
            'Rom'#234'nia'
            'Ruanda'
            'Saara ocidental'
            'Saint vincente e granadinas'
            'Samoa ocidental'
            'Samoa ocidental'
            'San marino'
            'Santa helena'
            'Santa l'#250'cia'
            'S'#227'o crist'#243'v'#227'o e n'#233'vis'
            'S'#227'o tom'#233' e pr'#237'ncipe'
            'Senegal'
            'Serra leoa'
            'S'#237'ria'
            'Som'#225'lia'
            'Sri lanka'
            'St. pierre and miquelon'
            'Suazil'#226'ndia'
            'Sud'#227'o'
            'Su'#233'cia'
            'Su'#237#231'a'
            'Suriname'
            'Tadjiquist'#227'o'
            'Tail'#226'ndia'
            'Taiwan'
            'Tanz'#226'nia'
            'Territ'#243'rio brit'#226'nico do oceano '#237'ndico'
            'Territ'#243'rios do sul da fran'#231'a'
            'Timor leste'
            'Togo'
            'Tonga'
            'Trinidad and tobago'
            'Tun'#237'sia'
            'Turcomenist'#227'o'
            'Turquia'
            'Tuvalu'
            'Ucr'#226'nia'
            'Uganda'
            'Uruguai'
            'Uzbequist'#227'o'
            'Vanuatu'
            'Vaticano'
            'Venezuela'
            'Vietn'#227
            'Zaire'
            'Z'#226'mbia'
            'Zimb'#225'bue')
        end
        object edtMaskCep: TMaskEdit
          Left = 10
          Top = 28
          Width = 118
          Height = 27
          EditMask = '99999-999;1;_'
          MaxLength = 9
          TabOrder = 0
          Text = '     -   '
          OnExit = edtMaskCepExit
          OnKeyDown = edtMaskCepKeyDown
        end
      end
      object tbsComplemento: TcxTabSheet
        Caption = 'Complemento'
        ImageIndex = 1
        object mmComplemento: TMemo
          Left = 0
          Top = 0
          Width = 553
          Height = 172
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
        end
      end
    end
    object btnGravar: TcxButton
      Left = 525
      Top = 380
      Width = 60
      Height = 45
      Cursor = crHandPoint
      Caption = 'Salvar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000021222100E8EA
        E9007E817E003A3B3A00B3B3B30055555500CCCCCC009999990030323000FFFF
        FF006A6B6A00414241002C2D2C00BFC2BF00A3A2A3008B8B8B00DDDFDD00F4F5
        F400292A2900626362007475740035363500B9B9B9004C4D4C00A0A1A000F1F2
        F1004A4C4A00868986002E2F2E00A8A9A8003C3D3C0090939100C5C8C6002424
        2400FAFAFA005A5D5B0048494800D3D3D3007A7D7B00E1E4E200848684003839
        3800BDBDBD00C4C6C5008E8E8E00D0D3D100666666002D2E2D002A2B2A00EDED
        ED0030303000F6F8F7009595950026272600F3F3F300363736006B6E6C004E50
        4F00A5A5A500B5B7B5003B3C3B003E3F3E00C9C9C9002123220056585600ABAD
        AB00D3D6D5002A2C2A00BDC0BD00333333002C2E2C0036363600808381003A3C
        3A00FFFFFF003E3E3E0075777600898989005B5E5C00383A3800F1F3F1002224
        220027282700DDE1DD0020222200A3A5A30024262400484A48008F918F00F3F5
        F3006D6F6D00A4A7A40000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000090909090909
        0909090909090909090909090909090909090909090909090909093333090909
        0909090909090909090909090909090909090948282209090909090909090909
        09090909090909090909073F3F55090909090909090909090909090909090909
        09443721213D2D0909090909090909090909090909090909101A004343212319
        090909090909090909090909090909502E21322F2F2F351B0909090909090909
        090909090909090252323232323230083B090909090909090909090909095B32
        0C083035430808431A100909090909090909090909203D2F451205180B2F4545
        435A3309090909090909090927402F1530131909250332150808070909090909
        09090911381C1512142209090906370829453D2B09090909090909070815304D
        0909090909093E29454F454E010909090909105708430709090909090909092A
        08373C452609090909094C08370409090909090909090909164529293C410909
        090917173E09090909090909090909090904083C293942090909313609090909
        090909090909090909091D1C4B290A3609090909090909090909090909090909
        0909093A083D3D1F090909090909090909090909090909090909090907451E24
        0D09090909090909090909090909090909090909093437031331090909090909
        09090909090909090909090909092C293D580909090909090909090909090909
        090909090909090F452909090909090909090909090909090909090909090909
        0E18090909090909090909090909090909090909090909090909}
      OptionsImage.Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnGravarClick
    end
    object cxBtnCancelar: TcxButton
      Left = 459
      Top = 380
      Width = 60
      Height = 45
      Cursor = crHandPoint
      Caption = 'Cancelar'
      Colors.Default = clWhite
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B0000000100000000000000000000CCCC
        CC00616161003B3B3B002525250099999900FFFFFF00F5F5F5001A1A1A007676
        7600EDEDED005656560013131300ACACAC002E2E2E000B0B0B004C4C4C00BCBC
        BC008F8F8F0008080800D7D7D700464646002121210033333300A0A0A0002828
        28006666660088888800FBFBFB005E5E5E0018181800D4D4D400050505004242
        42008585850050505000C6C6C60036363600747474009F9F9F00101010001E1E
        1E008282820016161600F1F1F100D3D3D3002A2A2A005C5C5C0096969600A6A6
        A6005454540066666600F7F7F700AFAFAF005A5A5A0030303000222222006F6F
        6F00FFFFFF001C1C1C000E0E0E00494949000A0A0A00DBDBDB003C3C3C000606
        0600F3F3F3002C2C2C008B8B8B00B2B2B2001414140060606000F9F9F900EFEF
        EF00383838004E4E4E00D9D9D900A3A3A300585858004A4A4A00444444009191
        9100999999006A6A6A00898989003E3E3E000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000060606060606
        060A27151300001315270A06060606060606060606060642120E000000000000
        00000E1242060606060606060606010E2020202004030304202020200E010606
        0606060606112813130E221F420606421F2A16131328110606060606010C1313
        132306060606060606060A0213130C01060606070E0F0F0F0F0F0B1C06060606
        06060606090F0F37340606303C3C3C3C3C3C3C0B1C0606060606060606473C3C
        30062C25280E0B2828282828361C060606060606060A3828252C31282844062F
        2828282828361C060606060606061B282831230C1E14061C1D460C0C0C0C1D1C
        060606060606142B0C23292B253406061C1D1E2B2B2B2B1D1C06060606060717
        2B29080810060606061C470808080808471C0606060606100808080810060606
        06061C020808080808021C060606061008080429403406060606061C02292929
        29291A1C0606074A29043629383F0606060606061C1A29292929291A1C064C16
        16360D161612060606060606061C1A16161616161A063016160D2C1538252C06
        0606060606061C1A3838383838025538152C061804043906060606060606061C
        1A04040404040404270606341519192206060606060606061C53191919191915
        340606061F172E2E094906060606060606061A2E2E2E171F0606060606241743
        4321303F070606073F051043431724060606060606062D230E0E0E0E3D2F2F3D
        0E0E0E0E232D060606060606060606074D323737373737373737324D07060606
        0606060606060606062C45534A17174A1A352C06060606060606}
      OptionsImage.Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4210688
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxBtnCancelarClick
    end
    object edtMaskTelefone: TMaskEdit
      Left = 330
      Top = 80
      Width = 154
      Height = 21
      EditMask = '!\(99\)00000-0000;1;_'
      MaxLength = 14
      TabOrder = 3
      Text = '(  )     -    '
      OnExit = edtMaskCPFExit
    end
  end
  object RESTClient: TRESTClient
    Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    BaseURL = 'http://viacep.com.br/ws'
    Params = <>
    HandleRedirects = True
    Left = 208
    Top = 104
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Resource = '01001000/json/'
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 312
    Top = 104
  end
  object RESTResponse: TRESTResponse
    Left = 416
    Top = 104
  end
  object RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter
    Dataset = MemTable
    FieldDefs = <>
    ResponseJSON = RESTResponse
    Left = 312
    Top = 168
  end
  object MemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 312
    Top = 232
  end
end
