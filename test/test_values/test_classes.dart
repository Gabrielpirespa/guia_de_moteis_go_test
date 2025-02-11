import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/api_response_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/categoria_itens_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/data_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/discount_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/itens_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/motel_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/periodos_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/data/models/suite_model.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/api_response_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/categoria_itens_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/data_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/discount_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/itens_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/motel_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/periodos_entity.dart';
import 'package:guia_de_moteis_application/app/modules/motel_info/domain/entities/suite_entity.dart';

ApiResponseModel testApiResponseModel = const ApiResponseModel(
  sucesso: true,
  data: DataModel(
    pagina: 1,
    qtdPorPagina: 10,
    totalSuites: 0,
    totalMoteis: 1,
    raio: 0,
    maxPaginas: 1.0,
    moteis: [
      MotelModel(
        fantasia: "Motel Uberlândia",
        logo:
            "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif",
        bairro: "Centro - Uberlândia",
        distancia: 19.19,
        qtdFavoritos: 0,
        suites: [
          SuiteModel(
            nome: "Suite Paris",
            qtd: 1,
            exibirQtdDisponiveis: true,
            fotos: [
              "https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/64838168-0e40-4087-bc99-445ee4a0754b-suites.jpg",
              "https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/eaaad10a-654a-432f-ac19-ec0db9505c70-suites.jpg",
            ],
            itens: [
              ItensModel(nome: "TV a cabo"),
              ItensModel(nome: "pole dance"),
            ],
            categoriaItens: [
              CategoriaItensModel(
                nome: "Decoração Erótica",
                icone:
                    "https://cdn.guiademoteis.com.br/Images/itens-suites/decoracao-erotica-30-10-2023-11-43.png",
              ),
              CategoriaItensModel(
                nome: "Pole Dance",
                icone:
                    "https://cdn.guiademoteis.com.br/Images/itens-suites/pole-dance-15-05-2020-10-49.png",
              ),
            ],
            periodos: [
              PeriodosModel(
                tempoFormatado: "3 horas",
                tempo: "3",
                valor: 129.0,
                valorTotal: 129.0,
                temCortesia: false,
                desconto: null,
              ),
              PeriodosModel(
                tempoFormatado: "6 horas",
                tempo: "6",
                valor: 162.0,
                valorTotal: 162.0,
                temCortesia: false,
                desconto: null,
              ),
              PeriodosModel(
                tempoFormatado: "12 horas",
                tempo: "12",
                valor: 184.0,
                valorTotal: 115.6,
                temCortesia: false,
                desconto: DiscountModel(
                  desconto: 68.4,
                ),
              )
            ],
          ),
          SuiteModel(
            nome: "Suite Amsterdan",
            qtd: 1,
            exibirQtdDisponiveis: true,
            fotos: [
              "https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/64838168-0e40-4087-bc99-445ee4a0754b-suites.jpg",
              "https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/eaaad10a-654a-432f-ac19-ec0db9505c70-suites.jpg",
            ],
            itens: [
              ItensModel(nome: "TV a cabo"),
              ItensModel(nome: "pole dance"),
            ],
            categoriaItens: [
              CategoriaItensModel(
                nome: "Decoração Erótica",
                icone:
                    "https://cdn.guiademoteis.com.br/Images/itens-suites/decoracao-erotica-30-10-2023-11-43.png",
              ),
              CategoriaItensModel(
                nome: "Pole Dance",
                icone:
                    "https://cdn.guiademoteis.com.br/Images/itens-suites/pole-dance-15-05-2020-10-49.png",
              ),
            ],
            periodos: [
              PeriodosModel(
                tempoFormatado: "3 horas",
                tempo: "3",
                valor: 139.0,
                valorTotal: 139.0,
                temCortesia: false,
                desconto: null,
              ),
              PeriodosModel(
                tempoFormatado: "6 horas",
                tempo: "6",
                valor: 182.0,
                valorTotal: 182.0,
                temCortesia: false,
                desconto: null,
              ),
              PeriodosModel(
                tempoFormatado: "12 horas",
                tempo: "12",
                valor: 184.0,
                valorTotal: 115.6,
                temCortesia: false,
                desconto: DiscountModel(
                  desconto: 68.4,
                ),
              )
            ],
          )
        ],
        qtdAvaliacoes: 1200,
        media: 4.4,
      ),
    ],
  ),
  mensagem: [],
);

ApiResponseEntity testApiResponseEntity = const ApiResponseEntity(
  sucesso: true,
  data: DataEntity(
    pagina: 1,
    qtdPorPagina: 10,
    totalSuites: 0,
    totalMoteis: 1,
    raio: 0,
    maxPaginas: 1.0,
    moteis: [
      MotelEntity(
        fantasia: "Motel Uberlândia",
        logo:
            "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif",
        bairro: "Centro - Uberlândia",
        distancia: 19.19,
        qtdFavoritos: 0,
        suites: [
          SuiteEntity(
            nome: "Suite Paris",
            qtd: 1,
            exibirQtdDisponiveis: true,
            fotos: [
              "https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/64838168-0e40-4087-bc99-445ee4a0754b-suites.jpg",
              "https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/eaaad10a-654a-432f-ac19-ec0db9505c70-suites.jpg",
            ],
            itens: [
              ItensEntity(nome: "TV a cabo"),
              ItensEntity(nome: "pole dance"),
            ],
            categoriaItens: [
              CategoriaItensEntity(
                nome: "Decoração Erótica",
                icone:
                    "https://cdn.guiademoteis.com.br/Images/itens-suites/decoracao-erotica-30-10-2023-11-43.png",
              ),
              CategoriaItensEntity(
                nome: "Pole Dance",
                icone:
                    "https://cdn.guiademoteis.com.br/Images/itens-suites/pole-dance-15-05-2020-10-49.png",
              ),
            ],
            periodos: [
              PeriodosEntity(
                tempoFormatado: "3 horas",
                tempo: "3",
                valor: 129.0,
                valorTotal: 129.0,
                temCortesia: false,
                desconto: null,
              ),
              PeriodosEntity(
                tempoFormatado: "6 horas",
                tempo: "6",
                valor: 162.0,
                valorTotal: 162.0,
                temCortesia: false,
                desconto: null,
              ),
              PeriodosEntity(
                tempoFormatado: "12 horas",
                tempo: "12",
                valor: 184.0,
                valorTotal: 115.6,
                temCortesia: false,
                desconto: DiscountEntity(
                  desconto: 68.4,
                ),
              )
            ],
          ),
          SuiteEntity(
            nome: "Suite Amsterdan",
            qtd: 1,
            exibirQtdDisponiveis: true,
            fotos: [
              "https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/64838168-0e40-4087-bc99-445ee4a0754b-suites.jpg",
              "https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/eaaad10a-654a-432f-ac19-ec0db9505c70-suites.jpg",
            ],
            itens: [
              ItensEntity(nome: "TV a cabo"),
              ItensEntity(nome: "pole dance"),
            ],
            categoriaItens: [
              CategoriaItensEntity(
                nome: "Decoração Erótica",
                icone:
                    "https://cdn.guiademoteis.com.br/Images/itens-suites/decoracao-erotica-30-10-2023-11-43.png",
              ),
              CategoriaItensEntity(
                nome: "Pole Dance",
                icone:
                    "https://cdn.guiademoteis.com.br/Images/itens-suites/pole-dance-15-05-2020-10-49.png",
              ),
            ],
            periodos: [
              PeriodosEntity(
                tempoFormatado: "3 horas",
                tempo: "3",
                valor: 139.0,
                valorTotal: 139.0,
                temCortesia: false,
                desconto: null,
              ),
              PeriodosEntity(
                tempoFormatado: "6 horas",
                tempo: "6",
                valor: 182.0,
                valorTotal: 182.0,
                temCortesia: false,
                desconto: null,
              ),
              PeriodosEntity(
                tempoFormatado: "12 horas",
                tempo: "12",
                valor: 184.0,
                valorTotal: 115.6,
                temCortesia: false,
                desconto: DiscountEntity(
                  desconto: 68.4,
                ),
              )
            ],
          )
        ],
        qtdAvaliacoes: 1200,
        media: 4.4,
      ),
    ],
  ),
  mensagem: [],
);
