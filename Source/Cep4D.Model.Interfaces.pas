unit Cep4D.Model.Interfaces;

interface

type
  ICep4DModelAddress = interface
    ['{21B18D61-5F4F-442C-9C01-2CC3275F0C2B}']
    function PostalCode: String; overload;
    function PostalCode(AValue: String): ICep4DModelAddress; overload;

    function Street: String; overload;
    function Street(AValue: String): ICep4DModelAddress; overload;

    function StreetType: String; overload;
    function StreetType(AValue: String): ICep4DModelAddress; overload;

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
  end;

function NewAddress: ICep4DModelAddress;

implementation

uses
  Cep4D.Model.Address;

function NewAddress: ICep4DModelAddress;
begin
  result := TCep4DModelAddress.New;
end;

end.
