require "administrate/base_dashboard"

class SpaDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    address: Field::String,
    bookmarks: Field::HasMany,
    tag_list: StringTagField,
    business_time: Field::String,
    charactor: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    family_bath_info: Field::String,
    have_family_bath: Field::Boolean,
    holiday: Field::String,
    image: Field::String,
    is_child_bathing: Field::String,
    lat: Field::Number.with_options(decimals: 2),
    lng: Field::Number.with_options(decimals: 2),
    location: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    message: Field::String,
    name: Field::String,
    parking: Field::String,
    photo_no: Field::Number,
    place: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    place_id: Field::String,
    price: Field::String,
    spa_url: Field::Text,
    spring_quality: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    telephone_number: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    name
    address
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    tag_list
    address
    business_time
    charactor
    family_bath_info
    have_family_bath
    holiday
    image
    is_child_bathing
    lat
    lng
    location
    message
    parking
    photo_no
    place
    place_id
    price
    spa_url
    spring_quality
    telephone_number
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    address
    tag_list
    business_time
    charactor
    family_bath_info
    have_family_bath
    holiday
    image
    is_child_bathing
    lat
    lng
    location
    message
    parking
    photo_no
    place
    place_id
    price
    spa_url
    spring_quality
    telephone_number
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how spas are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(spa)
  #   "Spa ##{spa.id}"
  # end
end
