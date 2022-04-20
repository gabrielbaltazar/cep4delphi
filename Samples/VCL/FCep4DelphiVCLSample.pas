unit FCep4DelphiVCLSample;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    pnlTop: TPanel;
    Label1: TLabel;
    edtZipCode: TEdit;
    btnSearch: TButton;
    Label2: TLabel;
    edtAddressType: TEdit;
    Label3: TLabel;
    edtAddress: TEdit;
    Label4: TLabel;
    edtDistrict: TEdit;
    Label5: TLabel;
    edtIbgeCode: TEdit;
    Label6: TLabel;
    edtCity: TEdit;
    edtState: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtDDD: TEdit;
    Label9: TLabel;
    edtLatitude: TEdit;
    Label10: TLabel;
    edtLongitude: TEdit;
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Cep4D;

procedure TForm1.btnSearchClick(Sender: TObject);
var
  LAddress: ICep4DModelAddress;
begin
  LAddress := GetCep4D
                .ZipCode(edtZipCode.Text)
                .Search;

  edtAddressType.Text := LAddress.AddressType;
  edtAddress.Text := LAddress.Address;
  edtDistrict.Text := LAddress.District;
  edtIbgeCode.Text := LAddress.IbgeCode.ToString;
  edtCity.Text := LAddress.City;
  edtState.Text := LAddress.State;
  edtDDD.Text := LAddress.DDD.ToString;
  edtLatitude.Text := LAddress.Latitude.ToString;
  edtLongitude.Text := LAddress.Longitude.ToString;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
