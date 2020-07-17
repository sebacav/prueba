class PersonSerializer < ActiveModel::Serializer
  # the serializer permit, to filter a specific struct from the database
  # in this case, i remove the automatic id that RoR make, because is not part of the model to show
  attributes :nationalId, :name, :lastName, :age, :originPlanet, :pictureUrl
end
