class Cast {
  List<Actor> actors = new List();

  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final actor = Actor.fromJsonMap(item);
      actors.add(actor);
    });
  }
}

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  getPhoto() {
    if (profilePath == null) {
      return 'https://lh3.googleusercontent.com/proxy/270pDrXdyfK6A89laakzAVt4_sQMoXOk_Qc79wCDyHUb71Y6zq_bJsjaqSrl3XYwqUsyAspKp1pku9lB6ihaHuci4UBr-aWy4ZZ9roGynCKS3Wnr1CERqhSRyTbdWvY';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}
//https://nitroflare.com/view/15ED329E41ED21E/ph5e43b2d9a735e.mp4/free
