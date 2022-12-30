<%= search_form_for @q, url: url do |f| %>
  <%= f.search_field :title_or_body_cont, class: 'form-control', placeholder: '検索ワード' %>
  <%= f.submit '検索', class: 'btn btn-primary' %>
<% end %>