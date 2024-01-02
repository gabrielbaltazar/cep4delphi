unit Cep4D.Service.ApiCep;

interface

uses
  System.SysUtils,
  System.JSON,
  Cep4D.Service.Interfaces,
  Cep4D.Model.Interfaces,
  Cep4D.Component.Interfaces,
  Cep4D.Helper.JSON;

type
  TCep4DServiceApiCep = class(TInterfacedObject, ICep4DService)
  private
    FAddress: ICep4DModelAddress;
    FZipCode: string;
    FComponent: ICep4DComponentRequest;
  protected
    function ZipCode(AValue: string): ICep4DService;
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
  Result := FAddress;
end;

function TCep4DServiceApiCep.Component(AValue: ICep4DComponentRequest): ICep4DService;
begin
  Result := Self;
  FComponent := AValue;
end;

class function TCep4DServiceApiCep.New: ICep4DService;
begin
  Result := Self.Create;
end;

function TCep4DServiceApiCep.ZipCode(AValue: string): ICep4DService;
begin
  Result := Self;
  FZipCode := AValue;
end;

function TCep4DServiceApiCep.Search: ICep4DModelAddress;
var
  LUrl: string;
  LMessage: string;
  LStatus: Integer;
  LJSON: TJSONObject;
begin
  FAddress := NewAddress;
  FAddress.ZipCode(FZipCode);
  LUrl := Format('https://ws.apicep.com/cep/%s.json', [FAddress.ZipCode]);

  FComponent.BaseUrl(LUrl).Send;

  LJSON := FComponent.Response.GetJSONObject;
  if Assigned(LJSON) then
  begin
    LStatus := LJSON.ValueAsInteger('status');
    if LStatus >= 400 then
    begin
      LMessage := LJSON.ValueAsString('message');
      raise Exception.Create(LMessage);
    end;

    FAddress.Address(LJSON.ValueAsString('address'))
      .District(LJSON.ValueAsString('district'))
      .City(LJSON.ValueAsString('city'))
      .State(LJSON.ValueAsString('state'));
  end;

  Result := FAddress;
end;

end.

