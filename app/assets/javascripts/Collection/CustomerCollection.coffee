AM.Collection or (AM.Collection = {})

AM.Collection.CustomerCollection = Backbone.Collection.extend (
   model: AM.Model.Customer
   url: "am_server/customer/partial"
)
