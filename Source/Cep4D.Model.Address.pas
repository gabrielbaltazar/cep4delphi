unit Cep4D.Model.Address;

interface

uses
  Cep4D.Model.Interfaces,
  System.SysUtils;

type TCep4DModelAddress = class(TInterfacedObject, ICep4DModelAddress)

  private
    FZipCode: String;
    FAddress: String;
    FAddressType: string;
    FComplement: string;
    FDistrict: String;
    FCity: string;
    FIbgeCode: Integer;
    FState: string;
    FDDD: Integer;
    FLatitude: Double;
    FLongitude: Double;

  protected
    function ZipCode: String; overload;
    function ZipCode(AValue: String): ICep4DModelAddress; overload;

    function Address: String; overload;
    function Address(AValue: String): ICep4DModelAddress; overload;

    function AddressType: String; overload;
    function AddressType(AValue: String): ICep4DModelAddress; overload;

    function Complement: String; overload;
    function Complement(AValue: String): ICep4DModelAddress; overload;

    function District: String; overload;
    function District(AValue: String): ICep4DModelAddress; overload;

    function City: String; overload;
    function City(AValue: String): ICep4DModelAddress; overload;

    function IbgeCode: Integer; overload;
    function IbgeCode(AValue: Integer): ICep4DModelAddress; overload;

    function State: String; overload;
    function State(AValue: String): ICep4DModelAddress; overload;

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

function TCep4DModelAddress.City: String;
begin
  result := FCity;
end;

function TCep4DModelAddress.City(AValue: String): ICep4DModelAddress;
begin
  result := Self;
  FCity := AValue;
end;

function TCep4DModelAddress.Complement: String;
begin
  result := FComplement;
end;

function TCep4DModelAddress.Complement(AValue: String): ICep4DModelAddress;
begin
  result := Self;
  FComplement := AValue;
end;

function TCep4DModelAddress.DDD(AValue: Integer): ICep4DModelAddress;
begin
  Result := Self;
  FDDD := AValue;
end;

function TCep4DModelAddress.DDD: Integer;
begin
  result := FDDD;
end;

function TCep4DModelAddress.District(AValue: String): ICep4DModelAddress;
begin
  result := Self;
  FDistrict := AValue;
end;

function TCep4DModelAddress.District: String;
begin
  result := FDistrict;
end;

function TCep4DModelAddress.IbgeCode(AValue: Integer): ICep4DModelAddress;
begin
  result := Self;
  FIbgeCode := AValue;
end;

function TCep4DModelAddress.IbgeCode: Integer;
begin
  result := FIbgeCode;
end;

function TCep4DModelAddress.Latitude: Double;
begin
  result := FLatitude;
end;

function TCep4DModelAddress.Latitude(AValue: Double): ICep4DModelAddress;
begin
  result := Self;
  FLatitude := AValue;
end;

function TCep4DModelAddress.Longitude: Double;
begin
  result := FLongitude;
end;

function TCep4DModelAddress.Longitude(AValue: Double): ICep4DModelAddress;
begin
  result := Self;
  FLongitude := AValue;
end;

class function TCep4DModelAddress.New: ICep4DModelAddress;
begin
  result := Self.Create;
end;

function TCep4DModelAddress.ZipCode: String;
begin
  result := FZipCode;
end;

function TCep4DModelAddress.ZipCode(AValue: String): ICep4DModelAddress;
var
  I: Integer;
begin
  result := Self;
  FZipCode := EmptyStr;
  for I := 1 to AValue.Length do
  begin
    if CharInSet(AValue[I], ['0'..'9']) then
      FZipCode := FZipCode + AValue[I];
  end;
end;

function TCep4DModelAddress.State(AValue: String): ICep4DModelAddress;
begin
  result := Self;
  FState := AValue;
end;

function TCep4DModelAddress.State: String;
begin
  result := FState;
end;

function TCep4DModelAddress.Address(AValue: String): ICep4DModelAddress;
begin
  result := Self;
  FAddress := AValue;
end;

function TCep4DModelAddress.Address: String;
begin
  result := FAddress;
end;

function TCep4DModelAddress.AddressType: String;
begin
  result := FAddressType;
end;

function TCep4DModelAddress.AddressType(AValue: String): ICep4DModelAddress;
begin
  result := Self;
  FAddressType := AValue;
end;

end.
