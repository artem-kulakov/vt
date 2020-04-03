require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post companies_url, params: { company: { address: @company.address, alias: @company.alias, cadena_verificacion: @company.cadena_verificacion, company_type: @company.company_type, industry: @company.industry, name: @company.name, razon_social: @company.razon_social, rfc: @company.rfc, type_a_day_cost: @company.type_a_day_cost, type_a_km_cost: @company.type_a_km_cost, type_a_name: @company.type_a_name, type_b_day_cost: @company.type_b_day_cost, type_b_km_cost: @company.type_b_km_cost, type_b_name: @company.type_b_name, type_c_day_cost: @company.type_c_day_cost, type_c_km_cost: @company.type_c_km_cost, type_c_name: @company.type_c_name, type_d_day_cost: @company.type_d_day_cost, type_d_km_cost: @company.type_d_km_cost, type_d_name: @company.type_d_name } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: { company: { address: @company.address, alias: @company.alias, cadena_verificacion: @company.cadena_verificacion, company_type: @company.company_type, industry: @company.industry, name: @company.name, razon_social: @company.razon_social, rfc: @company.rfc, type_a_day_cost: @company.type_a_day_cost, type_a_km_cost: @company.type_a_km_cost, type_a_name: @company.type_a_name, type_b_day_cost: @company.type_b_day_cost, type_b_km_cost: @company.type_b_km_cost, type_b_name: @company.type_b_name, type_c_day_cost: @company.type_c_day_cost, type_c_km_cost: @company.type_c_km_cost, type_c_name: @company.type_c_name, type_d_day_cost: @company.type_d_day_cost, type_d_km_cost: @company.type_d_km_cost, type_d_name: @company.type_d_name } }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end
