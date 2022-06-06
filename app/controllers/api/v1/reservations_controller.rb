module Api
  module V1
    class ReservationsController < ApplicationController
      before_action :set_reservation, only: %i[ show update destroy ]

      # GET /reservations
      def index
        @reservations = Reservation.all

        render json: @reservations, include: [:guest]
      end

      # GET /reservations/1
      def show
        render json: @reservation
      end

      # POST /reservations
      def create
        if params.has_key?(:reservation_code)
          @reservation = Reservation.airbnb_payload(airbnb_params)
        else
          @reservation = Reservation.booking_com_payload(booking_com_params)
        end

        if @reservation
          render json: @reservation, status: :created
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /reservations/1
      def update
        if params.has_key?(:reservation_code)
          @reservation = Reservation.airbnb_payload(airbnb_params)
        else
          @reservation = Reservation.booking_com_payload(booking_com_params)
        end

        if @reservation
          render json: @reservation
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      end

      # DELETE /reservations/1
      def destroy
        @reservation.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_reservation
          @reservation = Reservation.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def airbnb_params
          params.permit(:id, :reservation_code, :start_date, :end_date, :nights, :guests, :adults, :children, :infants, :status, :currency, :payout_price, :security_price, :total_price, guest: [:first_name, :last_name, :phone, :email])
        end

        def booking_com_params
          params.permit(:id, reservation: [:code, :guest_id, :start_date, :end_date, :expected_payout_amount , :guest_email, :guest_first_name, :guest_last_name, :listing_security_price_accurate, :host_currency, :nights, :number_of_guests, :status_type, :total_paid_amount_accurate, guest_details: [:number_of_nights, :localized_description, :number_of_adults, :number_of_children, :number_of_infants], guest_phone_numbers:[]])
        end
    end
  end
end