unit Cep4D.Model.Address;

interface

uses
  Cep4D.Model.Interfaces,
  System.SysUtils;

type
  TCep4DModelAddress = class(TInterfacedObject, ICep4DModelAddress)
  private
    FZipCode: string;
    FAddress: string;
    FAddressType: string;
    FComplement: string;
    FDistrict: string;
    FCity: string;
    FIbgeCode: Integer;
    FState: string;
    FDDD: Integer;
    FLatitude: Double;
    FLongitude: Double;
  protected
    function ZipCode: string; overload;
    function ZipCode(AValue: string): ICep4DModelAddress; overload;

    function Address: string; overload;
    function Address(AValue: string): ICep4DModelAddress; overload;

    function AddressType: string; overload;
    function AddressType(AValue: string): ICep4DModelAddress; overload;

    function Complement: string; overload;
    function Complement(AValue: string): ICep4DModelAddress; overload;

    function District: string; overload;
    function District(AValue: string): ICep4DModelAddress; overload;

    function City: string; overload;
    function City(AValue: string): ICep4DModelAddress; overload;

    function IbgeCode: Integer; overload;
    function IbgeCode(AValue: Integer): ICep4DModelAddress; overload;

    function State: string; overload;
    function State(AValue: string): ICep4DModelAddress; overload;

    function DDD: Integer; overload;
    function DDD(AValue: Integer): ICep4DModelAddress; overload;

    function Latitude: Double; overload;
    function Latitude(AValue: Double): ICep4DModelAddress; overload;

    function Longitude: Double; overload;
    function Longitude(AValue: Double): ICep4DModelAddress; overload;
  public
    class function New: ICep4DModelAddress;
  end;

implementation

{ TCep4DModelAddress }

function TCep4DModelAddress.City: string;
begin
  Result := FCity;
end;

function TCep4DModelAddress.City(AValue: string): ICep4DModelAddress;
begin
  Result := Self;
  FCity := AValue;
end;

function TCep4DModelAddress.Complement: string;
begin
  Result := FComplement;
end;

function TCep4DModelAddress.Complement(AValue: string): ICep4DModelAddress;
begin
  Result := Self;
  FComplement := AValue;
end;

function TCep4DModelAddress.DDD(AValue: Integer): ICep4DModelAddress;
begin
  Result := Self;
  FDDD := AValue;
end;

function TCep4DModelAddress.DDD: Integer;
begin
  Result := FDDD;
end;

function TCep4DModelAddress.District(AValue: string): ICep4DModelAddress;
begin
  Result := Self;
  FDistrict := AValue;
end;

function TCep4DModelAddress.District: string;
begin
  Result := FDistrict;
end;

function TCep4DModelAddress.IbgeCode(AValue: Integer): ICep4DModelAddress;
begin
  Result := Self;
  FIbgeCode := AValue;
end;

function TCep4DModelAddress.IbgeCode: Integer;
begin
  Result := FIbgeCode;
end;

function TCep4DModelAddress.Latitude: Double;
begin
  Result := FLatitude;
end;

function TCep4DModelAddress.Latitude(AValue: Double): ICep4DModelAddress;
begin
  Result := Self;
  FLatitude := AValue;
end;

function TCep4DModelAddress.Longitude: Double;
begin
  Result := FLongitude;
end;

function TCep4DModelAddress.Longitude(AValue: Double): ICep4DModelAddress;
begin
  Result := Self;
  FLongitude := AValue;
end;

class function TCep4DModelAddress.New: ICep4DModelAddress;
begin
  Result := Self.Create;
end;

function TCep4DModelAddress.ZipCode: string;
begin
  Result := FZipCode;
end;

function TCep4DModelAddress.ZipCode(AValue: string): ICep4DModelAddress;
var
  I: Integer;
begin
  Result := Self;
  FZipCode := EmptyStr;
  for I := 1 to AValue.Length do
  begin
    if CharInSet(AValue[I], ['0'..'9']) then
      FZipCode := FZipCode + AValue[I];
  end;
end;

function TCep4DModelAddress.State(AValue: string): ICep4DModelAddress;
begin
  Result := Self;
  FState := AValue;
end;

function TCep4DModelAddress.State: string;
begin
  Result := FState;
end;

function TCep4DModelAddress.Address(AValue: string): ICep4DModelAddress;
begin
  Result := Self;
  FAddress := AValue;
end;

function TCep4DModelAddress.Address: string;
begin
  Result := FAddress;
end;

function TCep4DModelAddress.AddressType: string;
begin
  Result := FAddressType;
end;

function TCep4DModelAddress.AddressType(AValue: string): ICep4DModelAddress;
begin
  Result := Self;
  FAddressType := AValue;
end;

end.
