# CEP4Delphi
Search for an address by a specific zip code

## Search Address
```delphi
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
```
