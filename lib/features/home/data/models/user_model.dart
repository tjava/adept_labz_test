import 'package:adept_labz_test/features/home/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.address,
    required super.phone,
    required super.website,
    required super.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: AddressModel.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: CompanyModel.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": AddressModel.fromJEntity(address).toJson(),
        "phone": phone,
        "website": website,
        "company": CompanyModel.fromJEntity(company).toJson(),
      };
}

class AddressModel extends AddressEntity {
  const AddressModel({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo,
  });

  factory AddressModel.fromJEntity(AddressEntity addressEntity) => AddressModel(
        street: addressEntity.street,
        suite: addressEntity.suite,
        city: addressEntity.city,
        zipcode: addressEntity.zipcode,
        geo: addressEntity.geo,
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: GeoModel.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": GeoModel.fromJEntity(geo).toJson(),
      };
}

class GeoModel extends GeoEntity {
  const GeoModel({required super.lat, required super.lng});

  factory GeoModel.fromJEntity(GeoEntity geoEntity) => GeoModel(
        lat: geoEntity.lat,
        lng: geoEntity.lng,
      );

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class CompanyModel extends CompanyEntity {
  const CompanyModel({
    required super.name,
    required super.catchPhrase,
    required super.bs,
  });

  factory CompanyModel.fromJEntity(CompanyEntity companyEntity) => CompanyModel(
        name: companyEntity.name,
        catchPhrase: companyEntity.catchPhrase,
        bs: companyEntity.bs,
      );

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
