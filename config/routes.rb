MyDocumentor::Application.routes.draw do
  resources :teams_tests

  resources :team_tests

  resources :test_teams

  resources :uploads

  resources :departments

  resources :teams

  get "welcome/index"

  resources :test_results
  match "test_results_integrated_view"=>"test_results#integrated_view"

  resources :examples

  resources :tests

  resources :blank_sections

  resources :components

  resources :documents

  resources :dockets

  devise_for :users

  match 'docket_integrated_view'=>'dockets#integrated_view'
  match 'document_integrated_view'=>'documents#integrated_view'
  match 'component_integrated_view'=>'components#integrated_view'
  match 'test_integrated_view'=>'tests#integrated_view'
  match 'example_integrated_view'=>'examples#integrated_view'

  match 'document_customize_view'=>'documents#document_customize_view'
  match '/documents/structure_form/:doc_id/:count'=> "documents#structure_form"
  match 'add_documents/:docket_id'=>'dockets#add_documents'
  match 'confirm_documents'=>'dockets#confirm_documents'
  match 'list_documents'=>'tests#list_of_documents'
  match 'generate_test_document'=>'tests#generate_test_document'
  match 'generate_test_document'=>'tests#generate_test_document'
  match 'save_results'=>'test_management#save_results'
  match 'evaluate_results'=>'practice_management#evaluate_results'

  match 'documentor'=>'welcome#documentor_view'
  match 'admin'=>'welcome#admin_view'
  match 'user'=>'welcome#user_view'


  get 'user_management'=>'user_management#index'
  get 'test_management'=>'test_management#index'
  match 'upload_users'=>'user_management#upload_users'
  match 'add_users'=>'user_management#add_users'
  match 'department_management'=>'user_management#department_management'
  match 'practice_management'=>'practice_management#index'

  match 'get_available_users/:team_id'=>'user_management#get_available_users'
  match 'get_team_users/:team_id'=>'user_management#get_team_users'
  match 'remove_team_user/:team_id/:user_id'=>'user_management#remove_team_user'
  match "add_docket"=>'tests#add_docket'
  match "add_document"=>'tests#add_document'
  match 'take_test'=>'test_management#take_test'
  match 'result_management'=>'test_result_management#index'
  match 'view_results'=>'test_result_management#view_results'
  match 'view_corrected_document'=>'test_result_management#view_corrected_document'
  match 'practice_document'=>'practice_management#practice_document'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
