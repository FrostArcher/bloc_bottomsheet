import 'package:equatable/equatable.dart';

class CompanyDetails extends Equatable {
  final int id;
  final String user;
  final String name;
  final String address;
  final String email;
  final String latitude;
  final String longitude;
  final String dealer_image;
  final double avg_rating;
  final String phone;
  final int following;
  final int reviews;
  final bool isFollowing;
  final RatingCount ratingCount;

  const CompanyDetails(
      {this.id,
      this.user,
      this.name,
      this.address,
      this.email,
      this.latitude,
      this.longitude,
      this.dealer_image,
      this.avg_rating,
      this.phone,
      this.following,
      this.reviews,
        this.ratingCount,
      this.isFollowing});

  @override
  // TODO: implement props
  List<Object> get props => [
    id,
    user,
    name,
    address,
    email,
    latitude,
    longitude,
    dealer_image,
    avg_rating,
    phone,
    following,
    reviews,
    isFollowing,
    ratingCount,
  ];

  factory CompanyDetails.fromJson(Map<String, dynamic> str){
    return CompanyDetails(
      id: str["id"],
      user: str["user"],
      name: str["name"],
      address: str["address"],
      email: str["email"],
      latitude: str["latitude"],
      longitude: str["longitude"],
      dealer_image: str["dealer_image"],
      avg_rating: str["avg_rating"],
      phone: str["phone"],
      following: str["following"],
      reviews: str["reviews"],
      isFollowing: str["isFollowing"],
      ratingCount: RatingCount.fromJson(str["rating_count"])
    );
  }

  @override
  String toString() {
    return 'CompanyDetails{id: $id, user: $user, name: $name, address: $address, email: $email, latitude: $latitude, longitude: $longitude, dealer_image: $dealer_image, avg_rating: $avg_rating, phone: $phone, following: $following, reviews: $reviews, isFollowing: $isFollowing, ratingCount: $ratingCount}';
  }
}

class RatingCount{
  final int oneStar;
  final int twoStar;
  final int threeStar;
  final int fourStar;
  final int fiveStar;

  const RatingCount({this.oneStar, this.twoStar, this.threeStar, this.fourStar, this.fiveStar});

  factory RatingCount.fromJson(Map<String, dynamic> str){
    return RatingCount(
      oneStar: str["1"],
      twoStar: str["2"],
      threeStar: str["3"],
      fourStar: str["4"],
      fiveStar: str["5"],
    );
  }

  @override
  String toString() {
    return 'RatingCount{oneStar: $oneStar, twoStar: $twoStar, threeStar: $threeStar, fourStar: $fourStar, fiveStar: $fiveStar}';
  }
}
