object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 295
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 614
    Height = 295
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 63
      Height = 15
      Caption = 'Postal Code'
    end
    object Label2: TLabel
      Left = 16
      Top = 88
      Width = 69
      Height = 15
      Caption = 'Address Type'
    end
    object Label3: TLabel
      Left = 143
      Top = 88
      Width = 42
      Height = 15
      Caption = 'Address'
    end
    object Label4: TLabel
      Left = 447
      Top = 88
      Width = 37
      Height = 15
      Caption = 'District'
    end
    object Label5: TLabel
      Left = 16
      Top = 144
      Width = 55
      Height = 15
      Caption = 'IBGE Code'
    end
    object Label6: TLabel
      Left = 143
      Top = 144
      Width = 21
      Height = 15
      Caption = 'City'
    end
    object Label7: TLabel
      Left = 447
      Top = 144
      Width = 26
      Height = 15
      Caption = 'State'
    end
    object Label8: TLabel
      Left = 16
      Top = 200
      Width = 24
      Height = 15
      Caption = 'DDD'
    end
    object Label9: TLabel
      Left = 143
      Top = 200
      Width = 43
      Height = 15
      Caption = 'Latitude'
    end
    object Label10: TLabel
      Left = 270
      Top = 200
      Width = 54
      Height = 15
      Caption = 'Longitude'
    end
    object edtPostalCode: TEdit
      Left = 16
      Top = 34
      Width = 137
      Height = 23
      TabOrder = 0
      Text = '05424-020'
    end
    object btnSearch: TButton
      Left = 159
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Search'
      TabOrder = 1
      OnClick = btnSearchClick
    end
    object edtAddressType: TEdit
      Left = 16
      Top = 106
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 2
    end
    object edtAddress: TEdit
      Left = 143
      Top = 106
      Width = 298
      Height = 23
      ReadOnly = True
      TabOrder = 3
    end
    object edtDistrict: TEdit
      Left = 447
      Top = 106
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 4
    end
    object edtIbgeCode: TEdit
      Left = 16
      Top = 162
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 5
    end
    object edtCity: TEdit
      Left = 143
      Top = 162
      Width = 298
      Height = 23
      ReadOnly = True
      TabOrder = 6
    end
    object edtState: TEdit
      Left = 447
      Top = 162
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 7
    end
    object edtDDD: TEdit
      Left = 16
      Top = 218
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 8
    end
    object edtLatitude: TEdit
      Left = 143
      Top = 218
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 9
    end
    object edtLongitude: TEdit
      Left = 270
      Top = 218
      Width = 121
      Height = 23
      ReadOnly = True
      TabOrder = 10
    end
  end
end
