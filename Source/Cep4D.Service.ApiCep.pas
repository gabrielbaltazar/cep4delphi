unit Cep4D.Service.ApiCep;

interface

uses
  System.SysUtils,
  System.JSON,
  Cep4D.Service.Interfaces,
  Cep4D.Model.Interfaces,
  Cep4D.Component.Interfaces,
  Cep4D.Helper.JSON;

type TCep4DServiceApiCep = class(TInterfacedObject, ICep4DService)

  private
    FAddress: ICep4DModelAddress;
    FZipCode: String;
    FComponent: ICep4DComponentRequest;

  protected
    function ZipCode(AValue: String): ICep4DService;
    function Search: ICep4DModelAddress;

    function Address: ICep4DModelAddress;
    function Component(AValue: ICep4DComponentRequest): ICep4DService;

  public
    class function New: ICep4DService;

end;

implementation

{ TCep4DServiceApiCep }

function TCep4DServiceApiCep.Address: ICep4DModelAddress;
begin
  if not Assigned(FAddress) then
    FAddress := NewAddress;
  result := FAddress;
end;

function TCep4DServiceApiCep.Component(AValue: ICep4DComponentRequest): ICep4DService;
begin
  result := Self;
  FComponent := AValue;
end;

class function TCep4DServiceApiCep.New: ICep4DService;
begin
  result := Self.Create;
end;

function TCep4DServiceApiCep.ZipCode(AValue: String): ICep4DService;
begin
  result := Self;
  FZipCode := AValue;
end;

function TCep4DServiceApiCep.Search: ICep4DModelAddress;
var
  LUrl: string;
  LStatus: Integer;
  LMessage: string;
  LJSON: TJSONObject;
begin
  FAddress := NewAddress;
  FAddress.ZipCode(FZipCode);
  LUrl := Format('https://ws.apicep.com/cep/%s.json', [FAddress.ZipCode]);

  FComponent
    .BaseUrl(LUrl)
    .Send;

  LJSON := FComponent.Response.GetJSONObject;
  if Assigned(LJSON) then
  begin
    LStatus := LJSON.ValueAsInteger('status');
    if LStatus >= 400 then
    begin
      LMessage := LJSON.ValueAsString('message');
      raise Exception.Create(LMessage);
    end;

    FAddress
      .Address(LJSON.valueAsString('address'))
      .District(LJSON.valueAsString('district'))
      .City(LJSON.valueAsString('city'))
      .State(LJSON.valueAsString('state'));
  end;

  result := FAddress;
end;

end.

