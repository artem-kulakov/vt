# frozen_string_literal: true

require 'application_system_test_case'

class CompaniesTest < ApplicationSystemTestCase
  setup do
    @company = companies(:one)
  end

  test 'visiting the index' do
    visit companies_url
    assert_selector 'h1', text: 'Companies'
  end

  test 'creating a Company' do
    visit companies_url
    click_on 'New Company'

    fill_in 'Address', with: @company.address
    fill_in 'Alias', with: @company.alias
    fill_in 'Cadena verificacion', with: @company.cadena_verificacion
    fill_in 'Company type', with: @company.company_type
    fill_in 'Industry', with: @company.industry
    fill_in 'Name', with: @company.name
    fill_in 'Razon social', with: @company.razon_social
    fill_in 'Rfc', with: @company.rfc
    fill_in 'Type a day cost', with: @company.type_a_day_cost
    fill_in 'Type a km cost', with: @company.type_a_km_cost
    fill_in 'Type a name', with: @company.type_a_name
    fill_in 'Type b day cost', with: @company.type_b_day_cost
    fill_in 'Type b km cost', with: @company.type_b_km_cost
    fill_in 'Type b name', with: @company.type_b_name
    fill_in 'Type c day cost', with: @company.type_c_day_cost
    fill_in 'Type c km cost', with: @company.type_c_km_cost
    fill_in 'Type c name', with: @company.type_c_name
    fill_in 'Type d day cost', with: @company.type_d_day_cost
    fill_in 'Type d km cost', with: @company.type_d_km_cost
    fill_in 'Type d name', with: @company.type_d_name
    click_on 'Create Company'

    assert_text 'Company was successfully created'
    click_on 'Back'
  end

  test 'updating a Company' do
    visit companies_url
    click_on 'Edit', match: :first

    fill_in 'Address', with: @company.address
    fill_in 'Alias', with: @company.alias
    fill_in 'Cadena verificacion', with: @company.cadena_verificacion
    fill_in 'Company type', with: @company.company_type
    fill_in 'Industry', with: @company.industry
    fill_in 'Name', with: @company.name
    fill_in 'Razon social', with: @company.razon_social
    fill_in 'Rfc', with: @company.rfc
    fill_in 'Type a day cost', with: @company.type_a_day_cost
    fill_in 'Type a km cost', with: @company.type_a_km_cost
    fill_in 'Type a name', with: @company.type_a_name
    fill_in 'Type b day cost', with: @company.type_b_day_cost
    fill_in 'Type b km cost', with: @company.type_b_km_cost
    fill_in 'Type b name', with: @company.type_b_name
    fill_in 'Type c day cost', with: @company.type_c_day_cost
    fill_in 'Type c km cost', with: @company.type_c_km_cost
    fill_in 'Type c name', with: @company.type_c_name
    fill_in 'Type d day cost', with: @company.type_d_day_cost
    fill_in 'Type d km cost', with: @company.type_d_km_cost
    fill_in 'Type d name', with: @company.type_d_name
    click_on 'Update Company'

    assert_text 'Company was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Company' do
    visit companies_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Company was successfully destroyed'
  end
end
