ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # Here is an example of a simple dashboard with columns and panels.

    columns do
      column do
        panel "Info" do
          para "Welcome to ActiveAdmin for WeChef."
        end
      end
    end

    columns do
      column do
        panel "Recent Bookings" do
          ul do
            Booking.last(5).map do |b|
              li link_to("#{b.id} #{b.date}", admin_booking_path(b))
            end
          end
        end
      end

      column do
        panel "Recent Chefs" do
          ul do
            Chef.last(5).map do |c|
              li link_to("#{c.id} #{c.name}", admin_chef_path(c))
            end
          end
        end
      end

      column do
        panel "Recent Restaurants" do
          ul do
            Restaurant.last(5).map do |r|
              li link_to("#{r.id} #{r.name}", admin_restaurant_path(r))
            end
          end
        end
      end
    end
  end # content
end
