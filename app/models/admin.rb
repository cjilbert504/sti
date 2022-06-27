class Admin < User
  def to_view_path
    type.downcase.pluralize
  end
end
