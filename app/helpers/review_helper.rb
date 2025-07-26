module ReviewHelper
  def medium(medium)
    case medium
    when "theatre"
      "Theatre"
    when "cinema"
      "Cinema"
    when "music_recorded"
      "Recorded music"
    when "art_visual"
      "Visual art"
    end
  end

  def extra(medium, writer, director, artist, venue)
    case medium
    when "theatre"
      sanitize("By <span>#{writer}</span>")
    when "cinema"
      sanitize("Directed by <span>#{director}</span>")
    when "music_recorded"
      sanitize("By <span>#{artist}</span>")
    when "art_visual"
      venue
    end
  end

  def extra_2(medium, name, actors, label, date_release, date_opening, date_closing)
    case medium
    when "theatre"
      sanitize("Directed by <span>#{name}</span>")
    when "cinema"
      actors_string = ""
      actors = actors.split(', ')

      actors.each_with_index do |actor, i|
        if i == actors.length - 1
          actors_string = actors_string + "<span>#{actor}</name>"
        elsif i == actors.length - 2
          actors_string = actors_string + "<span>#{actor}</span> and "
        else
          actors_string = actors_string + "<span>#{actor}</span>, "
        end
      end

      sanitize("With #{actors_string}")
    when "music_recorded"
      sanitize("#{label}, <time datetime='#{date_release.strftime("%Y-%m-%d")}'>#{date_release.strftime("%Y")}</time>")
    when "art_visual"
      sanitize("<time datetime='#{date_opening.strftime("%Y-%m-%d")}'>#{date_opening.strftime("%-e %B %Y")}</time> to <time datetime='#{date_closing.strftime("%Y-%m-%d")}'>#{date_closing.strftime("%-e %B %Y")}</time>")
    end 
  end

  def extra_3(medium, name, country, date_release)
    case medium
    when "theatre"
      name
    when "cinema"
      sanitize("#{country}, <time datetime='#{date_release.strftime("%Y-%m-%d")}'>#{date_release.strftime('%Y')}</time>")
    end
  end

  def extra_4(medium, date_opening, date_closing, running_time)
    case medium
    when "theatre"
      sanitize("<time datetime='#{date_opening.strftime("%Y-%m-%d")}'>#{date_opening.strftime("%e %B %Y")}</time> to <time datetime='#{date_closing.strftime("%Y-%m-%d")}}'>#{date_closing.strftime("%-e %B %Y")}</time>")
    when "cinema"
      "#{running_time} minutes"
    end
  end
end

# getData() {
#   const formatDate = (rawDate, format) => {
#     let formattedDate = '';

#     if (rawDate) {
#       let date = new Date(rawDate);
#       let options = { 
#         year: 'numeric', 
#         month: 'long', 
#         day: 'numeric' 
#       };

#       switch (format) {
#         case 'y':
#           formattedDate = date.getFullYear();
#         break;

#         case 'y-m-d': 
#           formattedDate = `${date.getFullYear()}-${(date.getMonth() + 1).toString().padStart(2, '0')}-${date.getDate().toString().padStart(2, '0')}`;
#         break;

#         default:
#           formattedDate = date.toLocaleDateString('en-GB', options);
#       }
#     }

#     return formattedDate; 
#   }; 

#   const createExtraString = (extra) => {
#     let string = '';

#     if (extra) {
#       let extras = extra.split(',');

#       for (let i = 0; i < extras.length; i++) {
#         string += `<span>${extras[i].trim()}</span>`;

#         if (i === extras.length - 2) {
#           string += ` and `;
#         } else if (extras.length !== 0 && i !== extras.length - 1) {
#           string += `, `;
#         }
#       };
#     }

#     return string; 
#   };

#   let 
#     id = this.review.id,
#     medium = '',
#     title = this.review.title,
#     extra = '',
#     extra_2 = '',
#     extra_3 = '', 
#     extra_4 = '', 
#     img_thumb = this.review.img_thumb, 
#     img_main = this.review.img_main,
#     img_main_caption = this.review.img_main_caption;

#   switch (this.review.medium) {
#     case 'book':
#       medium = 'Book';
#       extra = `By ${createExtraString(this.review.author)}`;
#       extra_2 = `<span>${this.review.publisher}</span>, <time datetime="${formatDate(this.review.date_publication, 'y-m-d')}">${formatDate(this.review.date_publication, 'y')}</time>`;
#       break;

#     case 'theatre':
#       medium = 'Theatre',
#       extra = `By ${createExtraString(this.review.writer)}`;
#       extra_2 = `Directed by ${createExtraString(this.review.director)}`;
#       extra_3 = this.review.venue;
#       extra_4 = `<time datetime="${formatDate(this.review.date_opening, 'y-m-d')}">${formatDate(this.review.date_opening)}</time> to <time datetime="${formatDate(this.review.date_closing, 'y-m-d')}">${formatDate(this.review.date_closing)}</time>`;
#       break;

#     case 'cinema':
#       medium = 'Cinema';
#       extra = `Directed by ${createExtraString(this.review.director)}`;
#       extra_2 = `With ${createExtraString(this.review.actors)}`;
#       extra_3 = `${this.review.country}, <time datetime="${formatDate(this.review.date_release, 'y-m-d')}">${formatDate(this.review.date_release, 'y')}</time>`;
#       extra_4 = `${this.review.running_time} minutes`;
#       break;

#     case 'art_visual':
#       medium = 'Visual art';
#       extra = this.review.venue;
#       extra_2 = `<time datetime="${formatDate(this.review.date_opening, 'y-m-d')}">${formatDate(this.review.date_opening)}</time> to <time datetime="${formatDate(this.review.date_closing, 'y-m-d')}">${formatDate(this.review.date_closing)}</time>`;
#       break;

#     case 'music_performed':
#       medium = 'Live music';
#       extra = this.review.venue;
#       extra_2 = `<time datetime="${formatDate(this.review.date_event, 'y-m-d')}">${formatDate(this.review.date_event)}</time>`;
#       break;

#     case 'music_recorded':
#       medium = 'Recorded music';
#       extra = `By ${createExtraString(this.review.artist)}`;
#       extra_2 = `${this.review.label}, <time datetime="${formatDate(this.review.date_release, 'y-m-d')}">${formatDate(this.review.date_release, 'y')}</time>`;
#       break;
#   }

#   return {
#     id: id, 
#     medium: medium,
#     title: title, 
#     extra: extra, 
#     extra_2: extra_2,
#     extra_3: extra_3, 
#     extra_4: extra_4, 
#     img_thumb: img_thumb, 
#     img_main: img_main,
#     img_main_caption: img_main_caption
#   };
# }
