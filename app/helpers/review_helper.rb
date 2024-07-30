module ReviewHelper
  def medium(medium)
    if medium == "theatre"
      "Theatre"
    elsif medium == "cinema"
      "Cinema"
    elsif medium == "music_recorded"
      "Recorded music"
    end
  end

  def extra(medium, name)
    if medium == "theatre"
      sanitize("By <span>#{name}</span>")
    elsif medium == "cinema"
      sanitize("Directed by <span>#{name}</span>")
    elsif medium == "music_recorded"
      sanitize("By <span>#{name}</span>")
    end
  end

  def extra_2(medium, name)
    if medium == "theatre"
      sanitize("Directed by <span>#{name}</span>")
    end
  end

  def extra_3(medium, name)
    if medium == "theatre"
      name
    end
  end

  def extra_4(medium, date_opening, date_closing)
    if medium == "theatre"
      sanitize("<time datetime='#{date_opening}'>#{date_opening}</time> to <time datetime='#{date_closing}'>#{date_closing}</time>")
    end
  end
end

#       medium = 'Theatre',
#       extra = `By ${createExtraString(this.review.writer)}`;
#       extra_2 = `Directed by ${createExtraString(this.review.director)}`;
#       extra_3 = this.review.venue;
#       extra_4 = `<time datetime="${formatDate(this.review.date_opening, 'y-m-d')}">${formatDate(this.review.date_opening)}</time> to <time datetime="${formatDate(this.review.date_closing, 'y-m-d')}">${formatDate(this.review.date_closing)}</time>`;
#       break;
