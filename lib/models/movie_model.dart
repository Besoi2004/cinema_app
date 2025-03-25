class Movie {
  final String poster, title, genre, synopsis;
  final double rating;
  final int duration;

  Movie({
    required this.poster,
    required this.title,
    required this.genre,
    required this.synopsis,
    required this.rating,
    required this.duration,
  });
}



List<Movie> movies = [
  Movie(
    poster:
        'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/thumbnail/190x260/2e2b8cd282892c71872b9e67d2cb5039/q/u/qu_nh_p_tr_ng_-_payoff_poster_-_kc_07032025_1_.jpg',
    title: 'QUỶ NHẬP TRÀNG ',
    genre: 'Horror',
    synopsis: 'Phim lấy cảm hứng từ câu chuyện có thật và “truyền thuyết kinh dị nhất về người chết sống lại” - Ở một ngôi làng vùng cao, cặp vợ chồng Quang và Như sống bằng nghề mai táng. Cuộc sống yên bình của họ bị xáo trộn khi phát hiện một cỗ quan tài vô chủ trên mảnh đất nhà mình. Từ đây, những hiện tượng kỳ lạ bắt đầu xảy ra và ám ảnh cả ngôi làng.',
    rating: 8.1,
    duration: 121,
  ),
  Movie(
    poster:
        'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_dai_chien_nguoi_khong_lo_7.jpg',
    title: 'Attack on Titan: The Last Attack',
    genre: "Action",
    synopsis: 'Trong cuộc chiến cuối cùng định đoạt số phận thế giới, Eren Yeager đã giải phóng sức mạnh tối thượng của các Titan. Dẫn đầu đội quân Titan Đại hình khổng lồ, Eren quyết tâm hủy diệt mọi kẻ thù đe dọa đến quê hương Eldia. Thế nhưng, cuộc chiến này không chỉ là về sự sống còn, mà còn là cuộc đối đầu giữa lòng thù hận và hy vọng. Kết thúc khúc hùng ca đầy bi tráng, di sản của chiến tranh và những ám ảnh về tự do vẫn tiếp tục đeo bám nhân loại, để lại câu hỏi về giá trị của sự hy sinh và tự do thật sự.',
    rating: 9.2,
    duration: 144,
  ),
  
  Movie(
    poster:
        'https://yeuphim.mom/storage/images/ho-den-tu-than/4cee31c3afd0fbfd11ed4f14b1bfd816.jpg',
    title: 'INTERSTELLAR',
    genre: 'Science fiction',
    synopsis: 'Một đoàn thám hiểm vũ trụ sử dụng một hố đen mới được khám phá để du hành xuyên không gian đến những vì sao xa xôi và tìm kiếm hy vọng cho loài người. “Interstellar” là biên niên ký về cuộc phiêu lưu vĩ đại của một nhóm các nhà thám hiểm sử dụng khám phá mới về lỗ đen vũ trụ để vượt qua các giới hạn thông thường trong du hành không gian, chinh phục khoảng không mênh mông trên một chuyến hành trình xuyên dải ngân hà.. Cùng trải nghiệm một INTERSTELLAR hoàn toàn khác biệt. Siêu phẩm của đạo diễn Christopher Nolan sẽ trở lại ĐỘC QUYỀN VỚI ĐỊNH DẠNG IMAX từ ngày 28.02.2025',
    rating: 9.0,
    duration: 169,
  ),
  Movie(
      poster:
          'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/thumbnail/190x260/2e2b8cd282892c71872b9e67d2cb5039/d/i/digitalkv.jpg',
      title: 'FLOW',
      genre: 'Adventure',
      synopsis: 'Trước bối cảnh hậu tận thế, chú mèo xám nhút nhát, vốn luôn sợ nước phải rời bỏ vùng an toàn khi căn nhà thân yêu bị cuốn trôi bởi cơn lũ dữ. Trên hành trình vượt đại dương mênh mông, chú mèo cùng những người bạn đồng hành (Capybara, chó Labrador Retriever, Vượn Cáo, chim Thư ký) phải học cách vượt qua nỗi sợ và chấp nhận những điểm khác biệt để cùng nhau tồn tại.',
      rating: 8.9,
      duration: 89),
  Movie(
    poster: 'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/thumbnail/190x260/2e2b8cd282892c71872b9e67d2cb5039/p/o/poster_emma_va_vuong_quoc_ti_hon_2_1_.jpg',
    title: 'LITTLE EMMA',
    genre: 'Adventure',
    synopsis: 'Emma, một cô gái tí hon được nhận nuôi bởi các động vật, khao khát tìm ra sự thật về nguồn gốc con người của mình. Nhưng khi cô phát hiện ra một hòn đảo ẩn chứa đầy những người tí hon, đó không phải là câu chuyện cổ tích mà cô mong đợi. Liệu cô có dám đánh đổi tất cả những gì mình từng biết để khám phá những bí mật từ quá khứ?',
    rating: 8.6,
    duration: 80,
  )
];

class Movierl {
  final String title;
  final String poster;
  final String genre;
  final String releaseDate;

  Movierl({
    required this.title,
    required this.poster,
    required this.genre,
    required this.releaseDate,
  });
}

List<Movierl> upcomingMovies = [
  Movierl(
    title: "A MINECRAFT MOVIE",
    poster: "https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/thumbnail/190x260/2e2b8cd282892c71872b9e67d2cb5039/p/o/poster_minecraft_1.jpg",
    genre: "Action, Adventure, Family, Fantasy",
    releaseDate: "Apr 4, 2025",
  ),
  Movierl(
    title: "Kimetsu No Yaiba The Movie: Infinity Castle",
    poster: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcT2TtKwsS_K8tcJmg3lLOeR5HG-yKTCF1IUB2jDPlMlw5bkRdyD",
    genre: "Adventure, Animation",
    releaseDate: "December 2025",
  ),
  Movierl(
    title: "CAPTAIN AMERICA: BRAVE NEW WORLD",
    poster: "https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/thumbnail/190x260/2e2b8cd282892c71872b9e67d2cb5039/c/a/captain_america_th_gi_i_m_i_-_official_poster.jpg",
    genre: "Action, Science Fiction",
    releaseDate: "May 2025",
  ),
  Movierl(
    title: "ĐỊA ĐẠO: MẶT TRỜI TRONG BÓNG TỐI",
    poster: "https://www.bhdstar.vn/wp-content/uploads/2025/03/referenceSchemeHeadOfficeallowPlaceHoldertrueheight700ldapp-22.jpg",
    genre: "History",
    releaseDate: "Apr 4, 2025",
  ),
  Movierl(
    title: "DORAEMON THE MOVIE: NOBITA'S ART WORLD TALES",
    poster: "https://www.bhdstar.vn/wp-content/uploads/2025/03/referenceSchemeHeadOfficeallowPlaceHoldertrueheight700ldapp-30.jpg",
    genre: "Adventure, Animation",
    releaseDate: "May 23, 2025",
  ),
  Movierl(
    title: "PENGANTIN IBLIS",
    poster: "https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/thumbnail/190x260/2e2b8cd282892c71872b9e67d2cb5039/3/5/350x495-cuoima.jpg",
    genre: "Horror",
    releaseDate: "Feb 28, 2025",
  ),
];
