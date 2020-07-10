import 'package:instagram_clone/src/models/post_model.dart';

class PostProvider{

  List<Post> posts = new List<Post>();

  List<Post> getPosts(){

    posts = [
      new Post(
        userName: "SibylWalker",
        userPhoto: "https://s3.amazonaws.com/uifaces/faces/twitter/kevinjohndayy/128.jpg",
        caption: "Suscipit sit dolores asperiores quia. Commodi nostrum sit ipsam voluptate corporis ipsa nisi ut. Vel tempora eos cumque sint maxime exercitationem. Ratione dolore rerum placeat repellat ad deserunt mollitia in. Provident at voluptas minima qui voluptas. Pariatur dolores perferendis earum voluptatem eius assumenda quam.",
        postPhoto: "https://images.pexels.com/photos/733853/pexels-photo-733853.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        date: "July 1",
        likes: 1180,
        topsLikes: ["Jennifer","Sigmund"]
      ),
       new Post(
        userName: "ChelseaSkiles",
        userPhoto: "https://s3.amazonaws.com/uifaces/faces/twitter/_kkga/128.jpg",
        caption: "Repellat laborum sit id.",
        postPhoto: "https://images.pexels.com/photos/827209/pexels-photo-827209.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        date: "July 2",
        likes: 150,
        topsLikes: ["Wyman","Mozelle"]
      ),
      new Post(
        userName: "PaxtonKautzer",
        userPhoto: "https://s3.amazonaws.com/uifaces/faces/twitter/conspirator/128.jpg",
        caption: "Est dolor sit in tempore perferendis qui tenetur est voluptas. Qui qui repudiandae. Repellat aut suscipit velit dolorum voluptas aut sit. Magni illum non ut quis est quibusdam. Consequuntur et consequatur est nesciunt.",
        postPhoto: "https://images.pexels.com/photos/597049/paris-france-eiffel-tower-597049.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        date: "July 4",
        likes: 252,
        topsLikes: ["Braulio","Dawn"]
      ),
      new Post(
        userName: "KaitlynMacejkovic",
        userPhoto: "https://s3.amazonaws.com/uifaces/faces/twitter/jacobbennett/128.jpg",
        caption: "Dolores aspernatur labore reprehenderit dolorem magni est tenetur. Necessitatibus enim sunt nemo laborum. Aut repellat ad ea pariatur eos. Quo aliquam eos minus aut eum rerum veritatis voluptas.",
        postPhoto: "https://images.pexels.com/photos/747964/pexels-photo-747964.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        date: "July 7",
        likes: 856,
        topsLikes: ["Koby","Evan"]
      ),
      new Post(
        userName: "HoracioMarks",
        userPhoto: "https://s3.amazonaws.com/uifaces/faces/twitter/keyuri85/128.jpg",
        caption: "Inventore maiores eaque rerum debitis accusantium.",
        postPhoto: "https://images.pexels.com/photos/247298/pexels-photo-247298.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        date: "July 7",
        likes: 506,
        topsLikes: ["Constance","Euna"]
      ),
      new Post(
        userName: "MittieStrosin",
        userPhoto: "https://s3.amazonaws.com/uifaces/faces/twitter/posterjob/128.jpg",
        caption: "Et eaque enim est voluptas omnis quo totam perferendis hic.",
        postPhoto: "https://images.pexels.com/photos/413885/pexels-photo-413885.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        date: "July 2",
        likes: 1523,
        topsLikes: ["Constantin","Sheridan"]
      ),
      new Post(
        userName: "StephanieSpinka",
        userPhoto: "https://s3.amazonaws.com/uifaces/faces/twitter/andrewabogado/128.jpg",
        caption: "Officia est dolor est aut autem quia.",
        postPhoto: "https://images.pexels.com/photos/3957987/pexels-photo-3957987.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        date: "July 5",
        likes: 856,
        topsLikes: ["Deontae","Eulalia"]
      )      
    ];
   
   return posts;

  }

}