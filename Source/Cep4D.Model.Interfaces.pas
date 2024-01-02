unit Cep4D.Model.Interfaces;

interface

type
  ICep4DModelAddress = interface
    ['{21B18D61-5F4F-442C-9C01-2CC3275F0C2B}']
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
  end;

function NewAddress: ICep4DModelAddress;

implementation

uses
  Cep4D.Model.Address;

function NewAddress: ICep4DModelAddress;
begin
  Result := TCep4DModelAddress.New;
end;

end.
