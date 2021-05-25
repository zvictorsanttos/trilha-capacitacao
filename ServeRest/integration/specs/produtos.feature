#language: pt

Funcionalidade: Produtos
    

        Contexto: Pagina do site
            Dado que esteja no site https://serverest.dev/
        
        #GET
        Cenário: Listar produtos cadastrados
            Quando acessar a rota /produtos
            Então deverá retornar schema "get_prods" e "<status>" com "<mensagem>"

        Esquema do Cenário: Buscar produto por ID
            Quando acessar a rota /produtos/{_id}
            E o produto for "<ID>"
            Então deverá retornar schema "get_prods_by_id" e "<status>" com "<mensagem>"
                Exemplos:
                    | ID       | status | mensagem               |
                    | válido   | 200    | produto encontrado     |
                    | inválido | 400    | produto não encontrado |
        
        #POST
        Esquema do Cenário: Cadastrar produtos
            Quando acessar a rota /produtos
            E preencher "<string>"
            Então deverá retornar schema "post_prod" e "<status>" com "<mensagem>"
                Exemplos:
                    | string   | status | mensagem                            |
                    | válido   | 201    | cadastro com sucesso                |
                    | inválido | 400    | ja existe produto com esse nome     |
                    | inválido | 401    | token ausente, inválido ou expirado |
                    | inválido | 403    | rota exclusiva para administradores |
        
        #DELETE
        Esquema do Cenário: Excluir produto
            Quando acessar a página /produtos/{_id}
            E selecionar o ID do produto
            Então deverá retornar schema "delete_prod_by_id" e "<status>" com "<mensagem>"
                Exemplos:
                    | status | mensagem                            |
                    | 200    | registro excluido com sucesso       |
                    | 400    | produto faz parte do carrinho       |
                    | 401    | token ausente, inválido ou expirado |
                    | 403    | rota exclusiva para administradores |

        #PUT
        Esquema do Cenário: Editar produto
            Quando acessar a pagina /produtos/{_id}
            E selecionar o "<ID>"
            E alterar informações do produto
            Então deverá retornar schema "put_prod_by_id" e "<status>" com "<mensagem>"
                Exemplos:
                    | ID       | status | mensagem                            |
                    | válido   | 200    | Alterado com sucesso                |
                    | válido   | 201    | cadastro com sucesso                |
                    | inválido | 400    | ja existe produto com esse nome     |
                    | inválido | 401    | token ausente, inválido ou expirado |
                    | inválido | 403    | rota exclusiva para administradores |