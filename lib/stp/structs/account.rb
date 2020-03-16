module STP
  module Structs
    class Account
      attr_accessor :account,                            # cuenta
                    :company,                            # empresa
                    :name,                               # nombre
                    :paternal_surname,                   # apellidoPaterno
                    :maternal_surname,                   # apellidoMaterno
                    :rfc,                                # rfcCurp
                    :birthdate,                          # fechaNacimiento
                    :sex,                                # genero
                    :state,                              # entidadFederativa
                    :economic_activity,                  # actividadEconomica
                    :street,                             # calle
                    :exterior_number,                    # numeroExterior
                    :interior_number,                    # numeroInterior
                    :neighborhood,                       # colonia
                    :municipality,                       # alcaldiaMunicipio
                    :zip_code,                           # cp
                    :country,                            # pais
                    :email,                              # email
                    :identification_id,                  # idIdentificacion: credencial para votar (INE/IFE)
                    :phone,                              # telefono
                    :signature

      def initialize
        @company = STP.company
      end

      def original_chain
        "||#{@company}|"\
          "#{@account}|"\
          "#{@rfc}||"
      end

      def as_json(_options = {})
        {
          cuenta: @account,
          empresa: @company,
          nombre: @name,
          apellidoPaterno: @paternal_surname,
          apellidoMaterno: @maternal_surname,
          rfcCurp: @rfc,
          fechaNacimiento: @birthdate,
          genero: @sex,
          entidadFederativa: @state,
          actividadEconomica: @economic_activity,
          calle: @street,
          numeroExterior: @exterior_number,
          numeroInterior: @interior_number,
          colonia: @neighborhood,
          alcaldiaMunicipio: @municipality,
          cp: @zip_code,
          pais: @country,
          email: @email,
          idIdentificacion: @identification_id,
          telefono: @phone,
          firma: @signature,
        }.compact
      end

      def to_json(*options)
        as_json(*options).to_json(*options)
      end
    end
  end
end
