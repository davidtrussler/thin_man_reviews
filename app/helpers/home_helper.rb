# TODO: 
# - consider using link_to here for the anchor element
# - only use id (and not title) in href
#   - I think this is not required functionally but only there for SEO
#  - make review_path work with the id

module HomeHelper
  def listing_link(review)
    if review.thumbnail_image.attached?
      img_thumb = image_tag review.thumbnail_image
    else
      img_thumb = image_tag "no-image-fallback-thumb.png"
    end

    link_to sanitize(
      "<div class='listing__image'>" + img_thumb + "</div>
        <div class='listing__content'>
          <p class='listing__medium'>#{medium_string(review.medium)}</p>
          <p class='listing__title'>#{review.title}</p>
          <p class='listing__extra'>#{extra_string(review.medium, review)}</span></p>
        </div>"
    ), "review/#{review.id}", class: 'listing__item'
  end

  # TODO:
  # - Should these be in private methods?
  # - Add other medis
  # - Replace with switch statements
  # - Avoid duplication with the review helper

  def medium_string(medium)
    if medium == "theatre"
      "Theatre"
    elsif medium == "cinema"
      "Cinema"
    elsif medium == "music_recorded"
      "Recorded music"
    end
  end

  def extra_string(medium, review)
    if medium == "theatre"
      extra = "By #{review.writer}"
    elsif medium == "cinema"
      extra = "Directed by #{review.director}"
    elsif medium == "music_recorded"
      extra = "By #{review.artist}"
    end
  end
end

# class ListingData {
#   constructor(review) {
#     this.review = review; 
#   }

#   getData() {
#     const formatDate = (rawDate, format) => {
#       let formattedDate = '';

#       if (rawDate) {
#         let date = new Date(rawDate);
#         let options = { 
#           year: 'numeric', 
#           month: 'long', 
#           day: 'numeric' 
#         };

#         switch (format) {
#           case 'y':
#             formattedDate = date.getFullYear();
#           break;

#           case 'y-m-d': 
#             formattedDate = `${date.getFullYear()}-${(date.getMonth() + 1).toString().padStart(2, '0')}-${date.getDate().toString().padStart(2, '0')}`;
#           break;

#           default:
#             formattedDate = date.toLocaleDateString('en-GB', options);
#         }
#       }

#       return formattedDate; 
#     }; 

#     const createExtraString = (extra) => {
#       let string = '';

#       if (extra) {
#         let extras = extra.split(',');

#         for (let i = 0; i < extras.length; i++) {
#           string += `<span>${extras[i].trim()}</span>`;

#           if (i === extras.length - 2) {
#             string += ` and `;
#           } else if (extras.length !== 0 && i !== extras.length - 1) {
#             string += `, `;
#           }
#         };
#       }

#       return string; 
#     };

#     let 
#       id = this.review.id,
#       medium = '',
#       title = this.review.title,
#       extra = '',
#       extra_2 = '',
#       extra_3 = '', 
#       extra_4 = '', 
#       img_thumb = this.review.img_thumb, 
#       img_main = this.review.img_main,
#       img_main_caption = this.review.img_main_caption;

#     switch (this.review.medium) {
#       case 'book':
#         medium = 'Book';
#         extra = `By ${createExtraString(this.review.author)}`;
#         extra_2 = `<span>${this.review.publisher}</span>, <time datetime="${formatDate(this.review.date_publication, 'y-m-d')}">${formatDate(this.review.date_publication, 'y')}</time>`;
#         break;

#       case 'theatre':
#         medium = 'Theatre',
#         extra = `By ${createExtraString(this.review.writer)}`;
#         extra_2 = `Directed by ${createExtraString(this.review.director)}`;
#         extra_3 = this.review.venue;
#         extra_4 = `<time datetime="${formatDate(this.review.date_opening, 'y-m-d')}">${formatDate(this.review.date_opening)}</time> to <time datetime="${formatDate(this.review.date_closing, 'y-m-d')}">${formatDate(this.review.date_closing)}</time>`;
#         break;

#       case 'cinema':
#         medium = 'Cinema';
#         extra = `Directed by ${createExtraString(this.review.director)}`;
#         extra_2 = `With ${createExtraString(this.review.actors)}`;
#         extra_3 = `${this.review.country}, <time datetime="${formatDate(this.review.date_release, 'y-m-d')}">${formatDate(this.review.date_release, 'y')}</time>`;
#         extra_4 = `${this.review.running_time} minutes`;
#         break;

#       case 'art_visual':
#         medium = 'Visual art';
#         extra = this.review.venue;
#         extra_2 = `<time datetime="${formatDate(this.review.date_opening, 'y-m-d')}">${formatDate(this.review.date_opening)}</time> to <time datetime="${formatDate(this.review.date_closing, 'y-m-d')}">${formatDate(this.review.date_closing)}</time>`;
#         break;

#       case 'music_performed':
#         medium = 'Live music';
#         extra = this.review.venue;
#         extra_2 = `<time datetime="${formatDate(this.review.date_event, 'y-m-d')}">${formatDate(this.review.date_event)}</time>`;
#         break;

#       case 'music_recorded':
#         medium = 'Recorded music';
#         extra = `By ${createExtraString(this.review.artist)}`;
#         extra_2 = `${this.review.label}, <time datetime="${formatDate(this.review.date_release, 'y-m-d')}">${formatDate(this.review.date_release, 'y')}</time>`;
#         break;
#     }

#     return {
#       id: id, 
#       medium: medium,
#       title: title, 
#       extra: extra, 
#       extra_2: extra_2,
#       extra_3: extra_3, 
#       extra_4: extra_4, 
#       img_thumb: img_thumb, 
#       img_main: img_main,
#       img_main_caption: img_main_caption
#     };
#   }
# }

# module.exports = ListingData; 
