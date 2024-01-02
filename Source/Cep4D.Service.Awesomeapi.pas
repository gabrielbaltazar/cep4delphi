unit Cep4D.Service.Awesomeapi;

interface

uses
  System.SysUtils,
  System.JSON,
  Cep4D.Service.Interfaces,
  Cep4D.Service.ViaCep,
  Cep4D.Model.Interfaces,
  Cep4D.Component.Interfaces,
  Cep4D.Helper.JSON;

type
  TCep4DServiceAwesomeapi = class(TInterfacedObject, ICep4DService)
  private
    FAddress: ICep4DModelAddress;
    FZipCode: string;
    FComponent: ICep4DComponentRequest;
    FDecorator: ICep4DService;
  protected
    function ZipCode(AValue: string): ICep4DService;
    function Search: ICep4DModelAddress;

    function Address: ICep4DModelAddress;
    function Component(AValue: ICep4DComponentRequest): ICep4DService;
  public
    constructor Create;
    class function New: ICep4DService;
  end;

implementation

{ TCep4DServiceAwesomeapi }

function TCep4DServiceAwesomeapi.Address: ICep4DModelAddress;
begin
  if not Assigned(FAddress) then
    FAddress := NewAddress;
  Result := FAddress;
end;

function TCep4DServiceAwesomeapi.Component(AValue: ICep4DComponentRequest): ICep4DService;
begin
  Result := Self;
  FComponent := AValue;
  FDecorator.Component(AValue);
end;

constructor TCep4DServiceAwesomeapi.Create;
begin
  FDecorator := TCep4DServiceViaCep.New;
end;

class function TCep4DServiceAwesomeapi.New: ICep4DService;
begin
  Result := Self.Create;
end;

function TCep4DServiceAwesomeapi.ZipCode(AValue: string): ICep4DService;
begin
  Result := Self;
  FZipCode := AValue;
  FDecorator.ZipCode(AValue);
end;

function TCep4DServiceAwesomeapi.Search: ICep4DModelAddress;
var
  LUrl: string;
  LStatus: Integer;
  LJSON: TJSONObject;
begin
  try
    FAddress := NewAddress;
    FAddress.ZipCode(FZipCode);
    LUrl := Format('https://cep.awesomeapi.com.br/json/%s', [FAddress.ZipCode]);

    FComponent.BaseUrl(LUrl).Send;

    LJSON := FComponent.Response.GetJSONObject;
    if Assigned(LJSON) then
    begin
      LStatus := LJSON.ValueAsInteger('status');
      if LStatus >= 400 then
        raise Exception.Create(LJSON.ValueAsString('message'));

      FAddress
        .Address(LJSON.ValueAsString('address'))
        .AddressType(LJSON.ValueAsString('address_type'))
        .District(LJSON.ValueAsString('district'))
        .IbgeCode(LJSON.ValueAsInteger('city_ibge'))
        .City(LJSON.ValueAsString('city'))
        .State(LJSON.ValueAsString('state'))
        .Latitude(LJSON.ValueAsFloat('lat'))
        .Longitude(LJSON.ValueAsFloat('lng'))
        .DDD(LJSON.ValueAsInteger('ddd'));
    end;
  except
    FAddress := FDecorator.Search;
  end;
  Result := FAddress;
end;

end.
