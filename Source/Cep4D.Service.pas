unit Cep4D.Service;

interface

uses
  Cep4D.Model.Interfaces;

type
  ICep4DModelAddress = Cep4D.Model.Interfaces.ICep4DModelAddress;

  ICep4DService = interface
    ['{A3043859-B1F7-40DB-A6A6-136DAFEF5474}']
    function PostalCode(AValue: String): ICep4DService;
    function Get: ICep4DModelAddress;
  end;

implementation

end.
